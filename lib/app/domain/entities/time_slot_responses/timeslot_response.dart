// To parse this JSON data, do
//
//     final timeSlotResponse = timeSlotResponseFromJson(jsonString);

import 'dart:convert';

TimeSlotResponse timeSlotResponseFromJson(String str) => TimeSlotResponse.fromJson(json.decode(str));

String timeSlotResponseToJson(TimeSlotResponse data) => json.encode(data.toJson());

class TimeSlotResponse {
  TimeSlotResponse({
    this.data,
    this.status,
  });

  List<TimeSlotResponseDatum>? data;
  int? status;

  factory TimeSlotResponse.fromJson(Map<String, dynamic> json) => TimeSlotResponse(
    data: List<TimeSlotResponseDatum>.from(json["data"].map((x) => TimeSlotResponseDatum.fromJson(x))),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "status": status,
  };
}

class TimeSlotResponseDatum {
  TimeSlotResponseDatum({
    this.id,
    this.name,
    this.fromTime,
    this.toTime,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? fromTime;
  String? toTime;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory TimeSlotResponseDatum.fromJson(Map<String, dynamic> json) => TimeSlotResponseDatum(
    id: json["id"],
    name: json["name"],
    fromTime: json["from_time"],
    toTime: json["to_time"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "from_time": fromTime,
    "to_time": toTime,
    "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}
