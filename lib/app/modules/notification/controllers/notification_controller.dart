import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../api/api_endpoints.dart';
import '../../../api/services/base_methods.dart';
import '../../../api/utility/api_status.dart';

class NotificationController extends GetxController {
  //TODO: Implement NotificationController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    submitUser();
  }

  var isLoading = false.obs;
  var isAmount = TextEditingController();
  var data = [].obs;
  Future<void> submitUser() async {
    try {
      isLoading.value = true;
      // });
      // print(id);
      await APIMethods.get
          .get(
        url: "${APIEndpoints.baseURL}/all_notifications",
      )
          .then((value) {
        if (APIStatus.success(value.statusCode)) {
          // setState(() {
          data(value.data);
          // });
          print(data);

          // clearDetails();
          // Get.find<AuthController>().setAuth(
          //   value.data["access_token"],
          //   value.data["refresh_token"],
          // );
          Get.snackbar("Data", "Proceed",
              colorText: Colors.white, backgroundColor: Colors.green.shade300);
          // Get.snackbar("Data", "Proceed");
          // ScaffoldMessenger.of(context).showSnackBar(
          //   const SnackBar(
          //     content: Text('Data Fetch Successfully!'),
          //     backgroundColor: Colors.green,
          //   ),
          // );
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(builder: (context) => const Signin()),
          // );
          // Get.back();

          // getData();
          // printSuccess("Auth Controller Signup", "Signup", value.data);

          // Get.snackbar("Message", "data inser");
        } else {
          // printError("Auth Controller", "Signup", value.data);

          Get.snackbar("Data", "Not Proceed");
          // ScaffoldMessenger.of(context).showSnackBar(
          //   const SnackBar(
          //     content: Text("Not Added"),
          //     backgroundColor: Colors.red,
          //   ),
          // );
        }
      });
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
    // if (_formKey.currentState!.validate()) {
  }

  void increment() => count.value++;
}
