import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sizer/sizer.dart';
import 'package:webview/Utils/constant.dart';

import 'Routes/pages.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

//flutter build apk --split-per-abi

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaleFactor: 1.0, boldText: false),
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Whatsapp Web',
            useInheritedMediaQuery: true,
            theme: ThemeData(
              useMaterial3: true,
              colorSchemeSeed: AppColor.greenColor,
            ),
            getPages: AppPages.routes,
            initialRoute: AppPages.INITIAL,
            builder: FToastBuilder(),
          ),
        );
      },
    );
  }
}
