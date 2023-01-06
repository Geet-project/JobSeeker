// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

import 'login_data.dart';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.data,
    this.success,
    this.error
  });

  LoginData? data;
  int? success;
  String? error;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
    data: LoginData.fromJson(json["data"]),
    success: json["success"],
    error: json["error"]
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
    "success": success,
    "error": error
  };
}

