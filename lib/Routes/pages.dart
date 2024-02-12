import 'package:get/get.dart';
import 'package:webview/Screens/AudioToTextScreen/att_binding.dart';
import 'package:webview/Screens/AudioToTextScreen/att_screen.dart';
import 'package:webview/Screens/FontScreen/apply_font_screen.dart';
import 'package:webview/Screens/FontScreen/font_binding.dart';
import 'package:webview/Screens/FontScreen/font_screen.dart';
import 'package:webview/Screens/HomeScreen/home_binding.dart';
import 'package:webview/Screens/HomeScreen/home_screen.dart';
import 'package:webview/Screens/KaomojiScreen/kaomoji_binding.dart';
import 'package:webview/Screens/KaomojiScreen/kaomoji_detail_screen.dart';
import 'package:webview/Screens/KaomojiScreen/kaomoji_screen.dart';
import 'package:webview/Screens/PasswordScreen/password_binding.dart';
import 'package:webview/Screens/PasswordScreen/password_screen.dart';
import 'package:webview/Screens/QuotesScreen/quotes_binding.dart';
import 'package:webview/Screens/QuotesScreen/quotes_details_screen.dart';
import 'package:webview/Screens/QuotesScreen/quotes_list_screen.dart';
import 'package:webview/Screens/QuotesScreen/quotes_screen.dart';
import 'package:webview/Screens/SettingScreen/premium_screen.dart';
import 'package:webview/Screens/SettingScreen/setting_binding.dart';
import 'package:webview/Screens/SettingScreen/setting_screen.dart';
import 'package:webview/Screens/SplashScreen/splash_screen.dart';
import 'package:webview/Screens/WhatsappWeb/whatsapp_webview.dart';

import 'routes.dart';

// const Transition transition = Transition.native;

class AppPages {
  static const INITIAL = Routes.splashScreen;

  static final routes = [
    GetPage(
        name: Routes.splashScreen,
        page: () => const SplashScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.homeScreen,
        binding: HomeBinding(),
        page: () => const HomeScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.whatsappWebScreen,
        page: () => WhatsAppWebView(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.quotesScreen,
        page: () => const QuotesScreen(),
        binding: QuotesBinding(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.quotesListScreen,
        page: () => const QuotesListScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.quotesDetailsScreen,
        page: () => const QuotesDetailsScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.audioToTextScreen,
        binding: AttBinding(),
        page: () => const AudioToTextScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.fontScreen,
        binding: FontBinding(),
        page: () => const FontScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.kaomojiScreen,
        binding: KaomojiBinding(),
        page: () => const KaomojiScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.kaoMojiDetailScreen,
        page: () => const kaomojiDetailScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.passwordScreen,
        binding: PasswordBinding(),
        page: () => const PasswordScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.settingScreen,
        binding: SettingBinding(),
        page: () => const SettingScreen(),
        transition: Transition.rightToLeft),
    GetPage(
        name: Routes.applyFontScreen,
        page: () => const ApplyFontScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: Routes.premiumScreen,
        page: () => const PremiumScreen(),
        transition: Transition.fadeIn)
  ];
}
