import 'package:get/get.dart';

class AppValidator {
  static String? nonEmpty(String? value,
          {String? emptyMessage, String? invalidMessage}) =>
      _checkWithPattern(
          value: value,
          pattern: RegExp(r'^.{1,}$'),
          emptyMessage: emptyMessage ?? "Field cannot be empty",
          invalidMessage: invalidMessage ?? "Field cannot be empty");
  static String? nonEmptyField(String? value,
          {String? emptyMessage, String? invalidMessage}) =>
      (value?.isEmpty ?? true) ? emptyMessage ?? "Field cannot be empty" : null;
  static String? onlyNumberField(String? value,
          {String? emptyMessage, String? invalidMessage}) =>
      (value?.isEmpty ?? true)
          ? emptyMessage ?? "Field cannot be empty"
          : (value.toString().isNum)
              ? null
              : "Enter valid number";
  static String? nonEmptyNumber(String? value,
          {String? emptyMessage, String? invalidMessage}) =>
      _checkWithPattern(
          value: value,
          pattern: RegExp(r'^[0-9]*$'),
          emptyMessage: emptyMessage ?? "Field cannot be empty",
          invalidMessage: invalidMessage ?? "Please enter valid number");

  String? validateEmail(value) {
    if (value!.isEmpty) {
      return 'Please enter an email';
    }
    RegExp emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? validatePhoneNumber(value) {
    if (value!.isEmpty) {
      return 'Please enter a phone number';
    }
    if (value.length != 10) {
      return 'Please enter a 10-digit phone number';
    }
    return null;
  }

  static String? validatePincode(value) {
    if (value!.isEmpty) {
      return 'Please enter a pincode';
    }
    if (value.length != 6) {
      return 'Please enter a 6-digit pincode';
    }
    return null;
  }

  static String? validatePassword(value) {
    if (value!.isEmpty) {
      return 'Please enter a password';
    }

    return null;
  }

  static String? validateUsername(value) {
    if (value!.isEmpty) {
      return 'Please enter a username';
    }
    return null;
  }

  static String? phoneNumber(String? value,
          {String? emptyMessage, String? invalidMessage}) =>
      _checkWithPattern(
          value: value,
          pattern: RegExp(r'^\d{10}$'),
          emptyMessage: emptyMessage ?? "Field cannot be empty",
          invalidMessage:
              invalidMessage ?? "Please enter a valid 10-digit phone number");
  static String? email(String? value) => _checkWithPattern(
      value: value,
      pattern: RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'),
      emptyMessage: "Please enter email",
      invalidMessage: "Enter valid Email");

  static String? username(String? value) => _checkWithPattern(
      value: value,
      pattern: RegExp("[a-z]"),
      emptyMessage: "Please enter Username",
      invalidMessage: "Enter Only lowercase letters");

  static String? password(String? value) => _checkWithPattern(
      value: value,
      pattern: RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$'),
      emptyMessage: "Please enter password",
      invalidMessage: 'Min 8 char with Uppercase & Number');

  static String? validatePAN(String? value) {
    const pattern = r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$';
    final regExp = RegExp(pattern);

    if (!regExp.hasMatch(value!)) {
      return 'Enter a valid PAN number';
    }
    return null;
  }

  static String? validateAadhaar(String? value) {
    const pattern = r'^\d{12}$';
    final regExp = RegExp(pattern);

    if (!regExp.hasMatch(value!)) {
      return 'Enter a valid 12-digit Aadhaar number';
    }
    return null;
  }

  static String? otp(String? value) => _checkWithPattern(
      value: value,
      pattern: RegExp(r'^.{6,}$'),
      emptyMessage: "Please enter OTP",
      invalidMessage: 'Enter valid OTP');
  static String? gstNumber(String? value,
          {String? emptyMessage, String? invalidMessage}) =>
      _checkWithPattern(
          value: value,
          pattern: RegExp(r'^[0-9A-Za-z]{15}$'),
          emptyMessage: emptyMessage ?? "GST Number cannot be empty",
          invalidMessage: invalidMessage ?? "Please enter a valid GST Number");
  static String? referCode(String? value) {
    if (value?.isNotEmpty ?? false) {
      if ((value!.length == 8)) {
        return null;
      } else {
        return "Enter Valid Referral Code";
      }
    } else {
      return null;
    }
  }
}

_checkWithPattern(
        {required String? value,
        required RegExp pattern,
        required String emptyMessage,
        required String invalidMessage}) =>
    _check(
        value: value,
        condition: pattern.hasMatch(value ?? ""),
        emptyMessage: emptyMessage,
        invalidMessage: invalidMessage);

_check(
    {required String? value,
    required bool condition,
    required String emptyMessage,
    required String invalidMessage}) {
  if (value?.isEmpty ?? true) {
    return emptyMessage;
  } else {
    if (condition) {
      return null;
    } else {
      return invalidMessage;
    }
  }
}
