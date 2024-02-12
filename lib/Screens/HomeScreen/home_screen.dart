import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';
import 'package:webview/Routes/routes.dart';
import 'package:webview/Screens/HomeScreen/Components/pass_dialog_box.dart';
import 'package:webview/Screens/HomeScreen/home_controller.dart';
import 'package:webview/Utils/Widgets/text_widget.dart';
import 'package:webview/Utils/constant.dart';
import 'package:webview/generated/assets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteBgColor,
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        title: TextWidget(
          'Whatscan for Web',
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
        actions: [
          InkWell(
            onTap: () {
              Get.toNamed(Routes.settingScreen);
            },
            child: Image.asset(
              Assets.imagesSetting,
              height: 50,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.whatsappWebScreen);
              },
              child: Container(
                height: 150,
                width: 100.w,
                margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                decoration: BoxDecoration(
                    color: AppColor.greenAssentColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 30,
                        offset: const Offset(0, 10),
                        spreadRadius: 0,
                      ),
                    ],
                    image: const DecorationImage(
                        image: AssetImage(Assets.imagesWpBgImage),
                        fit: BoxFit.cover)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextWidget(
                        'Chats',
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        color: AppColor.whiteColor,
                      ),
                      const TextWidget(
                        '2nd Chat Account',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: AppColor.whiteColor,
                      ),
                      const Spacer(),
                      Container(
                        height: 35,
                        width: 70,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppColor.whiteColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Go",
                              style: TextStyle(
                                  color: AppColor.blackColor,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 12,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 20, left: 10, right: 10, top: 12),
              child: GestureDetector(
                onTap: () {
                  if (GetStorage().read(GetStorageKey.loginPin) != null) {
                    passDialog(
                      context,
                      () {
                        Navigator.pop(context);
                        Get.toNamed(Routes.passwordScreen);
                        //   ON RESET PRESS
                      },
                      () {
                        //   ON DELETE PRESS
                        print(GetStorage().read(GetStorageKey.loginPin));
                        GetStorage().remove(GetStorageKey.loginPin);
                        Navigator.pop(context);
                      },
                    );
                  } else {
                    Get.toNamed(Routes.passwordScreen);
                  }
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shadows: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 30,
                        offset: const Offset(0, 10),
                        spreadRadius: 0,
                      ),
                    ],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        Assets.imagesPasswordLock,
                        height: 60,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Password Lock",
                        style: TextStyle(
                          color: const Color(0xFF111111),
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                      const Spacer(),
                      Container(
                        height: 4.5.h,
                        width: 6.5.w,
                        alignment: Alignment.center,
                        decoration: ShapeDecoration(
                          color: AppColor.purpleColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: const Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 16,
                          color: AppColor.whiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GridView.builder(
              padding: const EdgeInsets.only(left: 10, right: 10),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 22,
                  mainAxisExtent: 131),
              itemCount: 4,
              itemBuilder: (BuildContext ctx, index) {
                return _commonItemContainer(
                    AssetImage(homeController.icon[index]),
                    homeController.name[index],
                    homeController.color[index], () {
                  Get.toNamed(homeController.navigateScreenName[index]);
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _commonItemContainer(
      ImageProvider icon, String title, Color color, Function onTap) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 26,
            child: Container(
              height: 105,
              padding: const EdgeInsets.only(
                  top: 60, bottom: 15, left: 15, right: 15),
              decoration: ShapeDecoration(
                color: Colors.white,
                shadows: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 30,
                    offset: const Offset(0, 10),
                    spreadRadius: 0,
                  ),
                ],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: const Color(0xFF111111),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  Container(
                    height: 3.5.h,
                    width: 5.5.w,
                    alignment: Alignment.center,
                    decoration: ShapeDecoration(
                      color: color,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 13,
                      color: AppColor.whiteColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 22,
            top: 0,
            child: Container(
              width: 60,
              height: 60,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
                image: DecorationImage(image: icon, fit: BoxFit.cover),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 30,
                    offset: const Offset(0, 10),
                    spreadRadius: 0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// _commonItemContainer(
//     const Icon(
//       Icons.message_rounded,
//       color: AppColor.whiteColor,
//     ),
//     [AppColor.purpleColor, AppColor.purpleLightColor],
//     'Quotes',
//     'Meitu quality copywriting', () {
//   Get.toNamed(Routes.quotesScreen);
// }),
// _commonItemContainer(
//     const Icon(
//       Icons.mic,
//       color: AppColor.whiteColor,
//     ),
//     [AppColor.blueAccentColor, AppColor.blueaccentLightColor],
//     'Audio to text',
//     'One-click conversion', () {
//   Get.toNamed(Routes.audioToTextScreen);
// }),
// _commonItemContainer(
//     const Icon(
//       Icons.text_fields_rounded,
//       color: AppColor.whiteColor,
//     ),
//     [AppColor.yellowLightColor, AppColor.pickYellowColor],
//     'Font',
//     'Multiple font conversion', () {
//   Get.toNamed(Routes.fontScreen);
// }),
// _commonItemContainer(
//     const Icon(
//       Icons.emoji_emotions_outlined,
//       color: AppColor.whiteColor,
//     ),
//     [AppColor.pinkDarkColor, AppColor.pinkLightColor],
//     'Kaomoji',
//     'Fun Chat kaomoji', () {
//   Get.toNamed(Routes.kaomojiScreen);
// }),
// _commonItemContainer(
//     const Icon(
//       Icons.lock_outline_rounded,
//       color: AppColor.whiteColor,
//     ),
//     [AppColor.greenAssentColor, AppColor.greenDarkColor],
//     'Password lock',
//     'Make your app more stealthy', () {
//   if (GetStorage().read(GetStorageKey.loginPin) != null) {
//     passDialog(
//       context,
//       () {
//         //   ON DELETE PRESS
//         print(GetStorage().read(GetStorageKey.loginPin));
//         GetStorage().remove(GetStorageKey.loginPin);
//         Navigator.pop(context);
//       },
//       () {
//         Navigator.pop(context);
//         Get.toNamed(Routes.passwordScreen);
//         //   ON RESET PRESS
//       },
//     );
//   } else {
//     Get.toNamed(Routes.passwordScreen);
//   }
// }),

// Widget _commonItemContainertemp(Widget icon, List<Color> colors, String title,
//     String subTitle, Function onTap) {
//   return GestureDetector(
//     onTap: () {
//       onTap();
//     },
//     child: Container(
//       margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//       padding: const EdgeInsets.all(10),
//       decoration: BoxDecoration(
//         color: AppColor.whiteColor,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Wrap(
//         children: [
//           Container(
//               padding: const EdgeInsets.all(15),
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                     colors: colors,
//                     begin: Alignment.bottomRight,
//                     end: Alignment.topLeft),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: icon),
//           const SizedBox(
//             width: 10,
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextWidget(
//                 title,
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//               ),
//               TextWidget(
//                 subTitle,
//                 fontSize: 12.5,
//                 color: AppColor.textPrimaryColor,
//                 fontWeight: FontWeight.w300,
//               ),
//             ],
//           ),
//           // const Spacer(),
//           const Icon(Icons.navigate_next)
//         ],
//       ),
//     ),
//   );
// }
