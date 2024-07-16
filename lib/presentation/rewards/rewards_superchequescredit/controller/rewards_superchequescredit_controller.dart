import 'package:image_picker/image_picker.dart';
import 'package:incentivesgit/core/app_export.dart';

class RewardsSuperchequesCreditController extends GetxController {
  void chooseFileCamera() async {
    // Open file picker
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
    } else {
      // User canceled the picker
      print('User canceled the file picking.');
    }
  }
}
