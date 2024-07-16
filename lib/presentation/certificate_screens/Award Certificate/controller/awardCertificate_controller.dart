import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:incentivesgit/presentation/certificate_screens/Award%20Certificate/Service/awardCertificate_service.dart';
import 'package:incentivesgit/presentation/certificate_screens/Award%20Certificate/customLoading.dart';
import 'package:incentivesgit/presentation/certificate_screens/Award%20Certificate/model/awardCertificate_model.dart';
import 'package:incentivesgit/presentation/certificate_screens/certificate_7/controller/certificate_7_controller.dart';
import 'package:just_audio/just_audio.dart';

class AwardCertificateController extends GetxController {
  final TextEditingController discription = TextEditingController();
  final TextEditingController serchcontroller = TextEditingController();

  final ScrollController scrollController = ScrollController();

  final getCertificate = Get.find<Certificate7Controller>();

  var selectedOption1 = false.obs;
  var selectedOption2 = false.obs;
  var isSelected = ''.obs;
  var isUserExpanded = false.obs;
  var selectedRadio = 'text'.obs;
  var isDescriptionExpanded = false.obs;
  var isBehaviourExpanded = false.obs;

  var isCancelTapped = false.obs;
  var isBuzzTapped = false.obs;
  var isImageRemoving = false.obs;
  OverlayEntry? overlayEntry;

  var stepsCompleted = [false, false, false].obs;

  void selectOption1(bool value) {
    selectedOption1.value = value;
    if (value) selectedOption2.value = false;
  }

  void selectOption2(bool value) {
    selectedOption2.value = value;
    if (value) selectedOption1.value = false;
  }

  void toggleBehaviourExpanded() {
    isBehaviourExpanded.value = !isBehaviourExpanded.value;
  }

  void toggleCancel() {
    if (!isCancelTapped.value) {
      isCancelTapped.value = true;
      isBuzzTapped.value = false;
    }
  }

  void toggleBuzz() {
    if (!isBuzzTapped.value) {
      isBuzzTapped.value = true;
      isCancelTapped.value = false;
    }
  }

  var scopeId = ''.obs;
  var scopeName = ''.obs;

  var userList = <User>[].obs;
  var isLoading = true.obs;
  var filteredUsers = <User>[].obs;
  var selectedUsers = <User>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserSearchList();
    step2discription();
    player.durationStream.listen((d) {
      duration.value = d ?? Duration.zero;
    });
    player.positionStream.listen((p) {
      position.value = p;
    });
    getArguments();
  }

  void getArguments() {
    final arguments = Get.arguments as Map<String, dynamic>;
    scopeId.value = arguments['scopeId'];
    scopeName.value = arguments['scopeName'];
  }


  void updateStepCompletion() {
    stepsCompleted[0] = selectedUsers.isNotEmpty;
    stepsCompleted[1] = discription.text.isNotEmpty ||
        discription.text != "" ||
        pickedFilePath.isNotEmpty;
    stepsCompleted[2] = pickedFilePath.isNotEmpty;
  }

  void fetchUserSearchList() async {
    try {
      isLoading(true);
      UserResponse response = await BuzzService().buzzUserSearch(selectedUsers);
      userList.assignAll(response.userdata);
      // filteredUsers
      //     .assignAll(userList);
    } catch (e) {
      print("Failed to fetch user list: $e");
    } finally {
      isLoading(false);
    }
  }

  void filterUsers(String value) {
    print(value);
    if (value.isEmpty) {
      filteredUsers.clear();
    } else {
      filteredUsers.value = userList.where((user) {
        return user.firstName!.toLowerCase().contains(value.toLowerCase()) ||
            user.lastName!.toLowerCase().contains(value.toLowerCase());
      }).toList();
    }
  }

  void addUserToSelection(User user) {
    selectedUsers.add(user);
    filteredUsers.clear();
    fetchUserSearchList();
    updateStepCompletion();
  }

  void step2discription() {
    updateStepCompletion();
  }

  void removeUserFromSelection(User user) {
    selectedUsers.remove(user);
  }

  //audiosection

  final player = AudioPlayer();
  var pickedFilePath = ''.obs;
  var isPlaying = false.obs;
  var duration = Duration.zero.obs;
  var position = Duration.zero.obs;

  Future<void> pickAudioFile() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.audio);

    if (result != null && result.files.single.path != null) {
      pickedFilePath.value = result.files.single.path!;
      await playAudio(pickedFilePath.value);
    }
    updateStepCompletion();
  }

  Future<void> playAudio(String path) async {
    try {
      await player.setFilePath(path);
      player.play();
      isPlaying.value = true;

      player.playerStateStream.listen((state) {
        if (state.processingState == ProcessingState.completed) {
          isPlaying.value = false;
        }
      });
    } catch (e) {
      print("Error playing audio: $e");
    }
  }

  void stopAudio() {
    player.stop();
    isPlaying.value = false;
  }

  void removeAudioFile() {
    stopAudio();
    pickedFilePath.value = '';
  }

  // audio upload api

  Future<void> uploadaudio() async {
    toggleBuzz();
    try {
      isLoading(true);
      File audioFile = File(pickedFilePath.value);
      List<int> fileBytes = await audioFile.readAsBytes();
      String base64String = base64Encode(fileBytes);
      bool response = await BuzzService().uploadaudio(base64String);

      if (response) {
        // Handle success
        print("Audio uploaded successfully");
      } else {
        // Handle failure
        print("Failed to upload audio");
      }
    } catch (e) {
      print("Failed to upload audio: $e");
    } finally {
      isLoading(false);
    }
  }

  //buzz create api

  Future<void> Createbuzz() async {
    toggleBuzz();
    Get.dialog(CustomloadingScreen(), barrierDismissible: false);
    List<String> selectedUserIds =
        selectedUsers.map((user) => user.userIdPk!).toList();
    String seUserIds = jsonEncode(selectedUserIds);
    try {
      isLoading(true);
      final dynamic response = await BuzzService().createbuzz(
        getCertificate.selectedCertificate.value?.bucketIdFk,
        getCertificate.selectedCertificate.value?.certificateDetailSubtitle,
        getCertificate.selectedCertificate.value?.certificateMasterIdPk,
        seUserIds,
        discription.text,
        getCertificate.selectedCertificate.value?.certificateTypeIdFk,
      );
      if (response != null) {
        if (response['status'] == true) {
          print(response['msg']);
          Get.back();
          Get.back();
        } else {
          print("Failed to create certificate");
          Get.snackbar(
            'Error',
            'Failed to create buzz: ${response['msg']}',
            snackPosition: SnackPosition.BOTTOM,
            duration: Duration(seconds: 3),
          );
        }
      } else {
        print("Failed to create certificate");
      }
    } catch (e) {
      print("Failed to reate certificate: $e");
    } finally {
      isLoading(false);
    }
  }
}
