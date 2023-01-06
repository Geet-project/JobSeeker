// To parse this JSON data, do
//
//     final homeResponse = homeResponseFromJson(jsonString);

import 'dart:convert';

HomeResponse homeResponseFromJson(String str) => HomeResponse.fromJson(json.decode(str));

String homeResponseToJson(HomeResponse data) => json.encode(data.toJson());

class HomeResponse {
  HomeResponse({
    this.data,
    this.status,
  });

  HomeData? data;
  int? status;

  factory HomeResponse.fromJson(Map<String, dynamic> json) => HomeResponse(
    data: HomeData.fromJson(json["data"]),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
    "status": status,
  };
}

class HomeData {
  HomeData({
    this.banner,
    this.job,
  });

  List<Banner>? banner;
  List<Job>? job;

  factory HomeData.fromJson(Map<String, dynamic> json) => HomeData(
    banner: List<Banner>.from(json["banner"].map((x) => Banner.fromJson(x))),
    job: List<Job>.from(json["job"].map((x) => Job.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "banner": List<dynamic>.from(banner!.map((x) => x.toJson())),
    "job": List<dynamic>.from(job!.map((x) => x.toJson())),
  };
}

class Banner {
  Banner({
    this.id,
    this.title,
    this.image,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? title;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
    id: json["id"],
    title: json["title"],
    image: json["image"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "image": image,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}

class Job {
  Job({
    this.id,
    this.jobRole,
    this.jobArea,
    this.payableSalary,
    this.noOfOpening,
    this.jobType,
    this.companyName,
  });

  int? id;
  String? jobRole;
  String? jobArea;
  String? payableSalary;
  String? noOfOpening;
  String? jobType;
  String? companyName;

  factory Job.fromJson(Map<String, dynamic> json) => Job(
    id: json["id"],
    jobRole: json["job_role"],
    jobArea: json["job_area"],
    payableSalary: json["payable_salary"],
    noOfOpening: json["no_of_opening"],
    jobType: json["job_type"] == null ? null : json["job_type"],
    companyName: json["company_name"] == null ? null : json["company_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "job_role": jobRole,
    "job_area": jobArea,
    "payable_salary": payableSalary,
    "no_of_opening": noOfOpening,
    "job_type": jobType == null ? null : jobType,
    "company_name": companyName == null ? null : companyName,
  };
}
