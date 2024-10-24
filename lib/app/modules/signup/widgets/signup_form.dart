import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vittavridhi/app/api/utility/debug_print.dart';
import '../../../api/api_endpoints.dart';
import '../../../api/services/base_methods.dart';
import '../../../api/utility/api_status.dart';
import '../../../routes/app_pages.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  bool _isObscured = true;
  bool _isChecked = false;
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  Future<void> submitUser() async {
    try {
      if (_formKey.currentState!.validate()) {
        setState(() {
          isLoading = true;
        });
        var data = {
          "name": nameController.text.trim(),
          "email": emailController.text.trim(),
          "password": passwordController.text.trim(),
          "phone_number": phoneNumberController.text.trim()
        };
        print(data);
        await APIMethods.post
            .post(url: APIEndpoints.auth.signup, map: data)
            .then((value) {
          if (APIStatus.success(value.statusCode)) {
            print(value.data);
            Get.toNamed(Routes.LOGIN);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Sign Up Successful!'),
                backgroundColor: Colors.green,
              ),
            );
          } else {
            printError("Auth Controller", "Signup", value.data);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content:
                    Text('You must agree to the Terms & Privacy to sign up.'),
                backgroundColor: Color(0xFFFF8242),
              ),
            );
          }
        });
      }
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: const Color(0xFFFF8242),
        child: Column(children: [
          Container(
            height: 220,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(),
          ),
          const SizedBox(height: 10),
          Container(
            height: 1.5,
            width: 205, // 60% of screen width
            color: Colors.black,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(top: 0),
                width: MediaQuery.of(context).size.width,
                //height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child: Text(
                            "Create Your Account",
                            style: TextStyle(
                              color: Color(0xFFFF8242),
                              fontSize: 38,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          child: const Center(
                            child: Text(
                              "Join Our Community And Start Managing Your",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: Color.fromARGB(167, 0, 0, 0)),
                            ),
                          ),
                        ),
                        const Center(
                          child: Text(
                            "Group Investments Effortlessly!",
                            style: TextStyle(
                                fontSize: 17,
                                color: Color.fromARGB(167, 0, 0, 0)),
                          ),
                        ),
                        const SizedBox(height: 32),
                        _buildTextField(
                          nameController,
                          label: "Name",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Name is required';
                            }
                            return null;
                          },
                        ),
                        _buildTextField(
                          emailController,
                          label: "Email",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Email is required';
                            } else if (!RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$')
                                .hasMatch(value)) {
                              return 'Enter a valid email address';
                            }
                            return null;
                          },
                        ),
                        _buildTextField(
                          phoneNumberController,
                          label: "Phone Number",
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Phone Number is required';
                            }
                            return null;
                          },
                        ),
                        _buildTextField(
                          passwordController,
                          label: "Password",
                          obscureText: _isObscured,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password is required';
                            } else if (value.length < 8) {
                              return 'Password must be at least 8 characters';
                            }
                            return null;
                          },
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
                        const SizedBox(height: 0),
                        Row(
                          children: [
                            Container(
                              child: IconButton(
                                iconSize: 26,
                                icon: _isChecked
                                    ? const Icon(Icons.check_box,
                                        color: Color.fromARGB(255, 9, 9, 9))
                                    : const Icon(Icons.check_box_outline_blank,
                                        color:
                                            Color.fromARGB(134, 127, 124, 124)),
                                onPressed: () {
                                  setState(() {
                                    _isChecked = !_isChecked;
                                  });
                                },
                              ),
                            ),
                            const Text(
                              "I agree to the",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(187, 0, 0, 0)),
                            ),
                            const SizedBox(width: 3),
                            Container(
                              margin: const EdgeInsets.only(right: 0),
                              child: const Text(
                                "Terms & Privacy",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color(0xFFFF8242),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 18),
                        isLoading
                            ? const CircularProgressIndicator()
                            : Container(
                                height: 50,
                                width: double.infinity,
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
                                  onPressed: () {
                                    submitUser();
                                  },
                                  style: TextButton.styleFrom(
                                    // Setting the background color here will not be needed as we are using the gradient
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12, horizontal: 80),
                                  ),
                                  child: const Text(
                                    "Sign Up",
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Already have an account?",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(128, 0, 0, 0)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.LOGIN);
                                },
                                child: const Text(
                                  "Sign in",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xFFFF8242),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller, {
    required String label,
    bool obscureText = false,
    required FormFieldValidator<String> validator,
    Widget? suffixIcon,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10), // Left margin of 15
            child: Text(
              label,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(167, 0, 0, 0)),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 45,
            child: TextFormField(
              obscureText: obscureText,
              controller: controller,
              decoration: InputDecoration(
                fillColor: const Color(0xFFFDF0E8),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                suffixIcon: suffixIcon,
              ),
              validator: validator,
            ),
          ),
        ],
      ),
    );
  }
}
