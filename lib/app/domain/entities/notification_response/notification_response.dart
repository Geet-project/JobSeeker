// To parse this JSON data, do
//
//     final notificationResponse = notificationResponseFromJson(jsonString);

import 'dart:convert';

NotificationResponse notificationResponseFromJson(String str) => NotificationResponse.fromJson(json.decode(str));

String notificationResponseToJson(NotificationResponse data) => json.encode(data.toJson());

class NotificationResponse {
  NotificationResponse({
    this.data,
    this.status,
  });

  List<NotificationData>? data;
  int? status;

  factory NotificationResponse.fromJson(Map<String, dynamic> json) => NotificationResponse(
    data: List<NotificationData>.from(json["data"].map((x) => NotificationData.fromJson(x))),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "status": status,
  };
}

class NotificationData {
  NotificationData({
    this.id,
    this.title,
    this.description,
    this.is_read,
    this.createdAt,

  });

  int? id;
  String? title;
  String? description;
  int? is_read;
  DateTime? createdAt;

  factory NotificationData.fromJson(Map<String, dynamic> json) => NotificationData(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    is_read: json["is_read"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "is_read": is_read,
    "created_at": createdAt!.toIso8601String(),
  };
}
