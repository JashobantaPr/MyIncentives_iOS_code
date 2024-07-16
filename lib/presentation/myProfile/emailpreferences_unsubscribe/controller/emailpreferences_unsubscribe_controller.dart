import 'package:get/get.dart';

class EmailPreferencesUnsubscribeController extends GetxController {
  String _selectedValue = '';

  String get selectedValue => _selectedValue;

  void updateSelectedValue(String newValue) {
    _selectedValue = newValue;
    update();
  }
}
