import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/core/utils/cache_service.dart';
import 'package:incentivesgit/presentation/buzz_screens/buzzes_tabbar_post/model/buzzes_tabbar_post_model.dart';
import 'package:incentivesgit/presentation/buzz_screens/buzzes_tabbar_post/service/buzzespostservice.dart';
import 'package:intl/intl.dart';
import 'package:just_audio/just_audio.dart';
import 'package:video_player/video_player.dart';

import '../../Buzze_Tabbar/controller/buzzeTabBar_Controller.dart';

class BuzzesTababrPostController extends GetxController {
  final CacheService _cacheService = CacheService();
  TextEditingController commentcontroller = TextEditingController();

  final BuzzesTabBarController scopeController =
      Get.find<BuzzesTabBarController>();

  var isLoading = true.obs;
  var likedPosts = <String>[].obs;
  var buzzesdetails = Fetchedbuzzes().obs;

  final player = AudioPlayer();
  var isPlayings = false.obs;
  var isMuted = false.obs;
  var duration = Duration.zero.obs;
  var position = Duration.zero.obs;
  var playingindex = 0.obs;

  var fromDate = ''.obs;
  var toDate = ''.obs;

  @override
  void onInit() {
    fetchedbuzzes();
    super.onInit();
    player.durationStream.listen((d) {
      duration.value = d ?? Duration.zero;
    });
    player.positionStream.listen((p) {
      position.value = p;
    });
    player.playerStateStream.listen((state) {
      isPlayings.value = state.playing;
      if (state.processingState == ProcessingState.completed) {
        isPlayings.value = false;
        position.value = Duration.zero;
      }
    });
  }

  Future<void> selectDate(BuildContext context, bool isFromDate) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
      if (isFromDate) {
        fromDate.value = formattedDate;
      } else {
        toDate.value = formattedDate;
      }
    }
  }

  Future<void> playAudio(String url, int postIdindex) async {
    if (playingindex.value != postIdindex) {
      await stopAudio();
      playingindex.value = postIdindex;
    }
    try {
      await player.setUrl(url);
      player.play();
      isPlayings.value = true;
    } catch (e) {
      print("Error playing audio: $e");
    }
  }

  Future<void> stopAudio() async {
    await player.stop();
    isPlayings.value = false;
  }

  void toggleMute() {
    isMuted.value = !isMuted.value;
    player.setVolume(isMuted.value ? 0 : 1);
  }

  void seek(Duration position) {
    player.seek(position);
  }

// videoplayer

  late VideoPlayerController _controller;
  var isPlaying = false.obs;
  var isError = false.obs;
  var isInitialized = false.obs;

  VideoPlayerController get controller => _controller;

  Future<void> initializeVideoPlayer(String videoUrl,
      {bool autoPlay = false, bool isMuted = false}) async {
    try {
      Uri uri = Uri.parse(
          'https://s3.ap-south-1.amazonaws.com/grginternal/stage/COMP000080/video/$videoUrl');
      _controller = VideoPlayerController.networkUrl(
        uri,
        videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
      );

      await _controller.initialize();
      isInitialized.value = true;

      if (autoPlay) {
        playVideo();
      }

      _controller.setVolume(isMuted ? 0.0 : 1.0);
    } catch (e) {
      print('Error initializing video: $e');
      isError.value = true;
    }
  }

  void playVideo() {
    isPlaying.value = true;
    _controller.play();
  }

  void pauseVideo() {
    isPlaying.value = false;
    _controller.pause();
  }

  void togglePlayPause() {
    if (isPlaying.value) {
      pauseVideo();
    } else {
      playVideo();
    }
  }

  Future<void> fetchedbuzzes() async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
     String? companyCode = await _cacheService.getCompanyCode();

    try {
      isLoading.value = true;
      var bodyFields = {
        'own_id': userId ?? '',
        'company_id': companyId ?? '',
        'posts_type': 'Recognition',
        'comp_code': companyCode??'',
        'scope_id': scopeController.selectedScopeid.toString() ?? 'Global'
      };
      print('bodyFields$bodyFields');

      //scopeController.selectedScopeid.value ??

      var fetches = await BuzzesPostService().getbuzzes(bodyFields);
      buzzesdetails.value = fetches ?? Fetchedbuzzes();
    } catch (e) {
      print('No Buzzes  $e');
    } finally {
      isLoading.value = false;
    }
  }

  void likepost(String postId, String firstname, String lastname) async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
    try {
      var bodyFields = {
        'type': 'post',
        'last_name': lastname,
        'first_name': firstname,
        'user_id': userId ?? '',
        'company_id': companyId ?? '',
        'postid': postId,
        'com_post_id': ''
      };
      // Check if the post is already liked
      if (likedPosts.contains(postId)) {
        var dislike = await BuzzesPostService().removeLike(bodyFields);
        if (dislike == 'success') {
          likedPosts.remove(postId); // Remove from likedPosts list
        }
      } else {
        var like = await BuzzesPostService().addlike(bodyFields);
        if (like == 'success') {
          likedPosts.add(postId); // Add to likedPosts list
        }
      }
    } catch (e) {
      print('No Buzzes  $e');
    }
  }

  void addcomment(String postId, String firstName, String lastName) async {
    String? userId = await _cacheService.getUserId();
    String? companyId = await _cacheService.getCompanyId();
    try {
      var bodyFields = {
        'company_id': companyId ?? '',
        'own_id': userId ?? '',
        'postid': postId,
        'product_code': 'P00003',
        'f_name': firstName,
        'l_name': lastName,
        'comment': commentcontroller.text
      };
      await BuzzesPostService().addcomment(bodyFields);
      commentcontroller.clear();
    } catch (e) {
      print('No Buzzes  $e');
    }
  }

  void deletepost(String postId) async {
    String? userId = await _cacheService.getUserId();
    try {
      var bodyFields = {'user_id': userId ?? '', 'postid': postId};
      print('bodyFieldsdf$bodyFields');
      bool? deletepost = await BuzzesPostService().deletePost(bodyFields);
      print('deletepostc $deletepost');
      if (deletepost == true) {
        Get.back();
      } else {
        // Handle the case when deletepost is false or null
        // Show error message or perform other actions
      }
    } catch (e) {
      print('No Buzzes  $e');
    }
  }

  @override
  void onClose() {
    _controller.dispose();
    player.dispose();
    super.onClose();
  }
}
