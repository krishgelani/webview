import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview/Utils/constant.dart';

import 'Emojis/emojis_list.dart';

class KaomojiController extends GetxController {
  List<Map<String, List<String>>> kaomojiEmojis = [
    happyKaomojis,
    sadKaomojis,
    sadWinkingKaomojis,
    surprisedKaomojis,
    cryingKaomojis,
    laughingKaomojis,
    angryKaomojis,
    sleepingKaomojis,
    loveKaomojis,
    shyKaomojis,
  ];

  List<Color> colorList = [
    AppColor.happyColor,
    AppColor.sadColor,
    AppColor.winkColor,
    AppColor.surpriseColor,
    AppColor.cryColor,
    AppColor.laughColor,
    AppColor.angryColor,
    AppColor.sleepColor,
    AppColor.loveColor,
    AppColor.shyColor,
  ];
}
