import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../api/api_endpoints.dart';
import '../../../api/services/base_methods.dart';
import '../../../api/utility/api_status.dart';

class BarrowPageController extends GetxController {
  // TextEditingController for the amount input
  final amountController = TextEditingController();

  // Transaction list (dynamic state management with GetX's observables)
  var transactions = [
    {"name": "Aashish", "phoneNumber": "9823456780", "amount": 7500},
    {"name": "Ankur", "phoneNumber": "9823456780", "amount": 5000},
    {"name": "Keshav", "phoneNumber": "9823456780", "amount": 4500},
    {"name": "Tushar", "phoneNumber": "9823456780", "amount": 0},
  ].obs;

  // Function to validate and add the amount
  void addAmount() {
    String amountText = amountController.text;
    if (amountText.isEmpty) {
      Get.snackbar('Error', 'Please enter an amount');
      return;
    }
    int? amount = int.tryParse(amountText);
    if (amount == null) {
      Get.snackbar('Error', 'Please enter a valid number');
      return;
    }

    // Add logic to handle the new amount addition
    // You can decide where this amount gets added or stored
    Get.snackbar('Success', 'Amount added successfully');
  }

  @override
  void onClose() {
    amountController.dispose();
    super.onClose();
  }

  var isLoading = false.obs;
  var isAmount = TextEditingController();
  var data = [].obs;

  Future<void> submitUser(context, id) async {
    try {
      isLoading.value = true;
      print(id);
      await APIMethods.get
          .get(
        url: "${APIEndpoints.group.pooledRequests}/$id",
      )
          .then((value) {
        if (APIStatus.success(value.statusCode)) {
          data(value.data);
          print(data);

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Data Fetch Successfully!'),
              backgroundColor: Colors.green,
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Not Added"),
              backgroundColor: Colors.red,
            ),
          );
        }
      });
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getByMonth(context, id, month) async {
    try {
      isLoading.value = true;
      print(id);
      await APIMethods.get
          .get(
        url: "${APIEndpoints.group.pooledRequests}/$id/$month",
      )
          .then((value) {
        if (APIStatus.success(value.statusCode)) {
          data(value.data);
          print(data);

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Data Fetch Successfully!'),
              backgroundColor: Colors.green,
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Not Added"),
              backgroundColor: Colors.red,
            ),
          );
        }
      });
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getUserData(context, id, month) async {
    try {
      // Logging the start of the API call
      isLoading.value = true;
      print("Fetching data for user ID: $id, Month: $month");

      // Making the API call and logging the endpoint
      print("Calling API: ${APIEndpoints.group.userGroup}");
      await APIMethods.get
          .get(
        url: APIEndpoints.group.userGroup,
      )
          .then((value) {
        // Logging the API response status code
        print("API response status code: ${value.statusCode}");

        // Checking if the API call was successful
        if (APIStatus.success(value.statusCode)) {
          // Logging the fetched data
          data(value.data);
          print("Data fetched successfully: ${value.data}");

          // Showing success notification
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Data Fetch Successfully!'),
              backgroundColor: Colors.green,
            ),
          );
        } else {
          // Logging the failure response
          print("Failed to fetch data, status code: ${value.statusCode}");

          // Showing failure notification
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Not Added"),
              backgroundColor: Colors.red,
            ),
          );
        }
      });
    } catch (e) {
      // Logging any errors that occur during the try block
      print("Error occurred while fetching data: $e");
    } finally {
      // Logging the completion of the API call and updating loading status
      isLoading.value = false;
      print("API call completed, isLoading set to false");
    }
  }

// New function to fetch user data from the API
// Future<void> fetchUserData(context, name , phoneNumber) async {
//   try {
//     isLoading.value = true;
//     print(name);
//     print(phoneNumber);
//
//     await APIMethods.get.get(
//       url: "${APIEndpoints.group.userGroup}/$name/$phoneNumber", // Update with your actual user data endpoint
//     ).then((value) {
//       if (APIStatus.success(value.statusCode)) {
//         // List<dynamic> userData = value.data;
//
//         // Clear previous transactions
//         transactions.clear();
//
//         // Iterate through the user data and add it to transactions
//         for (var user in userData) {
//           transactions.add({
//             "name": user["name"],
//             "phoneNumber": user["phone_number"],
//             "amount": 0, // Set default amount or adjust as needed
//           });
//         }
//
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('User Data Fetch Successfully!'),
//             backgroundColor: Colors.green,
//           ),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text("Failed to Fetch User Data"),
//             backgroundColor: Colors.red,
//           ),
//         );
//       }
//     });
//   } catch (e) {
//     print(e);
//   } finally {
//     isLoading.value = false;
//   }
//   @override
//   void onInit() {
//     super.onInit();
//     // Fetch user data when the controller is initialized
//     fetchUserData(Get.context!);
//   }
// }
// }
//
//           data(value.data);
//           print(data);
//
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text('Data Fetch Successfully!'),
//               backgroundColor: Colors.green,
//             ),
//           );
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(
//               content: Text("Not Added"),
//               backgroundColor: Colors.red,
//             ),
//           );
//         }
//       });
//     } catch (e) {
//       print(e);
//     } finally {
//       isLoading.value = false;
//     }
//   }
}
