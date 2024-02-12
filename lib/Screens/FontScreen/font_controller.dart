import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'Styles/font_styles.dart';

class FontController extends GetxController {
  TextEditingController textEditingController = TextEditingController();
  RxString fontText = ''.obs;

  String transformToStyledText(String input, Map<String, String> style) {
    StringBuffer output = StringBuffer();

    for (int i = 0; i < input.length; i++) {
      output.write(style[input[i]] ?? input[i]);
    }

    return output.toString();
  }

  List<Map<String, String>> fontsList = [
    letterToEmojiMapping,
    enclosedAlphabeticMapping,
    scriptStyleMapping,
    gothicTextMapping,
    combinedDiacriticMapping,
    lineDiacriticMapping,
    fancyTextMapping,
    diacriticBottomStyleMapping,
    dottedDiacriticMapping,
    diacriticStyleMapping
  ];
}
