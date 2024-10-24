import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import 'package:vittavridhi/widgets/base_view.dart';
import '../../../api/api_endpoints.dart';
import '../../../api/services/base_methods.dart';
import '../../../api/utility/api_status.dart';
import '../../../routes/app_pages.dart';
import '../../groupMember/controllers/group_member_controller.dart';
import '../controllers/all_members_controller.dart';

class AllMembersView extends GetView<AllMembersController> {
  const AllMembersView({super.key});

  @override
  Widget build(BuildContext context) {
    var id = Get.parameters["id"] ?? "";
    print(id);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Members",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFFFF8242),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.toNamed(Routes.GROUP_MEMBER);
            Get.find<GroupMemberController>().createGroup(id);
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
      // title: "Members",
      body: AppMembersCard(
        controller: controller,
        id: id,
      ),
    );
  }
}

class AppMembersCard extends StatefulWidget {
  const AppMembersCard({
    super.key,
    required this.controller,
    required this.id,
  });

  final AllMembersController controller;
  final String id;

  @override
  State<AppMembersCard> createState() => _AppMembersCardState();
}

class _AppMembersCardState extends State<AppMembersCard> {
  var groupData = [];
  var isLoading = false;

  Future<void> createGroup(id) async {
    try {
      // if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      await APIMethods.get
          .get(
        url: APIEndpoints.group.userGroup,
      )
          .then((value) {
        if (APIStatus.success(value.statusCode)) {
          setState(() {
            groupData = value.data;
          });

          // Get.snackbar(
          //   "Message",
          //   "Create Group Successful!",
          // );
          // ScaffoldMessenger.of(context).showSnackBar(
          //   const SnackBar(
          //     content: Text('Create Group Successful!'),
          //     backgroundColor: Colors.green,
          //   ),
          // );
        } else {
          print(value.data);
          // ScaffoldMessenger.of(context).showSnackBar(
          //   const SnackBar(
          //     content:
          //         Text('You must agree to the Terms & Privacy to sign up.'),
          //     backgroundColor: Colors.red,
          //   ),
          // );
        }
      });
      // }
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
  void initState() {
    // TODO: implement initState
    super.initState();
    createGroup(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    // Show message if there are no members

    // Display the list of members when available with card and elevation
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: groupData.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final member = groupData[index];
              return MemberCard(
                member: member,
                isMember: true,
                id: widget.id,
              );
            },
          );
  }
}

class MemberCard extends StatefulWidget {
  const MemberCard({
    super.key,
    required this.member,
    this.isMember = false,
    this.id = "",
  });

  final bool isMember;
  final Map<String, dynamic> member;
  final String id;

  @override
  State<MemberCard> createState() => _MemberCardState();
}

class _MemberCardState extends State<MemberCard> {
  var groupData = [];
  var isLoading = false;

  Future<void> createMember(id) async {
    try {
      // if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      var data = {
        "user_id": widget.member["id"],
        "permission": "user",
        "status": "..."
      };
      await APIMethods.post
          .post(
              url: "${APIEndpoints.createData.createGroup}/$id/members",
              map: data)
          .then((value) {
        if (APIStatus.success(value.statusCode)) {
          // setState(() {
          //   groupData = value.data;
          // });
          Get.find<GroupMemberController>().createGroup(id);
          Get.defaultDialog(middleText: value.data['detail']);
          // ScaffoldMessenger.of(context).showSnackBar(
          //   const SnackBar(
          //     content: Text('Create Group Successful!'),
          //     backgroundColor: Colors.green,
          //   ),
          // );
        } else {
          print(value.data);
          // ScaffoldMessenger.of(context).showSnackBar(
          //   const SnackBar(
          //     content:
          //         Text('You must agree to the Terms & Privacy to sign up.'),
          //     backgroundColor: Colors.red,
          //   ),
          // );
        }
      });
      // }
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        isLoading = false;
      });
    }
    // if (_formKey.currentState!.validate()) {
  }

  Future<void> deleteMember(id, memberId) async {
    try {
      // if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      // var data = {
      //   "user_id": widget.member["id"],
      //   "permission": "user",
      //   "status": ""
      // };
      await APIMethods.delete
          .delete(
        url: "${APIEndpoints.createData.createGroup}/$id/members/$memberId",
      )
          .then((value) {
        if (APIStatus.success(value.statusCode)) {
          Get.find<GroupMemberController>().createGroup(id);
          // setState(() {
          //   groupData = value.data;
          // });

          // Get.snackbar(
          //   "Message",
          //   "Add Member Successful!",
          // );
          // ScaffoldMessenger.of(context).showSnackBar(
          //   const SnackBar(
          //     content: Text('Create Group Successful!'),
          //     backgroundColor: Colors.green,
          //   ),
          // );
        } else {
          print(value.data);
          // ScaffoldMessenger.of(context).showSnackBar(
          //   const SnackBar(
          //     content:
          //         Text('You must agree to the Terms & Privacy to sign up.'),
          //     backgroundColor: Colors.red,
          //   ),
          // );
        }
      });
      // }
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
    return Container(
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black45,
            spreadRadius: -25,
            blurRadius: 15,
            offset: Offset(3, -8))
      ]),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Rounded corners
          side: BorderSide(
              color: Colors.grey.shade300, width: 1), // Border around the card
        ),
        margin: const EdgeInsets.symmetric(
            vertical: 8, horizontal: 16), // Margins around each card
        child: Container(
          color: Colors.white,
          child: ListTile(
            title: Row(
              children: [
                Text(
                  widget.isMember
                      ? widget.member["name"] ?? ''
                      : widget.member["user_name"] ?? '',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 20,
                ),
                widget.isMember
                    ? const SizedBox()
                    : widget.member["status"] == "active"
                        ? const SizedBox()
                        : Text(" Status ${widget.member["status"]}"),
              ],
            ),
            subtitle: Row(
              children: [
                const Icon(
                  Icons.call_outlined,
                  color: Color(0xFFFF8242),
                  size: 15,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(widget.isMember
                    ? widget.member["phone_number"] ?? ""
                    : widget.member["user_phone"] ?? ''),
              ],
            ),
            trailing: widget.member["permission"] == "admin"
                ? const SizedBox()
                : isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : RawMaterialButton(
                        onPressed: () {
                          widget.isMember
                              ? createMember(widget.id)
                              : deleteMember(
                                  widget.id, "${widget.member["user_id"]}");
                          // Add your desired action here, for example, adding the contact
                          print('Add ${widget.member["user_name"]} clicked');
                        },
                        elevation: 2.0,
                        fillColor: const Color(0xFFFFF0E5).withOpacity(0.9),
                        // padding: const EdgeInsets.all(15.0),
                        shape: const CircleBorder(),
                        // Custom color
                        child: Icon(
                          widget.isMember ? Icons.add : Icons.remove,
                          color: const Color(0xFFFF8242),
                        ),
                      ),
          ),
        ),
      ),
    );
  }
}
