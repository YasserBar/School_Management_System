import 'dart:convert';

ModelLogin modelLoginFromJson(String str) =>
    ModelLogin.fromJson(json.decode(str));

String modelLoginToJson(ModelLogin data) => json.encode(data.toJson());

class ModelLogin {
  ModelLogin({
    required this.fullName,
    required this.password,
  });

  String fullName;
  String password;

  factory ModelLogin.fromJson(Map<String, dynamic> json) => ModelLogin(
        fullName: json["full_name"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() =>
      {"full_name": fullName, "password": password};
}
