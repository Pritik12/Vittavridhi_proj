import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../../all_groups/views/all_groups_view.dart';
import '../../all_members/views/all_members_view.dart';
import '../controllers/group_member_controller.dart';

class GroupMemberView extends GetView<GroupMemberController> {
  const GroupMemberView({super.key});

  @override
  Widget build(BuildContext context) {
    var id = Get.parameters["id"] ?? "";
    controller.createGroup(id); // Fetch group members

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Groups",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFFF8242),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.toNamed(Routes.ALL_GROUPS);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Get.toNamed(Routes.NOTIFICATION);
            },
          ),
          const CircleAvatar(backgroundColor: Colors.white),
          const SizedBox(width: 10),
        ],
      ),
      body: MemberGroupCard(receivedData: controller, id: id),
    );
  }
}

class MemberGroupCard extends StatefulWidget {
  const MemberGroupCard({
    super.key,
    required this.receivedData,
    required this.id,
  });

  final String id;

  final GroupMemberController receivedData;

  @override
  State<MemberGroupCard> createState() => _MemberGroupCardState();
}

class _MemberGroupCardState extends State<MemberGroupCard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  var lisMemeber = [];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      Map<String, dynamic> data =
          Map<String, dynamic>.from(widget.receivedData.groupData);
      lisMemeber = data["members"] ?? [];
      return widget.receivedData.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  GroupCard(group: data),
                  Center(
                      child: ExpansionTile(
                    title: Row(
                      children: [
                        const Icon(
                          Icons.groups_outlined,
                          color: Color(0XFFFF8242),
                          size: 35,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text("Members"),
                        const Spacer(),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: const Color(0xFFFFF0E5).withOpacity(0.9),
                              borderRadius: BorderRadius.circular(40)),
                          child: IconButton(
                            icon: const Icon(
                              Icons.add,
                              color: Color(0XFFFF8242),
                              size: 25,
                            ),
                            onPressed: () {
                              Get.toNamed('/all-members?id=${widget.id}');
                              // createGroup(widget.id);
                            },
                          ),
                        ),
                      ],
                    ),
                    children: [
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: lisMemeber.length,
                        itemBuilder: (context, index) {
                          final member = lisMemeber[index];
                          return MemberCard(member: member, id: widget.id);
                        },
                      ),
                      // MemberCard(member: ,),
                    ],
                  )),
                ],
              ),
            );
    });
  }
}
