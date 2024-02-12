import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:webview/Utils/Widgets/common_back_button.dart';
import 'package:webview/Utils/Widgets/text_widget.dart';
import 'package:webview/Utils/constant.dart';

import 'kaomoji_controller.dart';

class kaomojiDetailScreen extends StatefulWidget {
  const kaomojiDetailScreen({super.key});

  @override
  State<kaomojiDetailScreen> createState() => _kaomojiDetailScreenState();
}

class _kaomojiDetailScreenState extends State<kaomojiDetailScreen> {
  KaomojiController kaomojiController = Get.find();
  int currentIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    currentIndex = Get.arguments;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteBgColor,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        leading: commonBackButton(),
        title: TextWidget(
          kaomojiController.kaomojiEmojis[currentIndex].keys.elementAt(0),
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                // shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, mainAxisExtent: 120),
                itemCount: kaomojiController.kaomojiEmojis[currentIndex].values
                    .elementAt(0)
                    .length,
                itemBuilder: (BuildContext ctx, index) {
                  return GestureDetector(
                    onTap: () async {
                      await Clipboard.setData(ClipboardData(
                          text: kaomojiController
                              .kaomojiEmojis[currentIndex].values
                              .elementAt(0)[index]));
                      Fluttertoast.showToast(
                          msg: "Copy to Clipboard",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: AppColor.blackColor,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    },
                    child: Container(
                      height: 25.w,
                      width: 25.w,
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(6),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              blurRadius: 30,
                              offset: const Offset(0, 10),
                              spreadRadius: 0,
                            ),
                          ],
                          color: AppColor.whiteColor),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: TextWidget(
                              kaomojiController
                                  .kaomojiEmojis[currentIndex].values
                                  .elementAt(0)[index],
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            // Align(
            //   alignment: Alignment.topCenter,
            //   child: Wrap(
            //     children: [
            //       for (var i = 0;
            //           i <
            //               kaomojiController.kaomojiEmojis[currentIndex].values
            //                   .elementAt(0)
            //                   .length;
            //           i++)
            //         GestureDetector(
            //           onTap: () async {
            //             await Clipboard.setData(ClipboardData(
            //                 text: kaomojiController
            //                     .kaomojiEmojis[currentIndex].values
            //                     .elementAt(0)[i]));
            //             Fluttertoast.showToast(
            //                 msg: "Copy to Clipboard",
            //                 toastLength: Toast.LENGTH_SHORT,
            //                 gravity: ToastGravity.CENTER,
            //                 timeInSecForIosWeb: 1,
            //                 backgroundColor: AppColor.blackColor,
            //                 textColor: Colors.white,
            //                 fontSize: 16.0);
            //           },
            //           child: Container(
            //             height: 25.w,
            //             width: 25.w,
            //             padding: EdgeInsets.all(10),
            //             margin: EdgeInsets.all(10),
            //             alignment: Alignment.center,
            //             decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.circular(10),
            //                 color: AppColor.whiteColor),
            //             child: TextWidget(
            //                 "${kaomojiController.kaomojiEmojis[currentIndex].values.elementAt(0)[i]}"),
            //           ),
            //         ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
