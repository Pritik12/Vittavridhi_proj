import 'package:get/get.dart';

import '../controllers/all_members_controller.dart';

class AllMembersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllMembersController>(
          () => AllMembersController(),
    );
  }
}
