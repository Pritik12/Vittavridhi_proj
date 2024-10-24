import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/app/core/base/controllers/auth_controller.dart';

import 'app_pages.dart';

class AppRouteAccess {
  static RouteSettings? handleRedirect(String currentRoute,
      {bool? isAuthChange = false}) {
    print(Get.find<AuthController>().isAuthenticated.value);
    if (Get.find<AuthController>().isAuthenticated.value == false) {
      Get.offAllNamed(Routes.SIGNUP);
    }

    return null;
  }
}
