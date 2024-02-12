import 'package:get/get.dart';
import 'package:webview/Screens/SettingScreen/setting_controller.dart';

class SettingBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<SettingController>(() => SettingController());
  }
}
