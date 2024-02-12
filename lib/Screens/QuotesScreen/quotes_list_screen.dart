import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:webview/Routes/routes.dart';
import 'package:webview/Utils/Widgets/common_back_button.dart';
import 'package:webview/Utils/Widgets/text_widget.dart';
import 'package:webview/Utils/constant.dart';

import 'quotes_controller.dart';

class QuotesListScreen extends StatefulWidget {
  const QuotesListScreen({super.key});

  @override
  State<QuotesListScreen> createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesListScreen> {
  int index = 0;
  QuotesController quotesController = Get.find();

  @override
  void initState() {
    index = Get.arguments ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteBgColor,
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        title: TextWidget(
          quotesController.quotesData[index].category!,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
        leading: commonBackButton(),
      ),
      body: Column(
        children: [
          // Container(
          //   width: 100.w,
          //   padding: EdgeInsets.only(left: 15),
          //   decoration: BoxDecoration(
          //     gradient: LinearGradient(
          //         colors: quotesController.gradiantList[index],
          //         end: Alignment.topLeft,
          //         begin: Alignment.bottomRight),
          //   ),
          //   alignment: Alignment.centerLeft,
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       SizedBox(
          //         height: AppBar().preferredSize.height,
          //       ),
          //       IconButton(
          //         onPressed: () {
          //           Get.back();
          //         },
          //         icon: Icon(
          //           Icons.arrow_back_ios_new_rounded,
          //           color: AppColor.whiteColor,
          //           size: 20,
          //         ),
          //       ),
          //       SizedBox(
          //         height: 10,
          //       ),
          //       TextWidget(
          //         quotesController.quotesData[index].category!,
          //         color: AppColor.whiteColor,
          //         fontSize: 27,
          //         fontWeight: FontWeight.w800,
          //       ),
          //       SizedBox(
          //         height: 10,
          //       ),
          //     ],
          //   ),
          // ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(top: 8, bottom: 20),
                  itemCount: quotesController.quotesData[index].quotes!.length,
                  itemBuilder: (context, ind) {
                    return _commonItemContainer(
                      quotesController.quotesData[index].quotes![ind].quote!,
                      () {
                        Get.toNamed(Routes.quotesDetailsScreen, arguments: [
                          ind + 1,
                          quotesController.quotesData[index].quotes![ind].quote!
                        ]);
                      },
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _commonItemContainer(String title, Function onTap) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: 100.w,
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 30,
              offset: const Offset(0, 10),
              spreadRadius: 0,
            ),
          ],
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.topLeft,
        child: Row(
          children: [
            Expanded(
              child: TextWidget(
                title,
                fontSize: 15,
                textAlign: TextAlign.start,
                color: AppColor.blackColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_outlined,
              size: 18,
            )
          ],
        ),
      ),
    );
  }
}
