// import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
// // import 'package:amplify_flutter/amplify_flutter.dart';
// // import 'package:flutter_native_splash/flutter_native_splash.dart';
// import 'package:get/get.dart';
// import 'package:get/get_rx/get_rx.dart';
// import 'package:get/get_rx/src/rx_types/rx_types.dart';
// import 'package:get_storage/get_storage.dart';
// // import 'package:petrocube/app/modules/home/controllers/home_controller.dart';

// // import '../../../../amplifyconfiguration.dart';
// import '../../../api/api_endpoints.dart';
// import '../../../api/services/base_methods.dart';
// import '../../../api/utility/api_status.dart';
// import '../../../api/utility/debug_print.dart';
// // import '../../../modules/signup/views/verify_veiw.dart';
// import '../../../routes/app_pages.dart';
// import '../../../routes/route_access.dart';

// import '../../login_model.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';
import '../../../routes/route_access.dart';

class AuthController extends GetxController {
  Future<AuthController> init() async => this;
  final _authToken = "".obs;
  RxBool isLogOut = false.obs;
  RxBool flowloader = false.obs;

  final _deviceToken = "".obs;
  String get authToken => _authToken.value;
  String get deviceToken => _deviceToken.value;
  RxBool isAuthenticated = false.obs;
  RxList flow = [].obs;

  set authToken(value) => _authToken.value = value;
  set deviceToken(value) => _deviceToken.value = value;
  final box = GetStorage();
  var userId = "".obs;
  var loginType = "Dealer".obs;
  void refreshAuth() {
    isAuthenticated.refresh();

    tokenVaildate() {
      var authTokenr = box.read("authToken");
      var refreshTokend = box.read("refreshToken");
      print("authToken $authToken");
      if (box.hasData("authToken")) {
        setAuth(authTokenr, refreshTokend!);

        print("ddff $authTokenr");
        isAuthenticated.value = true;
      }
    }
  }

  setAuth(String token, String refToken) async {
    authToken = token;
    isAuthenticated.value = true;
    await box.write('authToken', authToken);
    await box.write('refreshToken', refToken);
    print("sdadada$token,$refToken");
    Get.toNamed(Routes.HOME);
  }

  initAuth() async {
    // await configureAmplify();

    await validateAuth();
    ever(isAuthenticated, (auth) => handleAuthChange());

    // FlutterNativeSplash.remove();
  }

  validateAuth() async {
    await tokenVaildate();
    return isAuthenticated.value;
  }

  handleAuthChange() {
    print("dddd handleAuthChange  ${Get.currentRoute}");
    if (isLogOut.value) {
      print("handleAuthChange isLogOut");
      Get.offAllNamed(Routes.LOGIN);
    } else {
      AppRouteAccess.handleRedirect(Get.currentRoute, isAuthChange: true);
    }
  }

  tokenVaildate() {
    var authTokenr = box.read("authToken");
    var refreshTokend = box.read("refreshToken");
    print("ddf $authToken");
    if (box.hasData("authToken")) {
      setAuth(authTokenr, refreshTokend!);

      print("ddff $authTokenr");
      isAuthenticated.value = true;
    }
  }

  void clearAuth() {
    authToken = "";
    box.remove('redirect');
    isAuthenticated.value = false;
    box.remove('authToken');
    box.remove('refreshToken');
  }
}
