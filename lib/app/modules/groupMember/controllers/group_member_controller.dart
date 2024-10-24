import 'package:get/get.dart';

import '../../../api/api_endpoints.dart';
import '../../../api/services/base_methods.dart';
import '../../../api/utility/api_status.dart';

class GroupMemberController extends GetxController {
  //TODO: Implement GroupMemberController

  var isLoading = false.obs;
  var groupData = {}.obs;
  Future<void> createGroup(id) async {
    try {
      // if (formKey.currentState!.validate()) {
      isLoading(true);

      await APIMethods.get
          .get(
        url: "${APIEndpoints.group.groupMember}/$id",
      )
          .then((value) {
        if (APIStatus.success(value.statusCode)) {
          groupData(value.data);
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
      isLoading(false);
    }
    // if (_formKey.currentState!.validate()) {
  }
}
