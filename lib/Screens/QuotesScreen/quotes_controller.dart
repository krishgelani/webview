import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webview/Data/Models/quotes_model.dart';
import 'package:webview/Screens/QuotesScreen/qoutes_data.dart';
import 'package:webview/Utils/constant.dart';
import 'package:webview/generated/assets.dart';

class QuotesController extends GetxController {
  RxList<QuotesModel> quotesData = <QuotesModel>[].obs;
  List<List<Color>> gradiantList = [
    [AppColor.pickLightBlueColor, AppColor.pickGreenColor],
    [AppColor.pinkLightColor, AppColor.redColor],
    [AppColor.blueColor, AppColor.blueAccentColor],
    [AppColor.amberDarkColor, AppColor.amberLightColor],
    [AppColor.purpleLightColor, AppColor.pickPurpleColor],
    [AppColor.pickPinkColor, AppColor.pinkLightColor],
  ];

  List<List> imageList = [
    [Assets.imagesFriend1, 1],
    [Assets.imagesFriend2, 1],
    [Assets.imagesHappy1, 2],
    [Assets.imagesHappy2, 2],
    [Assets.imagesHappy3, 1],
    [Assets.imagesHappy4, 1],
    [Assets.imagesHappy5, 1],
    [Assets.imagesHappy7, 1],
    [Assets.imagesLife1, 2],
    [Assets.imagesLife2, 2],
    [Assets.imagesLife5, 1],
    [Assets.imagesSad1, 1],
    [Assets.imagesSad2, 1],
    [Assets.imagesSad3, 2],
    [Assets.imagesSad4, 3],
    [Assets.imagesSad7, 1],
    [Assets.imagesSweet1, 1],
    [Assets.imagesSweet2, 1],
  ];

  @override
  void onInit() {
    getQuotesData();
    super.onInit();
  }

  void getQuotesData() {
    print(quotesJsonData.length);
    for (var i in quotesJsonData) {
      quotesData.add(QuotesModel.fromJson(i));
    }
  }

  void shareQuoteImage(Widget widget, BuildContext context, String text) async {
    final controller = ScreenshotController();
    final bytes = await controller.captureFromWidget(Material(
      child: widget,
    ));
    final appStorage = await getApplicationCacheDirectory();
    final file = File(
        '${appStorage.path}/${DateTime.now().microsecond}${DateTime.now().millisecond}.png');
    await file.writeAsBytes(bytes);
    final result = await Share.shareXFiles([XFile('${file.path}')], text: text);

    if (result.status == ShareResultStatus.success) {
      const snackBar = SnackBar(
        content: Text('Thank you for sharing the picture!'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void getQuoteImage(Widget widget, BuildContext context) async {
    final controller = ScreenshotController();
    final bytes = await controller.captureFromWidget(Material(
      child: widget,
    ));
    saveImage(bytes, context);
  }

  Future saveImage(Uint8List bytes, BuildContext context) async {
    final appStorage = await getApplicationCacheDirectory();
    final file = File(
        '${appStorage.path}/${DateTime.now().microsecond}${DateTime.now().millisecond}.png');
    await file.writeAsBytes(bytes);
    final result =
        await ImageGallerySaver.saveFile(file.path, isReturnPathOfIOS: true);
    print(result);
    print(result['isSuccess']);
    Fluttertoast.showToast(
        msg: "Download Successful",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColor.blackColor,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
