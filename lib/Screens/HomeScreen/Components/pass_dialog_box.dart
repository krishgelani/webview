import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview/Utils/Widgets/text_widget.dart';
import 'package:webview/Utils/constant.dart';

Future<void> passDialog(
  BuildContext context,
  Function onResetTap,
  Function onDeleteTap,
) async {
  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return CupertinoAlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const TextWidget(
              "Password Lock",
              fontSize: 18,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.cancel_outlined,
                color: Colors.black54,
                size: 30,
              ),
            )
          ],
        ),
        content: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {
                onResetTap();
                //close Dialog
              },
              child: const Align(
                  alignment: Alignment.center,
                  child: TextWidget(
                    'Reset Password',
                    color: AppColor.greenColor,
                  )),
            ),
            const Divider(),

            TextButton(
              onPressed: () async {
                onDeleteTap();
              },
              child: const Align(
                alignment: Alignment.center,
                child: TextWidget(
                  'Delete Password',
                  color: Colors.red,
                ),
              ),
            ),
            // const Divider(),
            // TextButton(
            //   onPressed: () {
            //     Navigator.pop(context);
            //     //close Dialog
            //   },
            //   child: const Align(
            //       alignment: Alignment.center, child: Text('Cancel')),
            // )
          ],
        ),
      );
    },
  );
}
