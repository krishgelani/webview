import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:webview/Routes/routes.dart';
import 'package:webview/Screens/SettingScreen/setting_controller.dart';
import 'package:webview/Utils/Widgets/common_back_button.dart';
import 'package:webview/Utils/Widgets/text_widget.dart';
import 'package:webview/Utils/constant.dart';
import 'package:webview/generated/assets.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  SettingController settingController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteBgColor,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        leading: commonBackButton(),
        title: TextWidget(
          'Settings',
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.premiumScreen);
                },
                child: Container(
                  width: 100.w,
                  height: 250,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    image: const DecorationImage(
                        image: AssetImage(
                          Assets.imagesPremiumContainer,
                        ),
                        fit: BoxFit.cover),
                    // gradient: const LinearGradient(
                    //     colors: [AppColor.greenAssentColor, Colors.blueAccent],
                    //     begin: Alignment.topLeft,
                    //     end: Alignment.bottomRight),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            Assets.imagesProIcon,
                            height: 35,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          const TextWidget(
                            'PRO',
                            fontWeight: FontWeight.w700,
                            color: AppColor.whiteColor,
                            fontSize: 25,
                          ),
                          const Spacer(),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  TextWidget(
                                    '₹ 299.00',
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.whiteColor,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 25,
                                  ),
                                  TextWidget(
                                    '/month',
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.whiteColor,
                                    fontStyle: FontStyle.italic,
                                    fontSize: 16,
                                  ),
                                ],
                              ),
                              TextWidget(
                                'Automatic Renewal',
                                fontWeight: FontWeight.w500,
                                color: AppColor.whiteColor,
                                fontSize: 12,
                              ),
                            ],
                          ).marginOnly(top: 10)
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Image.asset(Assets.imagesProAdsIcon),
                          const SizedBox(
                            width: 16,
                          ),
                          const Expanded(
                            child: TextWidget(
                              '100% Ad-Free and Seamless Use',
                              fontWeight: FontWeight.w600,
                              color: AppColor.whiteColor,
                              textAlign: TextAlign.start,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Image.asset(Assets.imagesProDualChatIcon),
                          const SizedBox(
                            width: 16,
                          ),
                          const TextWidget(
                            'Unlimited Use of Dual Chat',
                            fontWeight: FontWeight.w600,
                            color: AppColor.whiteColor,
                            fontSize: 14,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              _commonContainer("Feedback", () {
                print("Feedback");
              }),
              const SizedBox(
                height: 15,
              ),
              _commonContainer("Share App", () {
                print("Share App");
              }),
              const SizedBox(
                height: 15,
              ),
              _commonContainer("Rate Us", () {
                print("Rate Us");
              }),
              const SizedBox(
                height: 15,
              ),
              _commonContainer("Privacy Policy", () {
                print("Privacy Policy");
              }),
              const SizedBox(
                height: 15,
              ),
              _commonContainer("Terms of Use", () {
                print("Terms of Use");
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _commonContainer(String title, Function onTap) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 70,
        width: 100.w,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 30,
              offset: const Offset(0, 10),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          children: [
            TextWidget(
              title,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios_outlined)
          ],
        ),
      ),
    );
  }
}
