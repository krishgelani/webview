import 'package:get/get.dart';

import 'password_controller.dart';

class PasswordBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<PasswordController>(() => PasswordController());
  }
}
