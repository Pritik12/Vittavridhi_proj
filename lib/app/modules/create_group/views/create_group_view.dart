import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vittavridhi/widgets/base_view.dart';
import '../controllers/create_group_controller.dart';

class CreateGroupView extends GetView<CreateGroupController> {
  const CreateGroupView({super.key});

  @override
  Widget build(BuildContext context) {
    final CreateGroupController controller = Get.find<CreateGroupController>();
    return BaseView(
      title: "Create A New Group",
      body: Container(
        margin: const EdgeInsets.only(top: 25),
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Form(
                key: controller.formKey,
                child: ListView(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  children: [
                    const Text("Group Name"),
                    // Group Name
                    TextFormField(
                      controller: controller.groupNameController,
                      decoration: InputDecoration(
                          labelText: 'Monthly Savings Group',
                          labelStyle: const TextStyle(color: Color(0xFF718BAE)),
                          border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.zero, // Rectangular shape
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFA6BCDA)),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xFFA6BCDA)),
                              borderRadius: BorderRadius.circular(15))),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a group name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),

                    // Row for Number of Members and Group Duration
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Number of Members"),
                              const SizedBox(height: 8),
                              // Space between the label and the text field
                              TextFormField(
                                controller: controller.membersController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    labelText: '10',
                                    labelStyle: const TextStyle(
                                        color: Color(0xFF718BAE)),
                                    border: const OutlineInputBorder(
                                      borderRadius: BorderRadius
                                          .zero, // Rectangular shape
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFFA6BCDA)),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFFA6BCDA)),
                                      borderRadius: BorderRadius.circular(5),
                                    )),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter the number of members';
                                  }
                                  if (int.tryParse(value) == null) {
                                    return 'Please enter a valid number';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                            width: 15), // Space between the two columns
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Group Duration"),
                              const SizedBox(height: 8),
                              // Space between the label and the text field
                              TextFormField(
                                controller: controller.durationController,
                                decoration: InputDecoration(
                                    labelText: '12 months',
                                    labelStyle: const TextStyle(
                                        color: Color(0xFF718BAE)),
                                    border: const OutlineInputBorder(
                                      borderRadius: BorderRadius
                                          .zero, // Rectangular shape
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFFA6BCDA)),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFFA6BCDA)),
                                      borderRadius: BorderRadius.circular(5),
                                    )),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter group duration';
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),

                    // Total Group Amount
                    const Text("Total Group Amount"),
                    TextFormField(
                      controller: controller.totalAmountController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: '₹100,000',
                          labelStyle: const TextStyle(color: Color(0xFF718BAE)),
                          border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.zero, // Rectangular shape
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFA6BCDA)),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFA6BCDA)),
                            borderRadius: BorderRadius.circular(5),
                          )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter total group amount';
                        }
                        if (int.tryParse(value) == null) {
                          return 'Please enter a valid amount';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),

                    // Per Person Amount
                    const Text("Per Person Amount"),
                    TextFormField(
                      controller: controller.perPersonAmountController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: '₹10,000',
                          labelStyle: const TextStyle(color: Color(0xFF718BAE)),
                          border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.zero, // Rectangular shape
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFA6BCDA)),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFA6BCDA)),
                            borderRadius: BorderRadius.circular(5),
                          )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter per person amount';
                        }
                        if (int.tryParse(value) == null) {
                          return 'Please enter a valid amount';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 15),

                    // Investment Start Date
                    const Text("Investment Start Date"),
                    GestureDetector(
                      onTap: () {
                        controller.pickDate(
                            controller.investmentStartDateController,
                            controller.selectedStartDate);
                      },
                      child: AbsorbPointer(
                        child: TextFormField(
                          controller: controller.investmentStartDateController,
                          // Start Time Controller
                          readOnly: true,
                          // To prevent manual text input
                          decoration: InputDecoration(
                              labelText: 'Oct 9, 2024',
                              labelStyle:
                                  const TextStyle(color: Color(0xFF718BAE)),
                              // suffixIcon: Icon(Icons.date_range),
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.zero, // Rectangular shape
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Color(0xFFA6BCDA)),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Color(0xFFA6BCDA)),
                                borderRadius: BorderRadius.circular(5),
                              )),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select a start time';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    //Start time
                    const Text("Start Time"),
                    GestureDetector(
                      onTap: () {
                        controller.pickTime(controller.startTimeController,
                            controller.selectedStartTime);
                      },
                      child: AbsorbPointer(
                        child: TextFormField(
                          controller: controller.startTimeController,
                          // Start Time Controller
                          readOnly: true,
                          // To prevent manual text input
                          decoration: InputDecoration(
                              labelText: '5:47 PM',
                              labelStyle:
                                  const TextStyle(color: Color(0xFF718BAE)),
                              // suffixIcon: Icon(Icons.access_time),
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.zero, // Rectangular shape
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Color(0xFFA6BCDA)),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Color(0xFFA6BCDA)),
                                borderRadius: BorderRadius.circular(5),
                              )),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select a start time';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),

                    // Circle Investment Date
                    const Text("End Time"),
                    GestureDetector(
                      onTap: () {
                        controller.pickTime(controller.endTimeController,
                            controller.selectedEndTime);
                      },
                      child: AbsorbPointer(
                        child: TextFormField(
                          controller: controller.endTimeController,
                          // End Time Controller
                          readOnly: true,
                          decoration: InputDecoration(
                              labelText: '2:34 AM',
                              labelStyle:
                                  const TextStyle(color: Color(0xFF718BAE)),
                              // suffixIcon: Icon(Icons.access_time),
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.zero, // Rectangular shape
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Color(0xFFA6BCDA)),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Color(0xFFA6BCDA)),
                                borderRadius: BorderRadius.circular(5),
                              )),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select a circle investment date';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),
                    const Text("Terms And Condition"),
                    const SizedBox(height: 10),

                    TextFormField(
                      controller: controller.termsAndCondition,
                      maxLines: 5,
                      minLines: 3,
                      decoration: InputDecoration(
                          labelText: 'Write',
                          labelStyle: const TextStyle(color: Color(0xFF718BAE)),

                          // suffixIcon: Icon(Icons.calendar_today),
                          border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.zero, // Rectangular shape
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFA6BCDA)),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFA6BCDA)),
                            borderRadius: BorderRadius.circular(5),
                          )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please fill blank';
                        }
                        return null;
                      },
                    ),
                    // Terms & Conditions

                    const SizedBox(height: 15),

                    // Create Group Button
                    Obx(() {
                      return controller.isLoading.value
                          ? const Center(child: CircularProgressIndicator())
                          : Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: const LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 253, 147, 65),
                                    // First color of the gradient
                                    Color(0xFFFF8242),
                                    Color.fromARGB(255, 253, 147, 65),
                                    // Second color of the gradient (you can change this color)
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  controller.createGroup(context);
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                child: const Text(
                                  'Create Group',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            );
                    }),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
