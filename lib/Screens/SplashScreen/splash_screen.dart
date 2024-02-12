import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';
import 'package:webview/Utils/Widgets/text_widget.dart';
import 'package:webview/Utils/constant.dart';
import 'package:webview/generated/assets.dart';

import '../../Routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      print(GetStorage().read(GetStorageKey.loginPin));
      if (GetStorage().read(GetStorageKey.loginPin) != null) {
        Get.offAllNamed(Routes.passwordScreen, arguments: true);
      } else {
        // if (box.read(GetStorageKey.isPinLogin) ?? false) {
        Get.offAllNamed(Routes.homeScreen);
        // } else {
        //   Get.offAllNamed(Routes.passwordLoginScreen);
        // }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.greenColor,
      body: Container(
        width: 100.w,
        height: 100.h,
        alignment: Alignment.center,
        child: Stack(
          children: [
            Center(
              child: Stack(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      Assets.imagesAppIcon,
                      height: 160,
                      width: 160,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 50.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextWidget(
                            'Whats Web - Whatscan for Web',
                            color: AppColor.whiteColor,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          TextWidget(
                            'Access WhatsApp on the Web with Ease',
                            color: AppColor.whiteColor,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
