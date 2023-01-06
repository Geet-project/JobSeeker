// To parse this JSON data, do
//
//     final jobDetailResponse = jobDetailResponseFromJson(jsonString);

import 'dart:convert';

JobDetailResponse jobDetailResponseFromJson(String str) => JobDetailResponse.fromJson(json.decode(str));

String jobDetailResponseToJson(JobDetailResponse data) => json.encode(data.toJson());

class JobDetailResponse {
  JobDetailResponse({
    this.data,
    this.status,
  });

  JobData? data;
  int? status;

  factory JobDetailResponse.fromJson(Map<String, dynamic> json) => JobDetailResponse(
    data: JobData.fromJson(json["data"]),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
    "status": status,
  };
}

class JobData {
  JobData({
    this.vendor,
    this.jobRole,
    this.payableSalary,
    this.jobType,
    this.startJobTime,
    this.endJobTime,
    this.jobTiming,
    this.noOfOpening,
    this.jobAddress,
    this.email,
    this.phone,
    this.rating,
    this.is_applied,
    this.job_date,
    this.created_at
  });

  dynamic vendor;
  String? jobRole;
  String? payableSalary;
  String? jobType;
  String? startJobTime;
  String? endJobTime;
  dynamic jobTiming;
  String? noOfOpening;
  String? jobAddress;
  String? email;
  String? phone;
  Rating? rating;
  int? is_applied;
  String? job_date;
  String? created_at;

  factory JobData.fromJson(Map<String, dynamic> json) => JobData(
      vendor: json["vendor"],
      jobRole: json["job_role"],
      payableSalary: json["payable_salary"],
      jobType: json["job_type"],
      startJobTime: json["start_job_time"],
      endJobTime: json["end_job_time"],
      jobTiming: json["job_timing"],
      noOfOpening: json["no_of_opening"],
      jobAddress: json["job_address"],
      email: json["email"],
      phone: json["phone"],
      rating: Rating.fromJson(json["rating"]),
      is_applied: json['is_applied'],
    job_date: json['job_date'],
    created_at: json['created_at']
  );

  Map<String, dynamic> toJson() => {
    "vendor": vendor,
    "job_role": jobRole,
    "payable_salary": payableSalary,
    "job_type": jobType,
    "start_job_time": startJobTime,
    "end_job_time": endJobTime,
    "job_timing": jobTiming,
    "no_of_opening": noOfOpening,
    "job_address": jobAddress,
    "email": email,
    "phone": phone,
    "rating": rating!.toJson(),
    "is_applied": is_applied,
    "job_date": job_date,
    "created_at": created_at
  };
}

class Rating {
  Rating({
    this.totalRating,
    this.list,
  });

  String? totalRating;
  List<ListElement>? list;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    totalRating: json["total_rating"],
    list: List<ListElement>.from(json["list"].map((x) => ListElement.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total_rating": totalRating,
    "list": List<dynamic>.from(list!.map((x) => x.toJson())),
  };
}

class ListElement {
  ListElement({
    this.name,
    this.comment,
    this.rating,
    this.createdAt,
  });

  String? name;
  String? comment;
  double? rating;
  DateTime? createdAt;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    name: json["name"],
    comment: json["comment"],
    rating: json["rating"].toDouble(),
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "comment": comment,
    "rating": rating,
    "created_at": createdAt!.toIso8601String(),
  };
}
