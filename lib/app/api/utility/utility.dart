import 'package:dio/dio.dart';


class Utility {
  const Utility();

  static String? getExperience(String? min, String? max, String? perDuration) {
    if (max != null) {
      return perDuration != null
          ? "${min ?? "0"} - $max"
          : "${min ?? "0"} - $max /$perDuration";
    } else {
      return perDuration != null ? min ?? "0" : "${max ?? "0"} /$perDuration";
    }
  }

  static String printErrorMessage(Response data) {
    if (data.data == null) {
      return "Something went wrong please try again";
    } else {
      Map<String, dynamic> res;
      res = data.data;
      print(res);
      print(res.length);
      if (res.isNotEmpty) {
        return "${res.keys.first} ${res.values.first}";
      } else {
        return "Something went wrong please try again";
      }
    }
  }
}
