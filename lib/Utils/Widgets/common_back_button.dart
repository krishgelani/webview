import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview/Utils/constant.dart';

Widget commonBackButton() {
  return Padding(
    padding: const EdgeInsets.all(13.0),
    child: InkWell(
      onTap: () {
        Get.back();
      },
      child: Container(
        decoration: BoxDecoration(
            color: AppColor.greenColor, borderRadius: BorderRadius.circular(6)),
        child: const Icon(
          Icons.arrow_back_ios_new_outlined,
          color: AppColor.whiteColor,
          size: 18,
        ),
      ),
    ),
  );
}
