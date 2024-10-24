import 'package:get/get.dart';

import 'package:dio/dio.dart' as dio;
import '/app/api/services/base_methods.dart';
import '/app/api/utility/api_status.dart';
import '/app/api/utility/debug_print.dart';

class ApiServices {
  // static var job = _Job();
  // static var student = _Student();
  // static var data = _Data();
  static var file = _File();
}

class _File {
  download(
      {String? url,
      Function(dio.Response? response)? onSuccess,
      Function(dio.Response? response)? onError}) async {
    await APIMethods.get
        .download(url: url ?? "", responseType: dio.ResponseType.bytes)
        .then((value) async {
      if (APIStatus.success(value.statusCode)) {
        if (onSuccess != null) await onSuccess(value);
      } else {
        printError("ERROR: ${Get.currentRoute}", "get student skill by id",
            value.data);
        if (onError != null) await onError(value);
      }
    });
  }
}
