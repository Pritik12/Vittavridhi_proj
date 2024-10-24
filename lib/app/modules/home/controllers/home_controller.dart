import 'package:get/get.dart';
import '../../../api/api_endpoints.dart';
import '../../../api/services/base_methods.dart';
import '../../../api/utility/api_status.dart';
import '../views/home_view_page.dart';

class HomeController extends GetxController {
  var investedAmount = 150000.obs;
  var totalBorrowed = 75000.obs;
  var profitAmount = 3500.obs;
  var increasePercentage = 10.obs;
  var groupInvestments = <GroupInvestment>[].obs; // Observable list for group investments
  var isLoading = false.obs; // Observable variable for loading state

  @override
  void onInit() {
    super.onInit();
    fetchGroupInvestments(); // Fetch investments when the controller is initialized
  }

  @override
  void onClose() {
    groupInvestments.clear(); // Clear investments on controller close
    super.onClose();
  }

  // Method to fetch group investment data
  Future<void> fetchGroupInvestments() async {
    try {
      isLoading(true); // Set loading state to true
      print('Calling API: ${APIEndpoints.group.groups}');

      final response = await APIMethods.get.get(url: APIEndpoints.group.groups);
      print('API Response: ${response.data}'); // Log the entire API response

      if (APIStatus.success(response.statusCode)) {
        // Ensure the response data is not null and is a list
        if (response.data != null && response.data is List) {
          groupInvestments.assignAll(
            (response.data as List).map((item) {
              final groupInvestment = GroupInvestment.fromJson(item as Map<String, dynamic>);
              return groupInvestment;
            }).toList(),
          );
          calculateInvestmentMetrics(); // Calculate metrics after fetching
        } else {
          Get.snackbar('Error', 'Unexpected data format received.');
        }
      } else {
        Get.snackbar('Error', 'Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: ${e.toString()}');
    } finally {
      isLoading(false); // Set loading state to false
    }
  }

  void calculateInvestmentMetrics() {
    // Example calculation (update as needed)

    // Implement additional calculations as necessary
  }
}
