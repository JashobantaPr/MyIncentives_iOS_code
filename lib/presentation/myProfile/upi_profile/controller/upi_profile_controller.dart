import 'package:flutter/material.dart';
import 'package:incentivesgit/core/app_export.dart';

class UpiProfileController extends GetxController {
  TextEditingController upiIdcontroller = TextEditingController();
  TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController lastnamecontroller = TextEditingController();
  RxBool isEditing = true.obs;
}
