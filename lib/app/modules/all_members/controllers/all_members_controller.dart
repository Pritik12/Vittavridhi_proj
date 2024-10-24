import 'package:get/get.dart';

class Member {
  final String name;
  final String phoneNumber;

  Member({required this.name, required this.phoneNumber});
}

class AllMembersController extends GetxController {
  var members = <Member>[].obs;
  var isLoading = false.obs;
}
