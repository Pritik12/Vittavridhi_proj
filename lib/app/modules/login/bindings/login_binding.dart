import 'package:get/get.dart';
import 'package:vittavridhi/app/modules/login/views/login_form.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Signin>(
      () => const Signin(),
    );
  }
}
