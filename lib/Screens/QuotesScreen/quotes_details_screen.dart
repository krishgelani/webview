import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:webview/Screens/QuotesScreen/quotes_controller.dart';
import 'package:webview/Utils/Widgets/text_widget.dart';
import 'package:webview/Utils/constant.dart';

class QuotesDetailsScreen extends StatefulWidget {
  const QuotesDetailsScreen({super.key});

  @override
  State<QuotesDetailsScreen> createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesDetailsScreen> {
  int imgIndex = 0;
  List quotesDatataList = [];
  QuotesController quotesController = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    quotesDatataList = Get.arguments;
    print("----->>  $quotesDatataList");
    imgIndex = Random().nextInt(quotesController.imageList.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          quoteImage(),
          Column(
            children: [
              SizedBox(
                height: AppBar().preferredSize.height,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: AppColor.whiteColor,
                      size: 20,
                    ),
                  ),
                  const Spacer(),
                  TextWidget(
                    "${quotesDatataList[0]}/10",
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp,
                  ).marginOnly(right: 18)
                ],
              ),
              const Spacer(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 22.0, vertical: 22),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            // width: 140,
                            height: 55,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: AppColor.tealColor,
                            ),
                            child: InkWell(
                              onTap: () async {
                                quotesController.shareQuoteImage(
                                    quoteImage(), context, quotesDatataList[1]);
                              },
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.share,
                                    size: 22,
                                    color: AppColor.whiteColor,
                                  ),
                                  TextWidget(
                                    'Share',
                                    fontSize: 18,
                                    color: AppColor.whiteColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 18,
                        ),
                        Expanded(
                          child: Container(
                            // width: 140,
                            height: 55,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: const Color(0xFF114BA2),
                            ),
                            child: InkWell(
                              onTap: () async {
                                await Clipboard.setData(
                                    ClipboardData(text: quotesDatataList[1]));
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.copy,
                                    size: 22,
                                    color: AppColor.whiteColor,
                                  ),
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
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: 100.w,
                      height: 55,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColor.greenColor,
                      ),
                      child: InkWell(
                        onTap: () {
                          quotesController.getQuoteImage(quoteImage(), context);
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.downloading,
                              size: 28,
                              color: AppColor.whiteColor,
                            ),
                            SizedBox(
                              width: 28,
                            ),
                            TextWidget(
                              'Download',
                              fontSize: 18,
                              color: AppColor.whiteColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(20.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     children: [
              //       IconButton(
              //         onPressed: () async {
              //           quotesController.shareQuoteImage(
              //               quoteImage(), context, quotesDatataList);
              //         },
              //         style: ButtonStyle(
              //             backgroundColor:
              //                 MaterialStatePropertyAll(AppColor.tealColor)),
              //         padding: EdgeInsets.all(15),
              //         icon: Icon(
              //           Icons.share,
              //           color: AppColor.whiteColor,
              //         ),
              //       ),
              //       IconButton(
              //         onPressed: () {
              //           quotesController.getQuoteImage(quoteImage(), context);
              //         },
              //         style: ButtonStyle(
              //             backgroundColor:
              //                 MaterialStatePropertyAll(AppColor.greenColor)),
              //         padding: EdgeInsets.all(15),
              //         icon: Icon(
              //           Icons.download_rounded,
              //           color: AppColor.whiteColor,
              //         ),
              //       ),
              //       IconButton(
              //         onPressed: () async {
              //           await Clipboard.setData(
              //               ClipboardData(text: quotesDatataList));
              //           const snackBar = SnackBar(
              //             content: Text('Copied!'),
              //           );
              //           ScaffoldMessenger.of(context).showSnackBar(snackBar);
              //         },
              //         style: ButtonStyle(
              //             backgroundColor:
              //                 MaterialStatePropertyAll(AppColor.blueColor)),
              //         padding: EdgeInsets.all(15),
              //         icon: Icon(
              //           Icons.copy_rounded,
              //           color: AppColor.whiteColor,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          )
        ],
      ),
    );
  }

  Widget quoteImage() {
    return Container(
        height: 100.h,
        width: 100.w,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                quotesController.imageList[imgIndex][0],
              ),
              fit: BoxFit.cover),
        ),
        alignment: quotesController.imageList[imgIndex][1] == 1
            ? Alignment.topCenter
            : quotesController.imageList[imgIndex][1] == 2
                ? Alignment.center
                : Alignment.bottomCenter,
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20),
        child: Text(
          quotesDatataList[1],
          textAlign: TextAlign.center,
          style: GoogleFonts.josefinSans(
            color: AppColor.whiteColor,
            fontWeight: FontWeight.w600,
            fontSize: 30,
            textStyle: const TextStyle(
              shadows: [
                Shadow(
                  blurRadius: 20.0, // shadow blur
                  color: AppColor.blackColor, // shadow color
                  offset: Offset(0.0, 0.0), // how much shadow will be shown
                ),
              ],
            ),
          ),
        )

        // TextWidget(
        //   quotesDatataList,
        //   color: AppColor.whiteColor,
        //   fontWeight: FontWeight.w600,
        //   fontSize: 20,
        //   shadow: [
        //     Shadow(
        //       blurRadius: 10.0, // shadow blur
        //       color: AppColor.blackColor, // shadow color
        //       offset: Offset(0.0, 0.0), // how much shadow will be shown
        //     ),
        //   ],
        // ),
        );
  }
}
