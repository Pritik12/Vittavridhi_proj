class LoginModel {
  LoginModel({
      this.password, 
      this.username,});

  LoginModel.fromJson(dynamic json) {
    password = json['password'];
    username = json['username'];
  }
  String? password;
  String? username;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['password'] = password;
    map['username'] = username;
    return map;
  }

}