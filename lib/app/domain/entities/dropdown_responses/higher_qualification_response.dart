// To parse this JSON data, do
//
//     final higherQualificationResponse = higherQualificationResponseFromJson(jsonString);

import 'dart:convert';

HigherQualificationResponse higherQualificationResponseFromJson(String str) => HigherQualificationResponse.fromJson(json.decode(str));

String higherQualificationResponseToJson(HigherQualificationResponse data) => json.encode(data.toJson());

class HigherQualificationResponse {
  HigherQualificationResponse({
    this.data,
    this.status,
  });

  List<HigherQualificationDatum>? data;
  int? status;

  factory HigherQualificationResponse.fromJson(Map<String, dynamic> json) => HigherQualificationResponse(
    data: List<HigherQualificationDatum>.from(json["data"].map((x) => HigherQualificationDatum.fromJson(x))),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "status": status,
  };
}

class HigherQualificationDatum {
  HigherQualificationDatum({
    this.id,
    this.type,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? type;
  String? name;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory HigherQualificationDatum.fromJson(Map<String, dynamic> json) => HigherQualificationDatum(
    id: json["id"],
    type: json["type"],
    name: json["name"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "name": name,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}
