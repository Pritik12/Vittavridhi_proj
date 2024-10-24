import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../widgets/base_view.dart';
import '../../../api/api_endpoints.dart';
import '../../../api/services/base_methods.dart';
import '../../../api/utility/api_status.dart';
import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
        title: 'Notification',
        // appBar: AppBar(
        //   title: const Text('NotificationView'),
        //   centerTitle: true,
        // ),
        body: ShowNotifications(
          controller: controller,
        ));
  }
}

class ShowNotifications extends StatefulWidget {
  const ShowNotifications({super.key, required this.controller});

  // final String id;
  final NotificationController controller;

  @override
  State<ShowNotifications> createState() => _ShowNotificationsState();
}

class _ShowNotificationsState extends State<ShowNotifications> {
  var isLoading = false;

  // var isvalue = "";

  var data = [].obs;

  Future<void> submitUser(id, isValue) async {
    try {
      setState(() {
        isLoading = true;
      });
      var data = {
        "action": isValue,
      };

      // });
      // print(id);
      await APIMethods.post
          .post(
              url: "${APIEndpoints.baseURL}/notifications/$id/respond",
              map: data)
          .then((value) {
        if (APIStatus.success(value.statusCode)) {
          print(data);
          widget.controller.submitUser();
          Get.snackbar("Data", "Proceed", backgroundColor: Colors.green);
        } else {
          // printError("Auth Controller", "Signup", value.data);

          Get.snackbar("Data", "Not Proceed", backgroundColor: Colors.red);
        }
      });
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        isLoading = false;
      });
      // isLoading.value = false;
    }
    // if (_formKey.currentState!.validate()) {
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return widget.controller.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                children: [
                  // Text("data"),
                  ListView.builder(
                    itemCount: widget.controller.data.length,
                    // physics: NeverScrollableScrollPhysics(),
                    // scrollDirection: ,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final transaction = widget.controller.data[index];
                      return Card(
                        elevation: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Text(
                                "${transaction["message"]}",
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            ListTile(
                              title: transaction['data']["status"] == "pending"
                                  ? Expanded(
                                      child: Row(children: [
                                      isLoading
                                          ? const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            )
                                          : ElevatedButton(
                                              onPressed: () {
                                                submitUser(transaction["id"],
                                                    "accept");
                                              },
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.orange,
                                              ),
                                              child: const Text(
                                                "Accept",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                            ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      isLoading
                                          ? const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            )
                                          : ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.orange,
                                              ),
                                              onPressed: () {
                                                submitUser(transaction["id"],
                                                    "reject");
                                              },
                                              child: const Text(
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                                "Reject",
                                              ),
                                            )
                                    ]))
                                  : transaction['data']["status"] == "rejected"
                                      ? isLoading
                                          ? const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            )
                                          : ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.orange,
                                              ),
                                              onPressed: () {
                                                submitUser(transaction["id"],
                                                    "accept");
                                              },
                                              child: const Text(
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                                "Accept",
                                              ),
                                            )
                                      : transaction['data']["status"] ==
                                              "accepted"
                                          ? isLoading
                                              ? const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                )
                                              : ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.orange,
                                                  ),
                                                  onPressed: () {
                                                    submitUser(
                                                        transaction["id"],
                                                        "reject");
                                                  },
                                                  child: const Text(
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18),
                                                    "Reject",
                                                  ),
                                                )
                                          : const SizedBox(),
                              trailing: const Text(
                                "Request",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
    });
  }
}
