import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:webview/Routes/routes.dart';
import 'package:webview/Screens/FontScreen/font_controller.dart';
import 'package:webview/Utils/Widgets/common_back_button.dart';
import 'package:webview/Utils/Widgets/text_widget.dart';
import 'package:webview/Utils/constant.dart';

class FontScreen extends StatefulWidget {
  const FontScreen({super.key});

  @override
  State<FontScreen> createState() => _FontScreenState();
}

class _FontScreenState extends State<FontScreen> {
  FontController fontController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteBgColor,
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        leading: commonBackButton(),
        title: TextWidget(
          'Font',
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisExtent: 120),
          itemCount: fontController.fontsList.length,
          itemBuilder: (BuildContext ctx, index) {
            return GestureDetector(
              onTap: () {
                Get.toNamed(Routes.applyFontScreen, arguments: index);
                // CommonBottomSheet.showModalSheet(
                //     context, text(index, context));
              },
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 30,
                        offset: const Offset(0, 10),
                        spreadRadius: 0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.whiteColor),
                child: TextWidget(
                  "${fontController.fontsList[index].values.elementAt(0)}"
                  "${fontController.fontsList[index].values.elementAt(1)}"
                  "${fontController.fontsList[index].values.elementAt(2)}",
                  fontSize: 20,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Widget text(int index, BuildContext context) {
  //   return Container(
  //     width: 100.w,
  //     padding: EdgeInsets.all(15),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         TextWidget(
  //           'Apply Font',
  //           fontSize: 22,
  //           fontWeight: FontWeight.w700,
  //         ),
  //         SizedBox(
  //           height: 10,
  //         ),
  //         Expanded(
  //           child: Container(
  //             width: 100.w,
  //             // height: 50.h,
  //             padding: EdgeInsets.all(15),
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(15),
  //               color: AppColor.whiteColor,
  //             ),
  //             child: Stack(
  //               children: [
  //                 Obx(
  //                   () => TextWidget(
  //                     fontController.fontText.value,
  //                   ),
  //                 ),
  //                 Align(
  //                   alignment: Alignment.bottomRight,
  //                   child: Container(
  //                     width: 140,
  //                     height: 55,
  //                     padding:
  //                         EdgeInsets.symmetric(horizontal: 30, vertical: 15),
  //                     decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(15),
  //                       color: Color(0xFF114BA2),
  //                     ),
  //                     child: InkWell(
  //                       onTap: () async {
  //                         await Clipboard.setData(ClipboardData(
  //                             text: fontController.fontText.value));
  //                         Fluttertoast.showToast(
  //                             msg: "Copy to Clipboard",
  //                             toastLength: Toast.LENGTH_SHORT,
  //                             gravity: ToastGravity.CENTER,
  //                             timeInSecForIosWeb: 1,
  //                             backgroundColor: AppColor.blackColor,
  //                             textColor: Colors.white,
  //                             fontSize: 16.0);
  //                       },
  //                       child: Row(
  //                         mainAxisAlignment: MainAxisAlignment.end,
  //                         crossAxisAlignment: CrossAxisAlignment.center,
  //                         // mainAxisAlignment: MainAxisAlignment.center,
  //                         children: [
  //                           Icon(
  //                             Icons.copy,
  //                             size: 18,
  //                             color: AppColor.whiteColor,
  //                           ),
  //                           Spacer(),
  //                           TextWidget(
  //                             'Copy',
  //                             fontSize: 18,
  //                             color: AppColor.whiteColor,
  //                             fontWeight: FontWeight.w500,
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //         SizedBox(
  //           height: 16,
  //         ),
  //         TextField(
  //           controller: fontController.textEditingController,
  //           maxLines: 1,
  //           onChanged: (val) {
  //             fontController.fontText.value = fontController
  //                 .transformToStyledText(val, fontController.fontsList[index]);
  //           },
  //           decoration: InputDecoration(
  //               border: OutlineInputBorder(
  //                 borderRadius: BorderRadius.circular(10),
  //                 borderSide: BorderSide(
  //                   width: 0,
  //                   style: BorderStyle.none,
  //                 ),
  //               ),
  //               isDense: true,
  //               hintText: "Enter your text here",
  //               fillColor: AppColor.greyColor.withOpacity(0.5),
  //               filled: true),
  //         ),
  //         SizedBox(
  //           height: 20,
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
