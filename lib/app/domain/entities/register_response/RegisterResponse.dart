// To parse this JSON data, do
//
//     final registerResponse = registerResponseFromJson(jsonString);

import 'dart:convert';

RegisterResponse registerResponseFromJson(String str) => RegisterResponse.fromJson(json.decode(str));

String registerResponseToJson(RegisterResponse data) => json.encode(data.toJson());

class RegisterResponse {
  RegisterResponse({
    this.data,
    this.status,
    this.message,
  });

  Data? data;
  int? status;
  String? message;

  factory RegisterResponse.fromJson(Map<String, dynamic> json) => RegisterResponse(
    data: Data.fromJson(json["data"]),
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
    "status": status,
    "message": message,
  };
}

class Data {
  Data({
    this.email,
    this.id,
    this.token,
  });

  String? email;
  int? id;
  String? token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    email: json["email"],
    id: json["id"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "id": id,
    "token": token,
  };
}
