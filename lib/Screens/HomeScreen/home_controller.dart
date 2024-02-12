import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview/Routes/routes.dart';
import 'package:webview/Utils/constant.dart';
import 'package:webview/generated/assets.dart';

class HomeController extends GetxController {
  List name = [
    "Quotes",
    "Audio to Text",
    "Font",
    "Kaomoji",
  ];

  List icon = [
    Assets.imagesQuotes,
    Assets.imagesAudioText,
    Assets.imagesFont,
    Assets.imagesKaomoji,
  ];

  List navigateScreenName = [
    Routes.quotesScreen,
    Routes.audioToTextScreen,
    Routes.fontScreen,
    Routes.kaomojiScreen,
  ];

  List<Color> color = [
    AppColor.blueColor,
    AppColor.hanBlueColor,
    AppColor.greenAssentColor,
    AppColor.yellowDarkColor,
  ];
}
