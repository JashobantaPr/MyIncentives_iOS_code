import 'package:get/get.dart';
import 'package:incentivesgit/presentation/homebottombar/account/service/my_account_service.dart';

class AccountController extends GetxController {
  Future<bool> deletetoken() async {
    bool? tokendeleted = await MyAccountService().deleteuserToken();
    if (tokendeleted) {
      print('User token deleted successfully');
      return true;
    } else {
      print('Token Not Delete');
      return false;
    }
  }

  Future<bool> deletefcmtoken() async {
    bool? fcmtokendeleted = await MyAccountService().fcmTokenDelete();
    if (fcmtokendeleted) {
      print('FCM token deleted successfully');
      return true;
    } else {
      print('Token Not Delete');
      return false;
    }
  }
}
