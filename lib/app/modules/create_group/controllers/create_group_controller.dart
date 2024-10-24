import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../api/api_endpoints.dart';
import '../../../api/services/base_methods.dart';
import '../../../api/utility/api_status.dart'; // For formatting date and time

class CreateGroupController extends GetxController {
  final formKey = GlobalKey<FormState>();

  // Form fields
  var groupNameController = TextEditingController();
  var membersController = TextEditingController();
  var durationController = TextEditingController();
  var totalAmountController = TextEditingController();
  var perPersonAmountController = TextEditingController();
  var investmentStartDateController = TextEditingController();
  var startTimeController = TextEditingController();  // For start time
  var endTimeController = TextEditingController();    // For end time
  var termsAndConditionController = TextEditingController();
  var termsAndCondition = TextEditingController();

  // Date and Time fields
  var selectedStartTime = Rxn<TimeOfDay>(); // TimeOfDay for time picker
  var selectedEndTime = Rxn<TimeOfDay>();   // TimeOfDay for time picker
  var selectedStartDate = Rxn<DateTime>();   // TimeOfDay for time picker

  var isLoading = false.obs;

  // Method to pick time and update the corresponding TextField
  Future<void> pickTime(
      TextEditingController controller, Rxn<TimeOfDay> timeVariable) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: Get.context!,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      timeVariable.value = pickedTime;
      final formattedTime = pickedTime.format(Get.context!);  // Get formatted time
      controller.text = formattedTime;
    }
  }
  Future<void> pickDate(
      TextEditingController controller, Rxn<DateTime> dateVariable) async {
    DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      dateVariable.value = pickedDate;
      controller.text = DateFormat('yMMMd').format(pickedDate);
    }
  }

  // Convert TimeOfDay to string in "HH:mm:ss" format
  String formatTimeOfDay(TimeOfDay? time) {
    if (time == null) return '';
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return DateFormat('HH:mm:ss').format(dt);  // Convert to string format "HH:mm:ss"
  }

  Future<void> createGroup(BuildContext context) async {
    try {
      if (formKey.currentState!.validate()) {
        isLoading(true);

        var member = int.tryParse(membersController.text) ?? 0;
        var duration = int.tryParse(durationController.text) ?? 0;
        var totalAmount = int.tryParse(totalAmountController.text) ?? 0;
        var perAmount = int.tryParse(perPersonAmountController.text) ?? 0;

        // Convert start time and end time to string format
        String formattedStartTime = formatTimeOfDay(selectedStartTime.value);
        String formattedEndTime = formatTimeOfDay(selectedEndTime.value);

        Map<String, dynamic> data = {
          "group_name": groupNameController.text.trim(),
          "number_of_members": member,
          "group_duration": duration,
          "total_group_amount": totalAmount,
          "per_person_amount": perAmount,
          "investment_date": investmentStartDateController.text.trim(),
          "start_time": formattedStartTime,  // Start time as string
          "end_time": formattedEndTime,      // End time as string
          "is_investment_started": false,
          "terms_conditions": termsAndConditionController.text.trim(),
        };
        print(data);

        // Send the data to the API (your API call logic here)
        await APIMethods.post
            .post(url: APIEndpoints.createData.createGroup, map: data)
            .then((value) {
          if (APIStatus.success(value.statusCode)) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Create Group Successful!'),
                backgroundColor: Colors.green,
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('You must agree to the Terms & Privacy to sign up.'),
                backgroundColor: Colors.red,
              ),
            );
          }
        });
      }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }
}
