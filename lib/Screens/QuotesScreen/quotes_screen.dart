import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:webview/Routes/routes.dart';
import 'package:webview/Screens/QuotesScreen/quotes_controller.dart';
import 'package:webview/Utils/Widgets/common_back_button.dart';
import 'package:webview/Utils/Widgets/text_widget.dart';
import 'package:webview/Utils/constant.dart';
import 'package:webview/generated/assets.dart';

class QuotesScreen extends StatefulWidget {
  const QuotesScreen({super.key});

  @override
  State<QuotesScreen> createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  QuotesController quotesController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteBgColor,
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        leading: commonBackButton(),
        title: TextWidget(
          'Quotes',
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              children: [
                _commonItemContainer(quotesController.gradiantList[0],
                    'Life Quotes', Assets.imagesLife, () {
                  Get.toNamed(Routes.quotesListScreen, arguments: 0);
                }),
                _commonItemContainer(quotesController.gradiantList[1],
                    'Happy Quotes', Assets.imagesHappy, () {
                  Get.toNamed(Routes.quotesListScreen, arguments: 1);
                }),
                _commonItemContainer(quotesController.gradiantList[2],
                    'Friendly Quotes', Assets.imagesFriendly, () {
                  Get.toNamed(Routes.quotesListScreen, arguments: 2);
                }),
                _commonItemContainer(quotesController.gradiantList[3],
                    'Sweet Quotes', Assets.imagesSweet, () {
                  Get.toNamed(Routes.quotesListScreen, arguments: 3);
                }),
                _commonItemContainer(quotesController.gradiantList[4],
                    'Sad Quotes', Assets.imagesSad, () {
                  Get.toNamed(Routes.quotesListScreen, arguments: 4);
                }),
                _commonItemContainer(quotesController.gradiantList[5],
                    'Love Quotes', Assets.imagesLove, () {
                  Get.toNamed(Routes.quotesListScreen, arguments: 5);
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _commonItemContainer(
      List<Color> colors, String title, String image, Function onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6),
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: Container(
          height: 130,
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWidget(
                title,
                fontSize: 20,
                color: AppColor.whiteColor,
                fontWeight: FontWeight.w800,
              ),
              Container(
                height: 4.5.h,
                width: 7.5.w,
                alignment: Alignment.center,
                decoration: ShapeDecoration(
                  color: AppColor.greenColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 18,
                  color: AppColor.whiteColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
