import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:incentivesgit/core/app_export.dart';

class PanProfileController extends GetxController {
  TextEditingController holderNamecontroller = TextEditingController();
  TextEditingController accountnumbercontroller = TextEditingController();
  TextEditingController banknamecontroller = TextEditingController();
  TextEditingController ifsccontroller = TextEditingController();
  TextEditingController singlefilecontroller = TextEditingController();
  var selectedProfileType = 'Self'.obs;
  RxBool isEditing = true.obs;

  void toggleEdit() {
    isEditing.value = !isEditing.value;
  }

  void chooseFile() async {
    // Open file picker
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      // Update text in TextField with the selected file's name
      String? fileName = result.files.single.name;
      singlefilecontroller.text = fileName;
    } else {
      // User canceled the picker
      print('User canceled the file picking.');
    }
  }

  void chooseFileCamera() async {
    // Open file picker
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      // Update text in TextField with the selected file's name
      String? fileName = pickedFile.name;
      singlefilecontroller.text = fileName;
    } else {
      // User canceled the picker
      print('User canceled the file picking.');
    }
  }
}
