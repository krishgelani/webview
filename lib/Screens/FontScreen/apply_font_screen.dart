import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:webview/Screens/FontScreen/font_controller.dart';
import 'package:webview/Utils/Widgets/common_back_button.dart';
import 'package:webview/Utils/Widgets/text_widget.dart';
import 'package:webview/Utils/constant.dart';

class ApplyFontScreen extends StatefulWidget {
  const ApplyFontScreen({super.key});

  @override
  State<ApplyFontScreen> createState() => _ApplyFontScreenState();
}

class _ApplyFontScreenState extends State<ApplyFontScreen> {
  FontController fontController = Get.put(FontController());

  int index = 0;
  @override
  void initState() {
    // TODO: implement initState
    index = Get.arguments;
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    fontController.fontText.value = "";
    fontController.textEditingController.clear();
    super.dispose();
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
          'Apply Font',
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 10.0, right: 10, top: 10, bottom: 10),
        child: Stack(
          children: [
            ListView(
              reverse: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                TextField(
                  controller: fontController.textEditingController,
                  maxLines: 1,
                  onChanged: (val) {
                    fontController.fontText.value =
                        fontController.transformToStyledText(
                            val, fontController.fontsList[index]);
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      isDense: true,
                      hintText: "Enter your text here",
                      fillColor: AppColor.greyColor.withOpacity(0.4),
                      filled: true),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
            Container(
              width: 100.w,
              height: 50.h,
              margin: const EdgeInsets.only(bottom: 60),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColor.whiteColor,
              ),
              child: Stack(
                children: [
                  Obx(
                    () => TextWidget(
                      fontController.fontText.value,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      width: 140,
                      height: 55,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color(0xFF114BA2),
                      ),
                      child: InkWell(
                        onTap: () async {
                          await Clipboard.setData(ClipboardData(
                              text: fontController.fontText.value));
                          Fluttertoast.showToast(
                              msg: "Copy to Clipboard",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: AppColor.blackColor,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.copy,
                              size: 18,
                              color: AppColor.whiteColor,
                            ),
                            Spacer(),
                            TextWidget(
                              'Copy',
                              fontSize: 18,
                              color: AppColor.whiteColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
