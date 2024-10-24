// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:vittavridhi/app/core/base/controllers/auth_controller.dart';
// import '../../../../widgets/base_view.dart';
// import '../../../routes/app_pages.dart';
// import '../controllers/home_controller.dart';
//
// class HomeView extends GetView<HomeController> {
//   const HomeView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BaseView(
//       title: "Home",
//       body: Container(
//         color: Colors.white,
//         child: Center(
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 100,
//               ),
//               Container(
//                 height: 240,
//                 child: Image.asset("assets/not found.jpeg"),
//               ),
//               SizedBox(
//                 height: 40,
//               ),
//               ElevatedButton(
//                   onPressed: () {
//                     Get.find<AuthController>().clearAuth();
//                   },
//                   child: Text("Logout")),
//               Container(
//                 child: Text(
//                   "No Investment Found",
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 32,
//                       fontWeight: FontWeight.w500),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class CustomMenuIcon extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 24,
//       height: 18,
//       child: Stack(
//         children: [
//           Positioned(
//             top: 0,
//             left: 0,
//             child: Container(
//               margin: EdgeInsets.only(bottom: 2),
//               width: 16,
//               height: 2,
//               color: Colors.white,
//             ),
//           ),
//           Positioned(
//             top: 7,
//             left: 0,
//             child: Container(
//               width: 20,
//               height: 2,
//               color: Colors.white,
//             ),
//           ),
//           Positioned(
//             top: 14,
//             left: 0,
//             child: Container(
//               width: 14,
//               height: 2,
//               color: Colors.white,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class BottomNavBar extends StatefulWidget {
//   @override
//   _BottomNavBarState createState() => _BottomNavBarState();
// }
//
// class ListRoutes {
//   static List<String> routes = [
//     Routes.HOME,
//     Routes.ALL_GROUPS,
//     Routes.CREATE_GROUP,
//     Routes.NOTIFICATION,
//     Routes.CREATE_GROUP,
//   ];
//   static int currentIndex = 0;
// }
//
// class _BottomNavBarState extends State<BottomNavBar> {
//   bool _showLabels = false;
//
//   void _onItemTapped(int index) {
//     setState(() {
//       ListRoutes.currentIndex = index;
//
//       // _showLabels = true;
//     });
//     Get.toNamed(ListRoutes.routes[index]);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(20), // Adjust top-left radius
//           topRight: Radius.circular(20), // Adjust top-right radius
//         ),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black26,
//             blurRadius: 8,
//             offset: Offset(0, -4), // Shadow position
//           ),
//         ],
//       ),
//       child: BottomNavigationBar(
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home_outlined, size: 32),
//             label: _showLabels && ListRoutes.currentIndex == 0 ? 'Home' : '',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.groups_outlined, size: 32),
//             label: _showLabels && ListRoutes.currentIndex == 1 ? 'Groups' : '',
//           ),
//           BottomNavigationBarItem(
//             icon: Container(
//               width: 70,
//               height: 50,
//               decoration: BoxDecoration(
//                 color: Color.fromARGB(255, 236, 143, 4),
//                 shape: BoxShape.circle,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black26,
//                     blurRadius: 8,
//                     offset: Offset(0, 4), // Shadow position
//                   ),
//                 ],
//               ),
//               child: Icon(
//                 Icons.add,
//                 color: Colors.white,
//                 size: 36,
//               ),
//             ),
//             label: '',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.notifications_none_outlined, size: 32),
//             label: _showLabels && ListRoutes.currentIndex == 3
//                 ? 'Notifications'
//                 : '',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person_3_outlined, size: 32),
//             label: _showLabels && ListRoutes.currentIndex == 4 ? 'Profile' : '',
//           ),
//         ],
//         type: BottomNavigationBarType.fixed,
//         selectedItemColor: Color.fromARGB(255, 236, 143, 4),
//         unselectedItemColor: Colors.grey,
//         backgroundColor: Colors.white,
//         showUnselectedLabels: true,
//         showSelectedLabels: true,
//         currentIndex: ListRoutes.currentIndex,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }
