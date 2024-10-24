import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../api/api_endpoints.dart';
import '../../../api/services/base_methods.dart';
import '../../../api/utility/api_status.dart';
import '../../../core/base/controllers/auth_controller.dart';
import '../../signup/widgets/signup_form.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isObscured = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool isLoading = false;
  Future<void> submitUser() async {
    try {
      setState(() {
        isLoading = true;
      });
      Map<String, dynamic> data = {
        "email": _emailController.text.trim(),
        "password": _passwordController.text.trim(),
      };

      await APIMethods.post
          .post(url: APIEndpoints.auth.login, map: data)
          .then((value) {
        if (APIStatus.success(value.statusCode)) {
          Get.find<AuthController>().setAuth(
            value.data["access_token"],
            value.data["refresh_token"],
          );

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Login Successful!'),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Signin()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content:
                  Text('You must agree to the Terms & Privacy to sign up.'),
              backgroundColor: Color(0xFFFF8242),
            ),
          );
        }
      });
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  bool _isEmailValid(String email) {
    final RegExp emailRegExp = RegExp(
      r'^[^@]+@[^@]+\.[^@]+$',
      caseSensitive: false,
    );
    return emailRegExp.hasMatch(email);
  }

  void _onButtonPressed() {
    if (!_isEmailValid(_emailController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Please enter a valid email address",
            style: TextStyle(
              color: Color(0xFFFF8242),
            ),
          ),
        ),
      );
      return;
    }

    if (_passwordController.text.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Password must be at least 6 characters long",
            style: TextStyle(
              color: Color(0xFFFF8242),
            ),
          ),
        ),
      );
      return;
    }

    if (!_passwordController.text.contains('@')) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Password must contain at least one '@' symbol",
            style: TextStyle(
              color: Color(0xFFFF8242),
            ),
          ),
        ),
      );
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        color: const Color(0xFFFF8242),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: screenHeight * 0.24, // 25% of screen height
                width: screenWidth,
                decoration: const BoxDecoration(
                    // image: DecorationImage(
                    // image: AssetImage("assets/second.jpg"),
                    // fit: BoxFit.cover,
                    // ),
                    ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 1.5,
                width: screenWidth * 0.5, // 60% of screen width
                color: Colors.black,
              ),
              Container(
                height: screenHeight * 0.75, // 65% of screen height
                width: screenWidth,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 26),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        const Text(
                          "Welcome Back",
                          style: TextStyle(
                            color: Color(0xFFFF8242),
                            fontSize: 38,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Sign In To Continue Managing Your Group",
                          style: TextStyle(
                              fontSize: 17,
                              color: Color.fromARGB(167, 0, 0, 0)),
                        ),
                        const Text(
                          "Investments",
                          style: TextStyle(
                              fontSize: 17,
                              color: Color.fromARGB(167, 0, 0, 0)),
                        ),
                        const SizedBox(height: 35),
                        const Padding(
                          padding: EdgeInsets.only(right: 285),
                          child: Text(
                            "Email",
                            style: TextStyle(
                                fontSize: 18,
                                //fontWeight: FontWeight.w800,
                                color: Color.fromARGB(244, 0, 0, 0)),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: SizedBox(
                            height: 45,
                            width: screenWidth * 0.9, // 90% of screen width
                            child: TextField(
                              controller: _emailController,
                              decoration: const InputDecoration(
                                fillColor: Color(0xFFFDF0E8),
                                filled: true,
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 20),
                              ),
                              keyboardType: TextInputType.emailAddress,
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        const Padding(
                          padding: EdgeInsets.only(right: 265),
                          child: Text(
                            "Password",
                            style: TextStyle(
                                fontSize: 18,
                                //fontWeight: FontWeight.w500,
                                color: Color.fromARGB(244, 0, 0, 0)),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: SizedBox(
                            height: 45,
                            width: screenWidth * 0.9, // 90% of screen width
                            child: TextField(
                              controller: _passwordController,
                              obscureText: _isObscured,
                              decoration: InputDecoration(
                                fillColor: const Color(0xFFFDF0E8),
                                filled: true,
                                border: InputBorder.none,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isObscured
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    size: 16,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isObscured = !_isObscured;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 14),
                        const Padding(
                          padding: EdgeInsets.only(right: 220),
                          child: Text(
                            "Forgot Password ?",
                            style: TextStyle(
                                color: Color(0xFFFF8242),
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                        ),
                        const SizedBox(height: 45),
                        // Replace the TextButton widget with this Container widget
                        isLoading
                            ? const CircularProgressIndicator()
                            : Container(
                                height: 50,
                                width: screenWidth * 0.9, // 90% of screen width
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color.fromARGB(255, 253, 147,
                                          65), // First color of the gradient
                                      Color(0xFFFF8242),
                                      Color.fromARGB(255, 253, 147, 65),
                                      // Second color of the gradient (you can change this color)
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextButton(
                                  onPressed: () => submitUser(),
                                  style: TextButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 80),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child: const Text(
                                    "Sign In",
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),

                        const SizedBox(height: 80),
                        Padding(
                          padding: const EdgeInsets.only(left: 74, bottom: 10),
                          child: Row(
                            children: [
                              const Text(
                                "Don't have an account?",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(128, 0, 0, 0)),
                              ),
                              const SizedBox(width: 4),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Signin()));
                                },
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const Account(),
                                        ));
                                  },
                                  child: const Text(
                                    "Sign Up",
                                    style: TextStyle(
                                      fontSize: 20,
                                      //fontWeight: FontWeight.w600,
                                      color: Color(0xFFFF8242),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
