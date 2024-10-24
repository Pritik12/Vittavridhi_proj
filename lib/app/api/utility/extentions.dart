

import 'package:flutter/material.dart';

extension TimeOfDayConverter on TimeOfDay {
  String to24hours() {
    final hour = this.hour.toString().padLeft(2, "0");
    final min = minute.toString().padLeft(2, "0");
    return "$hour:$min";
  }
}

extension ToIntOrZero on String{
  int toIntOrZero(){
    return isNotEmpty?int.parse(toString()):0;
  }
}

extension ToIntOrNull on String{
  int? toIntOrNull(){
    return isNotEmpty?int.parse(toString()):null;
  }
}