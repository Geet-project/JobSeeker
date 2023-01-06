// To parse this JSON data, do
//
//     final stateResponse = stateResponseFromJson(jsonString);

import 'dart:convert';

StateResponse stateResponseFromJson(String str) => StateResponse.fromJson(json.decode(str));

String stateResponseToJson(StateResponse data) => json.encode(data.toJson());

class StateResponse {
  StateResponse({
    this.data,
    this.status,
  });

  List<Datum>? data;
  int? status;

  factory StateResponse.fromJson(Map<String, dynamic> json) => StateResponse(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "status": status,
  };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int? id;
  String? name;
  String? status;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic deletedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    status: json["status"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "status": status,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "deleted_at": deletedAt,
  };
}
