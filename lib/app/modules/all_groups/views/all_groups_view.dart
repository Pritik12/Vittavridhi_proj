import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vittavridhi/widgets/base_view.dart';
import '../../barrow_page/controllers/barrow_page_controller.dart';
import '../../groupMember/controllers/group_member_controller.dart';
import '../controllers/all_groups_controller.dart';

class AllGroupsView extends GetView<AllGroupsController> {
  const AllGroupsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      title: "Groups",
      body: Column(
        children: [
          Obx(() {
            if (controller.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            } else if (controller.groups.isEmpty) {
              return const Center(
                child: Text(
                  'No groups available',
                  style: TextStyle(fontSize: 20),
                ),
              );
            }

            return Container(
              padding: const EdgeInsets.only(top: 20),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(10.0),
                itemCount: controller.groups.length,
                itemBuilder: (context, index) {
                  final group = controller.groups[index];
                  return GestureDetector(
                      onTap: () {
                        Get.toNamed("/group-member?id=${group["id"]}");
                        Get.find<GroupMemberController>()
                            .createGroup(group["id"]);
                      },
                      child: GroupCard(group: group));
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}

class GroupCard extends StatelessWidget {
  final Map<String, dynamic> group;

  const GroupCard({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    // Format date for better display (only date, no time)
    // final String formattedDate = DateFormat('yMMMd').format(group['startDate']);

    return Container(
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black45,
            spreadRadius: -20,
            blurRadius: 10,
            offset: Offset(15, -15))
      ]),
      child: Card(
        color: Colors.white,
        margin: const EdgeInsets.only(bottom: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    group['group_name'] ?? "",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.black87,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        Get.toNamed("/barrow-page?id=${group["id"]}",
                            arguments: group);
                        Get.find<BarrowPageController>()
                            .submitUser(context, group["id"]);
                      },
                      icon: const Icon(Icons.add))
                  // Icon(Icons.plus);
                ],
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
                                color: const Color(0xFFFFF0E5).withOpacity(0.9),
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
                            Text('${group['number_of_members'] ?? ''} Members'),
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
                                'Duration: ${group['group_duration'] ?? ''} Months'),
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
                                    'Total Amount: ₹${group['total_group_amount'] ?? ""}')),
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
                                  'Per Person: ₹${group['per_person_amount'] ?? ''}'),
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
                                  'Start Time: ${group['start_time'] ?? ""}')),
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
                                  'Start Date: ${group['investment_date'] ?? ""}')),
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
}
