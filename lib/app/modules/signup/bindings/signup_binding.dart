import 'package:get/get.dart';

import '../views/signup_view.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupView>(
      () => const SignupView(),
    );
  }
}
