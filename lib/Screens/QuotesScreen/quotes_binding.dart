import 'package:get/get.dart';
import 'package:webview/Screens/QuotesScreen/quotes_controller.dart';

class QuotesBinding implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<QuotesController>(() => QuotesController());
  }
}
