import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';
import 'package:webview/Routes/routes.dart';
import 'package:webview/Screens/PasswordScreen/password_controller.dart';
import 'package:webview/Utils/Widgets/common_back_button.dart';
import 'package:webview/Utils/Widgets/text_widget.dart';
import 'package:webview/Utils/constant.dart';

import 'Components/custom_pin_put.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  PasswordController passwordController = Get.find();
  bool isLogin = false;
  @override
  void initState() {
    isLogin = Get.arguments ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteBgColor,
      appBar: isLogin
          ? null
          : AppBar(
              title: TextWidget(
                'Password lock',
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
              leading: commonBackButton(),
            ),
      body: Container(
        width: 100.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 10.h,
            ),
            Obx(
              () => TextWidget(
                passwordController.isReEnter.value
                    ? 'Re-enter Password'
                    : isLogin
                        ? 'Enter Password'
                        : 'Enter new password',
                fontWeight: FontWeight.w800,
                fontSize: 12.sp,
              ),
            ),
            SizedBox(
              width: 95.w,
              child: CustomPinCodeWidget(
                minPinLength: 4,
                maxPinLength: 4,
                buttonColor: AppColor.whiteColor,
                // enterButtonLabel: AssetIcons.appIcon,
                onPressColorAnimation: AppColor.whiteColor,
                filledIndicatorColor: AppColor.greenColor,
                numbersStyle: TextStyle(
                  color: AppColor.blackColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
                borderSide: const BorderSide(color: Colors.transparent),
                onChangedPin: (pin) {
                  if (pin.length == 4) {
                    if (isLogin) {
                      if (GetStorage().read(GetStorageKey.loginPin) == pin) {
                        print("0");

                        Get.offAllNamed(Routes.homeScreen);
                        Fluttertoast.showToast(
                            msg: "Success!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: AppColor.blackColor,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      } else {
                        Fluttertoast.showToast(
                            msg: "Incorrect Password",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: AppColor.blackColor,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                    } else {
                      if (passwordController.isReEnter.value &&
                          passwordController.pinValue.value == pin) {
                        Get.back();
                        GetStorage().write(GetStorageKey.loginPin, pin);
                        Fluttertoast.showToast(
                            msg: "Success!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: AppColor.blackColor,
                            textColor: Colors.white,
                            fontSize: 16.0); //Success!
                      } else if (!passwordController.isReEnter.value) {
                        passwordController.pinValue.value = pin;
                        passwordController.isReEnter.value = true;
                      } else if (passwordController.isReEnter.value &&
                          passwordController.pinValue.value != pin) {
                        Fluttertoast.showToast(
                            msg: "Entered password is not same",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: AppColor.blackColor,
                            textColor: Colors.white,
                            fontSize: 16.0); //Enter password is not same
                      }
                      // Get.offNamed(Routes.mainScreen);
                    }
                  }
                },
                onEnter: (pin, _) {
                  // callback user pressed enter
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
