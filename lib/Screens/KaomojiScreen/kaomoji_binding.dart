import 'package:get/get.dart';

import 'kaomoji_controller.dart';

class KaomojiBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<KaomojiController>(() => KaomojiController());
  }
}
