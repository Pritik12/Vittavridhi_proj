import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vittavridhi/app/core/base/controllers/auth_controller.dart';
import '../../../../widgets/base_view.dart';
import '../controllers/home_controller.dart';

class HomeView2 extends GetView<HomeController> {
  const HomeView2({super.key});

  @override
  Widget build(BuildContext context) {
    // Show No Investment Found screen
    return BaseView(
      title: "Home",
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 100),
              SizedBox(
                height: 240,
                child: Image.network("assets/not found.jpeg"),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Get.find<AuthController>().clearAuth();
                },
                child: const Text("Logout"),
              ),
              const Text(
                "No Investment Found",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomMenuIcon extends StatelessWidget {
  const CustomMenuIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24,
      height: 18,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              margin: const EdgeInsets.only(bottom: 2),
              width: 16,
              height: 2,
              color: Colors.white,
            ),
          ),
          Positioned(
            top: 7,
            left: 0,
            child: Container(
              width: 20,
              height: 2,
              color: Colors.white,
            ),
          ),
          Positioned(
            top: 14,
            left: 0,
            child: Container(
              width: 14,
              height: 2,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
