import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:webview/Routes/routes.dart';
import 'package:webview/Screens/KaomojiScreen/kaomoji_controller.dart';
import 'package:webview/Utils/Widgets/text_widget.dart';
import 'package:webview/Utils/constant.dart';

import '../../Utils/Widgets/common_back_button.dart';

class KaomojiScreen extends StatefulWidget {
  const KaomojiScreen({super.key});

  @override
  State<KaomojiScreen> createState() => _KaomojiScreenState();
}

class _KaomojiScreenState extends State<KaomojiScreen> {
  KaomojiController kaomojiController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteBgColor,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        leading: commonBackButton(),
        title: TextWidget(
          'Kaomoji',
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
                    crossAxisCount: 2, mainAxisExtent: 161),
                itemCount: 10,
                itemBuilder: (BuildContext ctx, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.kaoMojiDetailScreen, arguments: index);
                    },
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 12, left: 12, right: 12, bottom: 18),
                      margin: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: AppColor.whiteColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 30,
                            offset: const Offset(0, 10),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      alignment: Alignment.topCenter,
                      child: Column(
                        children: [
                          Container(
                            height: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: kaomojiController.colorList[index]
                                    .withOpacity(0.15)),
                            alignment: Alignment.center,
                            child: TextWidget(
                              kaomojiController.kaomojiEmojis[index].values
                                  .elementAt(0)
                                  .first,
                              color: kaomojiController.colorList[index],
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const Spacer(),
                          TextWidget(
                            kaomojiController.kaomojiEmojis[index].keys
                                .elementAt(0),
                            color: AppColor.blackColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // Wrap(
            //   children: [
            //     for (var i = 0; i < kaomojiController.kaomojiEmojis.length; i++)
            //       GestureDetector(
            //         onTap: () {
            //           Get.toNamed(Routes.kaoMojiDetailScreen, arguments: i);
            //         },
            //         child: Container(
            //           height: 25.w,
            //           width: 25.w,
            //           padding: EdgeInsets.all(10),
            //           margin: EdgeInsets.all(10),
            //           decoration: BoxDecoration(
            //               gradient: RadialGradient(
            //                 tileMode: TileMode.decal,
            //                 colors: kaomojiController.gradiantList[i],
            //               ),
            //               borderRadius: BorderRadius.circular(100),
            //               color: AppColor.whiteColor),
            //           alignment: Alignment.center,
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: [
            //               TextWidget(
            //                 "${kaomojiController.kaomojiEmojis[i].keys.elementAt(0)}",
            //                 color: AppColor.whiteColor,
            //                 fontWeight: FontWeight.w800,
            //               ),
            //               TextWidget(
            //                 "${kaomojiController.kaomojiEmojis[i].values.elementAt(0).first}",
            //                 color: AppColor.whiteColor,
            //                 fontWeight: FontWeight.w500,
            //               ),
            //             ],
            //           ),
            //         ),
            //       ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
