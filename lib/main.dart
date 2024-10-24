import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:vittavridhi/widgets/custom_scroll.dart';
import 'app/core/base/controllers/auth_controller.dart';
import 'app/routes/app_pages.dart'; // Assuming AppPages is where routes are managed

Future<void> main() async {
  await GetStorage.init();
  await Get.putAsync(() => AuthController().init(), permanent: true);
  await Get.find<AuthController>().initAuth();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "VittaVridhi",
      scrollBehavior: MyCustomScrollBehavior(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      onReady: () async {
        Get.find<AuthController>().refreshAuth();
      },
      debugShowCheckedModeBanner: false,
      // theme: Get.put(ThemeController()).themeData,
    );
  }
}
