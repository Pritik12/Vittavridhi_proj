import 'package:get/get.dart';

import '../controllers/barrow_page_controller.dart';

class BarrowPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BarrowPageController>(
      () => BarrowPageController(),
    );
  }
}
