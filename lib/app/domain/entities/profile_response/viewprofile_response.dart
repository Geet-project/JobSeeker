// To parse this JSON data, do
//
//     final viewProfileResponse = viewProfileResponseFromJson(jsonString);

import 'dart:convert';

ViewProfileResponse viewProfileResponseFromJson(String str) => ViewProfileResponse.fromJson(json.decode(str));

String viewProfileResponseToJson(ViewProfileResponse data) => json.encode(data.toJson());

class ViewProfileResponse {
  ViewProfileResponse({
    this.data,
    this.status,
  });

  ProfileData? data;
  int? status;

  factory ViewProfileResponse.fromJson(Map<String, dynamic> json) => ViewProfileResponse(
    data: ProfileData.fromJson(json["data"]),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
    "status": status,
  };
}

class ProfileData {
  ProfileData({
    this.id,
    this.name,
    this.email,
    this.city,
    this.state,
    this.pincode,
    this.address,
    this.phone,
    this.age,
    this.higherQft,
    this.skills,
    this.photo,
    this.aboutus,
    this.dob

  });

  int? id;
  String? name;
  String? email;
  String? city;
  String? state;
  String? pincode;
  String? address;
  String? phone;
  String? age;
  String? higherQft;
  List<String>? skills;
  String? photo;
  String? aboutus;
  String? dob;

  factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    city: json["city"],
    state: json["state"],
    pincode: json["pincode"],
    address: json["address"],
    phone: json["phone"],
    age: json["age"],
    higherQft: json["higherQft"],
    skills: List<String>.from(json["skills"].map((x) => x)),
    photo: json["photo"],
    aboutus: json["aboutus"],
    dob: json["dob"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "city": city,
    "state": state,
    "pincode": pincode,
    "address": address,
    "phone": phone,
    "age": age,
    "higherQft": higherQft,
    "skills": skills,
    "photo": photo,
    "aboutus": aboutus,
    "skills": List<dynamic>.from(skills!.map((x) => x)),
    "dob": dob

  };
}
