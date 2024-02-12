import 'package:get/get.dart';

import 'font_controller.dart';

class FontBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<FontController>(() => FontController());
  }
}
