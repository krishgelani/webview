import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:webview/Utils/Widgets/text_widget.dart';
import 'package:webview/Utils/constant.dart';
import 'package:webview/generated/assets.dart';

class PremiumScreen extends StatefulWidget {
  const PremiumScreen({super.key});

  @override
  State<PremiumScreen> createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
  // List<ProductDetail> _prducts

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteBgColor,
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Image.asset(
                  Assets.imagesProIcon,
                  height: 130,
                ),
                const SizedBox(
                  height: 20,
                ),
                const TextWidget(
                  "Go Premium",
                  fontWeight: FontWeight.w600,
                  fontSize: 26,
                ),
                const TextWidget(
                  "No commitment. Cancel anytime.",
                  color: AppColor.textSecondaryColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      Assets.imagesPremiumAdsIcon,
                      height: 50,
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    const Expanded(
                      child: TextWidget(
                        '100% Ad-Free and Seamless Use',
                        fontWeight: FontWeight.w500,
                        color: AppColor.blackColor,
                        textAlign: TextAlign.start,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ).marginOnly(left: 10),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Image.asset(
                      Assets.imagesPremiumChatIcon,
                      height: 50,
                    ),
                    const SizedBox(
                      width: 25,
                    ),
                    const TextWidget(
                      'Unlimited Use of Dual Chat',
                      fontWeight: FontWeight.w500,
                      color: AppColor.blackColor,
                      fontSize: 16,
                    ),
                  ],
                ).marginOnly(left: 10),
              ],
            ),
            Column(
              children: [
                Container(
                  width: 100.w,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.greenColor),
                    color: AppColor.fullLightGreenColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Column(
                    children: [
                      TextWidget(
                        "Upgrade Now",
                        color: AppColor.greenColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 17,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextWidget(
                            '₹ 299.00',
                            fontWeight: FontWeight.w500,
                            color: AppColor.blackColor,
                            fontSize: 24,
                          ),
                          TextWidget(
                            '/month',
                            fontWeight: FontWeight.w500,
                            color: AppColor.blackColor,
                            fontSize: 18,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const TextWidget(
                  "Automatic Renewal",
                  color: AppColor.textSecondaryColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
