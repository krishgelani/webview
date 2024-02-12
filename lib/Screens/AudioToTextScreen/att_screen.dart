import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';
import 'package:webview/Screens/AudioToTextScreen/att_controller.dart';
import 'package:webview/Utils/Widgets/common_back_button.dart';
import 'package:webview/Utils/Widgets/text_widget.dart';
import 'package:webview/Utils/constant.dart';
import 'package:webview/generated/assets.dart';

class AudioToTextScreen extends StatefulWidget {
  const AudioToTextScreen({super.key});

  @override
  State<AudioToTextScreen> createState() => _AudioToTextScreenState();
}

class _AudioToTextScreenState extends State<AudioToTextScreen> {
  AttController audioToTextController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteBgColor,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        leading: commonBackButton(),
        title: TextWidget(
          'Audio to text',
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 100.w,
              height: 50.h,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 30,
                    offset: const Offset(0, 10),
                    spreadRadius: 0,
                  ),
                ],
                borderRadius: BorderRadius.circular(15),
                color: AppColor.whiteColor,
              ),
              child: Stack(
                children: [
                  Obx(
                    () => audioToTextController.lastWords.value.isEmpty
                        ? const TextWidget(
                            "Hold the microphone to speak",
                            fontSize: 16,
                            color: AppColor.textSecondaryColor,
                          )
                        : TextWidget(audioToTextController.lastWords.value),
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
                              text: audioToTextController.lastWords.value));
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
            const Spacer(),
            Obx(
              () => audioToTextController.isSpeaking.value
                  ? ColorFiltered(
                      colorFilter: const ColorFilter.mode(
                        Color(0xFF00FF0D),
                        BlendMode.modulate,
                      ),
                      child: Lottie.asset(Assets.animationSpactrum, height: 50))
                  : const TextWidget(
                      'Hold and Speak',
                      color: AppColor.textSecondaryColor,
                      fontWeight: FontWeight.w400,
                    ),
            ),
            const SizedBox(
              height: 30,
            ),
            Align(
              child: GestureDetector(
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: AppColor.greenColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 30,
                        offset: const Offset(0, 10),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.mic_none_rounded,
                    size: 45,
                    color: AppColor.whiteColor,
                  ),
                ),
                onLongPress: () async {
                  await audioToTextController.checkPermissions();
                  if (audioToTextController.isPermissionGranted.value) {
                    // audioToTextController
                    //     .repeat();

                    await audioToTextController.startListening();
                    audioToTextController.isSpeaking.value = true;
                  }
                },
                onLongPressUp: () async {
                  // await checkPermission();

                  if (audioToTextController.isPermissionGranted.value) {
                    // audioToTextController
                    //     .reset();
                    audioToTextController.stopListening();
                    audioToTextController.isSpeaking.value = false;
                  }
                },
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
