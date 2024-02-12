import 'dart:io';

import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:webview/Utils/Widgets/custom_snackbar.dart';

class AttController extends GetxController {
  RxString attText = ''.obs;
  stt.SpeechToText speechToText = stt.SpeechToText();
  RxBool speechEnabled = false.obs;
  RxString lastWords = ''.obs;
  RxBool isPermissionGranted = false.obs;
  RxBool isSpeaking = false.obs;

  @override
  void onInit() {
    initSpeech();
    super.onInit();
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  Future onSpeechResult(SpeechRecognitionResult result) async {
    print("${result.finalResult}+++++++++++++++++");
    result.alternates.first.confidence;
    lastWords.value = result.recognizedWords;
    if (result.finalResult) {}

    // messageTextController.text = lastWords.value;
  }

  /// This has to happen only once per app
  void initSpeech() async {
    speechEnabled.value = await speechToText.initialize();
  }

  /// Each time to start a speech recognition session
  Future startListening() async {
    await speechToText.listen(onResult: onSpeechResult);
  }

  void stopListening() async {
    await speechToText.stop();
  }

  Future<void> checkPermissions() async {
    if (Platform.isAndroid) {
      // Android permissions
      final microphoneStatus = await Permission.microphone.status;
      final bluetoothConnectStatus = await Permission.bluetoothConnect.status;

      if (microphoneStatus.isDenied || bluetoothConnectStatus.isDenied) {
        isPermissionGranted.value = false;
        SnackBars.errorSnackBar(
            content: "please grant us permission for microphone and speech");
        // Future.delayed(const Duration(milliseconds: 1500), () {
        //   openAppSettings();
        // });
      } else {
        isPermissionGranted.value = true;
      }

      // Check and request other Android permissions as needed.
    } else if (Platform.isIOS) {
      final speechRecognitionStatus = await Permission.speech.status;
      if (speechRecognitionStatus == PermissionStatus.permanentlyDenied) {
        isPermissionGranted.value = false;
        SnackBars.errorSnackBar(
            content: "please grant us permission for microphone and speech");
        // Future.delayed(const Duration(milliseconds: 2500), () {
        //   openAppSettings();
        // });
      } else {
        isPermissionGranted.value = true;
      }

      print('isPermissionGranted.value 1');
      print(isPermissionGranted.value);
    }
  }
}
