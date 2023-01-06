// To parse this JSON data, do
//
//     final sentEmailResponse = sentEmailResponseFromJson(jsonString);

import 'dart:convert';

SentEmailResponse sentEmailResponseFromJson(String str) => SentEmailResponse.fromJson(json.decode(str));

String sentEmailResponseToJson(SentEmailResponse data) => json.encode(data.toJson());

class SentEmailResponse {
  SentEmailResponse({
    this.status,
    this.message,
  });

  int? status;
  String? message;

  factory SentEmailResponse.fromJson(Map<String, dynamic> json) => SentEmailResponse(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
