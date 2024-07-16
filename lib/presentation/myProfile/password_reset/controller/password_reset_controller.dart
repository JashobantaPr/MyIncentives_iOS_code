import 'package:get/get.dart';

class PasswordResetController extends GetxController {
  final currentPassword = false.obs;
  final newPasswordVisible = false.obs;
  final retypenewPassword = false.obs;


  void togglePasswordVisibility() {
    currentPassword.toggle();
  }

  void toggleNewPasswordVisibility() {
    newPasswordVisible.toggle();
  }
   void toggleReTypeNewPasswordVisibility() {
    retypenewPassword.toggle();
  }
}
