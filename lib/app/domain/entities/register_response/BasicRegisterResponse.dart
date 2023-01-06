// To parse this JSON data, do
//
//     final basicRegisterResponse = basicRegisterResponseFromJson(jsonString);

import 'dart:convert';

BasicRegisterResponse basicRegisterResponseFromJson(String str) => BasicRegisterResponse.fromJson(json.decode(str));

String basicRegisterResponseToJson(BasicRegisterResponse data) => json.encode(data.toJson());

class BasicRegisterResponse {
  BasicRegisterResponse({
    this.status,
    this.message,
  });

  int? status;
  String? message;

  factory BasicRegisterResponse.fromJson(Map<String, dynamic> json) => BasicRegisterResponse(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
