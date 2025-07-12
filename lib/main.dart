import 'package:ecommerce/bindings/intialbindings.dart';
import 'package:ecommerce/core/locallization/local_controller.dart';
import 'package:ecommerce/core/locallization/translation.dart';
import 'package:ecommerce/core/services/services.dart';
import 'package:ecommerce/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialization();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocalController controller = Get.put(LocalController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: MyTranslation(),
      locale: controller.language,
      theme: controller.appTheme,
      initialBinding: Intialbindings(),
      getPages: pages,
    );
  }
}
