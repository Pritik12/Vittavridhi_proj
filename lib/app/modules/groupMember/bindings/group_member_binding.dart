import 'package:get/get.dart';

import '../controllers/group_member_controller.dart';

class GroupMemberBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GroupMemberController>(
          () => GroupMemberController(),
    );
  }
}