import 'package:flutter/material.dart';
import 'package:webview/Utils/constant.dart';

class CommonBottomSheet {
  static void showModalSheet(BuildContext context, Widget child) {
    showModalBottomSheet(
        context: context,
        backgroundColor: AppColor.whiteBgColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        isScrollControlled: true,
        isDismissible: true,
        useRootNavigator: false,
        builder: (builder) {
          return Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              height: MediaQuery.of(context).size.height / 1.3,
              child: child);
        });
  }
}
