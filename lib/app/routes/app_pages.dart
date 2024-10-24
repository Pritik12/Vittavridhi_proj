import 'package:get/get.dart';
import 'package:vittavridhi/app/modules/home/views/home_view_page.dart';
import 'package:vittavridhi/app/modules/login/views/login_form.dart';

import '../core/middleware/global_middleware.dart';
import '../modules/all_groups/bindings/all_groups_binding.dart';
import '../modules/all_groups/views/all_groups_view.dart';
import '../modules/all_members/bindings/all_members_binding.dart';
import '../modules/all_members/views/all_members_view.dart';
import '../modules/barrow_page/bindings/barrow_page_binding.dart';
import '../modules/barrow_page/views/barrow_page_view.dart';
import '../modules/create_group/bindings/create_group_binding.dart';
import '../modules/create_group/views/create_group_view.dart';
import '../modules/groupMember/bindings/group_member_binding.dart';
import '../modules/groupMember/views/group_member_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/notification/bindings/notification_binding.dart';
import '../modules/notification/views/notification_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';

// import 'package:vittavridhi/app/modules/signup/controllers/signup_controller.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // static const INITIAL = Routes.BARROW_PAGE ;

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
        name: _Paths.HOME,
        page: () => const HomeViewPage(),
        binding: HomeBinding(),
        middlewares: [AuthCheckMiddleware()]),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
      // middlewares: [AuthCheckMiddleware()]
    ),
    GetPage(
      name: _Paths.Signin,
      page: () => const Signin(),
      binding: LoginBinding(),
      //  middlewares: [AuthCheckMiddleware()]
    ),
    GetPage(
        name: _Paths.CREATE_GROUP,
        page: () => const CreateGroupView(),
        binding: CreateGroupBinding(),
        middlewares: [AuthCheckMiddleware()]),
    GetPage(
        name: _Paths.ALL_GROUPS,
        page: () => const AllGroupsView(),
        binding: AllGroupsBinding(),
        middlewares: [AuthCheckMiddleware()]),
    GetPage(
        name: _Paths.ALL_MEMBERS,
        page: () => const AllMembersView(),
        binding: AllMembersBinding(),
        middlewares: [AuthCheckMiddleware()]),
    GetPage(
        name: _Paths.BARROW_PAGE,
        page: () => const BarrowPageView(),
        binding: BarrowPageBinding(),
        middlewares: [AuthCheckMiddleware()]),
    GetPage(
        name: _Paths.GROUP_MEMBER,
        page: () => const GroupMemberView(),
        binding: GroupMemberBinding(),
        middlewares: [AuthCheckMiddleware()]),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => const NotificationView(),
      binding: NotificationBinding(),
      middlewares: [AuthCheckMiddleware()],
    ),
  ];
}
