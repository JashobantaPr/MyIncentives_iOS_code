import 'package:incentivesgit/core/app_export.dart';
import 'package:incentivesgit/presentation/rewards/scanqrcode/controller/scanqrcode_controller.dart';

class ScanQRCodeBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => ScanQRCodeController());
  }
}
