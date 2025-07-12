import 'package:ecommerce/core/constant/apptheme.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LocalController extends GetxController {
  Locale? language;
  ThemeData appTheme = englishTheme;
  MyServices myServices = Get.find();

  changeLanguage(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    appTheme = langcode == "ar" ? arabicTheme : englishTheme;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharedPreferlang = myServices.sharedPreferences.getString("lang");
    if (sharedPreferlang == "ar") {
      language = Locale("ar");
      appTheme = arabicTheme;
    } else if (sharedPreferlang == "en") {
      language = Locale("en");
      appTheme = englishTheme;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = englishTheme;
    }
    super.onInit();
  }
}
