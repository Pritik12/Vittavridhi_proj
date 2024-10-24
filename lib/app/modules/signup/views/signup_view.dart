import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:vittavridhi/app/modules/signup/widgets/signup_form.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Account();
  }
}
