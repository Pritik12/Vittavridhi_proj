import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '/app/routes/route_access.dart';

class AuthCheckMiddleware extends GetMiddleware {
  // final box = GetStorage();

  @override
  RouteSettings? redirect(String? route) {
    print("ddddd");

    return AppRouteAccess.handleRedirect(route ?? "/");
  }
}
