import 'package:get/get.dart';
import 'package:incentivesgit/presentation/help&support/customersupport_1/controller/customersupport_1_controller.dart';


class CustomerSupport1Binding extends Bindings {
  @override
  void dependencies() {
        Get.lazyPut(() => CustomerSupport1Controller());

  }
}
