import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../api/api_endpoints.dart';
import '../../../api/services/base_methods.dart';
import '../../../api/utility/api_status.dart';
import '../../../routes/app_pages.dart';
import '../controllers/barrow_page_controller.dart';
import 'package:intl/intl.dart';

class BarrowPageView extends GetView<BarrowPageController> {
  const BarrowPageView({super.key});

  @override
  Widget build(BuildContext context) {
    String id = Get.parameters["id"] ?? "";

    Map<String, dynamic> data = Get.arguments ?? {};
    print(data);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF8242),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.toNamed(Routes.ALL_GROUPS);
            // Handle drawer or menu action here
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Handle notification action here
            },
          ),
          const CircleAvatar(
            backgroundColor: Colors.white,
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildGroupInfo(data),
              const SizedBox(height: 16),
              _buildAmountInputForm(id),
              const Row(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  // ElevatedButton(
                  //     style: ButtonStyle(
                  //         backgroundColor: WidgetStatePropertyAll(Colors.white)),
                  //     onPressed: () {
                  //       controller.submitUser(
                  //         context,
                  //         id,
                  //
                  //
                  //
                  //       );
                  //     },
                  //     child: Text("Recent")),
                  // // Expanded(
                  // //   child: SizedBox(
                  // //     height: 60,
                  // //     child: Container(
                  // //       child: ListView.builder(
                  // //           itemCount: 12,
                  // //           shrinkWrap: true,
                  // //           scrollDirection: Axis.horizontal,
                  // //           itemBuilder: (context, index) {
                  // //             return InkWell(
                  // //               // mouseCursor: MouseCursor.defer,
                  // //
                  // //               onTap: () {
                  // //                 controller.getByMonth(context, id, index + 1);
                  // //               },
                  // //               child: Container(
                  // //                 padding: EdgeInsets.all(10),
                  // //                 alignment: Alignment.center,
                  // //                 decoration: BoxDecoration(
                  // //                     shape: BoxShape.circle, color: Colors.white),
                  // //                 child: SizedBox(
                  // //                     width: 20,
                  // //                     height: 20,
                  // //                     child: Row(
                  // //                       mainAxisAlignment: MainAxisAlignment.center,
                  // //                       children: [
                  // //                         Text("${index + 1}"),
                  // //                       ],
                  // //                     )),
                  // //               ),
                  // //             );
                  // //           }),
                  // //     ),
                  // //   ),
                  // // ),
                ],
              ),
              _buildTransactionsHeader(),
              ShowAmountCard(
                id: id,
                controller: controller,
              ),
              // Expanded(child: _buildTransactions()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGroupInfo(data) {
    return Container(
      height: 180,
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(
            color: Colors.black45,
            spreadRadius: -20,
            blurRadius: 10,
            offset: Offset(20, -15))
      ], borderRadius: BorderRadius.circular(20)),
      child: Card(
        color: Colors.white,
        margin: const EdgeInsets.only(bottom: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    data['group_name'] ?? "",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 6,
              ),
              Container(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFE5CF),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              width: 30,
                              height: 30,
                              child: const Icon(
                                Icons.groups_2_outlined,
                                color: Colors.orange,
                              ),
                            ),
                            const SizedBox(width: 5.0),
                            Text('${data['number_of_members'] ?? ''} Members'),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Row(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFFE5CF),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                width: 30,
                                height: 30,
                                child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFFE5CF),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    width: 30,
                                    height: 30,
                                    child: const Icon(Icons.calendar_today,
                                        color: Colors.orange))),
                            const SizedBox(width: 5.0),
                            Text(
                                'Duration: ${data['group_duration'] ?? ''} Months'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              Container(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Row(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFFE5CF),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                width: 30,
                                height: 30,
                                child: const Icon(
                                    Icons.monetization_on_outlined,
                                    color: Colors.orange)),
                            const SizedBox(width: 5.0),
                            Expanded(
                                child: Text(
                                    'Total Amount: ₹${data['total_group_amount'] ?? ""}')),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Row(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFFE5CF),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                width: 30,
                                height: 30,
                                child: const Icon(Icons.person_2_outlined,
                                    color: Colors.orange)),
                            const SizedBox(width: 5.0),
                            Expanded(
                              child: Text(
                                  'Per Person: ₹${data['per_person_amount'] ?? ''}'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              Container(
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFE5CF),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              width: 30,
                              height: 30,
                              child: const Icon(Icons.access_time,
                                  color: Colors.orange)),
                          const SizedBox(width: 5.0),
                          Expanded(
                              child: Text(
                                  'Start Time: ${data['start_time'] ?? ""}')),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFE5CF),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              width: 30,
                              height: 30,
                              child: const Icon(Icons.calendar_month,
                                  color: Colors.orange)),
                          const SizedBox(width: 5.0),
                          Expanded(
                              child: Text(
                                  'Start Date: ${data['investment_date'] ?? ""}')),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _buildInfoRow(String label, String value, IconData icon) {
  //   return Expanded(
  //     child: Row(
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: [
  //         Container(
  //           decoration: BoxDecoration(
  //             color: Color(0xFFFFE5CF),
  //             borderRadius: BorderRadius.circular(10)
  //           ),
  //           child: Icon(
  //             icon,
  //             size: 16,
  //             color: Color(0xFFFF8242),
  //           ),
  //         ),
  //         SizedBox(width: 4), // Reduced spacing between icon and label
  //         Text(
  //           '$label: ',
  //           style: TextStyle(
  //             fontSize: 15,
  //             fontWeight: FontWeight.normal,
  //             color: Colors.grey[700],
  //           ),
  //         ),
  //         SizedBox(width: 4), // Small space between label and value
  //         Expanded(
  //           child: Text(
  //             value,
  //             style: TextStyle(
  //               fontSize: 15,
  //               fontWeight: FontWeight.normal,
  //               color: Colors.grey[700],
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildAmountInputForm(id) {
    return AddAmountForm(controller: controller, id: id);
  }

  Widget _buildTransactionsHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Transactions',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Color(0xFF4B5563)),
        ),
        TextButton(
          onPressed: () {
            // Handle View all
          },
          child: const Text(
            'View all',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Color(0xFF4B5563)),
          ),
        ),
      ],
    );
  }
}

class ShowAmountCard extends StatefulWidget {
  const ShowAmountCard({super.key, required this.id, required this.controller});

  final String id;
  final BarrowPageController controller;

  @override
  State<ShowAmountCard> createState() => _ShowAmountCardState();
}

class _ShowAmountCardState extends State<ShowAmountCard> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   widget.controller.submitUser(context, widget.id);
  // }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return widget.controller.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Expanded(
              child: Container(
                child: ListView.builder(
                  itemCount: widget.controller.data.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    final transaction = widget.controller.data[index];
                    return _buildTransactionItem(
                      transaction['user_name'] as String,
                      "${transaction['request_time']}",
                      (transaction['requested_amount'] is int)
                          ? transaction['requested_amount'] as int
                          : (transaction['requested_amount'] is double)
                              ? (transaction['requested_amount'] as double)
                                  .toInt()
                              : 0, // Provide a default value or handle the error case as needed
                    );
                  },
                ),
              ),
            );
    });
  }

  Widget _buildTransactionItem(
      String name, String requestTime, dynamic amount) {
    String dateTimeStr = requestTime;
    DateTime parsedDate = DateTime.parse(dateTimeStr);
    DateTime istDate = parsedDate.add(const Duration(hours: 5, minutes: 30));
    String formattedDate =
        DateFormat('dd/MM/yyyy').format(istDate); // Only date

    return Container(
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black45,
            spreadRadius: -33,
            blurRadius: 19,
            offset: Offset(0, -12))
      ]),
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          color: Colors.white,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.orangeAccent,
              child: Text(
                name.isNotEmpty ? name[0] : '?',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            title: Text(
              name,
              style: const TextStyle(
                color: Color(0xFF4B5563),
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              // Aligns the text to the start
              children: [
                const Icon(
                  Icons.calendar_month,
                  size: 18,
                  color: Color(0xFFFF8242),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  formattedDate, // Display only date
                  style: const TextStyle(
                    color: Color(0xFF4B5563),
                    fontSize: 14, // Increased font size for date
                  ),
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  DateFormat('hh:mm a').format(istDate),
                  // Extract and format time
                  style: const TextStyle(
                    color: Color(0xFF4B5563),
                    fontSize: 14, // Increased font size for time
                  ),
                ),
              ],
            ),
            trailing: Text(
              '₹${amount.toStringAsFixed(2)}',
              // Display amount with two decimal places
              style: const TextStyle(
                color: Color(0xFFFB7329),
                fontWeight: FontWeight.bold,
                fontSize: 18, // Increased font size for the amount
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AddAmountForm extends StatefulWidget {
  const AddAmountForm({
    super.key,
    required this.controller,
    required this.id,
  });

  final String id;
  final BarrowPageController controller;

  @override
  State<AddAmountForm> createState() => _AddAmountFormState();
}

class _AddAmountFormState extends State<AddAmountForm> {
  var isLoading = false;
  var isAmount = TextEditingController();

  Future<void> submitUser(context) async {
    try {
      setState(() {
        isLoading = true;
      });
      Map<String, dynamic> data = {
        "group_id": widget.id,
        "requested_amount": isAmount.text.trim(),
        // "request_time": "2024-09-23T03:55:37.998Z"
      };
      print(data);

      await APIMethods.post
          .post(url: APIEndpoints.group.pooledRequests, map: data)
          .then((value) {
        if (APIStatus.success(value.statusCode)) {
          widget.controller.submitUser(context, widget.id);
          // clearDetails();
          // Get.find<AuthController>().setAuth(
          //   value.data["access_token"],
          //   value.data["refresh_token"],
          // );

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Added Successful!'),
              backgroundColor: Colors.green,
            ),
          );
        } else {
          // printError("Auth Controller", "Signup", value.data);
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
      setState(() {
        isLoading = false;
      });
    }
    // if (_formKey.currentState!.validate()) {
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Enter Amount', // Label above the TextField
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.normal,
              color: Color(0xFF354665)),
        ),
        const SizedBox(height: 10), // Space between the label and the TextField
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: isAmount,
                decoration: InputDecoration(
                    labelText: 'Enter Amount',
                    labelStyle: const TextStyle(color: Color(0xFF718BAE)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    isDense: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFA6BCDA)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFA6BCDA)),
                      borderRadius: BorderRadius.circular(10),
                    )),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(width: 10),
            isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ElevatedButton(
                    onPressed: () {
                      submitUser(context);
                    },
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(color: Colors.white),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                      backgroundColor: const Color(0xFFFF7528),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Add Amount',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
          ],
        ),
      ],
    );
  }
}
