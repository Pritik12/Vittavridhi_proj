import 'package:get/get.dart';
import 'package:vittavridhi/app/api/api_endpoints.dart';
import 'package:vittavridhi/app/api/services/base_methods.dart';
import 'package:vittavridhi/app/api/utility/api_status.dart';

class AllGroupsController extends GetxController {
  // Define the list of funds using Rx for reactivity
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    createGroup();
  }

  var isLoading = false.obs;
  Future<void> createGroup() async {
    try {
      // if (formKey.currentState!.validate()) {
      isLoading(true);

      await APIMethods.get
          .get(url: APIEndpoints.createData.createGroup)
          .then((value) {
        if (APIStatus.success(value.statusCode)) {
          groups(value.data);
          print(value.data);
        } else {
          print(value.data);
        }
      });
      // }
    } catch (e) {
      print(e);
    } finally {
      isLoading(false);
    }
  }

  var groups = [].obs;

}
