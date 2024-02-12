import 'package:get/get.dart';

import 'att_controller.dart';

class AttBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<AttController>(() => AttController());
  }
}
