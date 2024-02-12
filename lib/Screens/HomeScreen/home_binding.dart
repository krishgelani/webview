import 'package:get/get.dart';
import 'package:webview/Screens/HomeScreen/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies

    Get.lazyPut<HomeController>(() => HomeController());
  }
}
