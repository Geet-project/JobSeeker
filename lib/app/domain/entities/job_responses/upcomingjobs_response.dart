// To parse this JSON data, do
//
//     final upcomingJobResponse = upcomingJobResponseFromJson(jsonString);

import 'dart:convert';

UpcomingJobResponse upcomingJobResponseFromJson(String str) => UpcomingJobResponse.fromJson(json.decode(str));

String upcomingJobResponseToJson(UpcomingJobResponse data) => json.encode(data.toJson());

class UpcomingJobResponse {
  UpcomingJobResponse({
    this.data,
    this.status,
  });

  List<Datum>? data;
  int? status;

  factory UpcomingJobResponse.fromJson(Map<String, dynamic> json) => UpcomingJobResponse(
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
    this.appliedJobId,
    this.jobRole,
    this.companyName,
    this.jobAddress,
    this.slot,
    this.star,
    this.totalRating,
    this.appliedDate,
    this.jobStatus,
    this.workingDays,
    this.is_present,
    this.total_hour,
    this.total_present,
    this.jobid,
    this.start_job_time
  });

  int? appliedJobId;
  String? jobRole;
  String? companyName;
  String? jobAddress;
  String? slot;
  int? star;
  int? totalRating;
  String? appliedDate;
  String? jobStatus;
  int? workingDays;
  int? is_present;
  int? total_hour;
  int? total_present;
  String? jobid;
  String? start_job_time;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    appliedJobId: json["applied_job_id"],
    jobRole: json["job_role"],
    companyName: json["company_name"],
    jobAddress: json["job_address"] == null ? null : json["job_address"],
    slot: json["slot"],
    star: json["star"],
    totalRating: json["total_rating"],
    appliedDate: json["applied_date"],
    jobStatus: json["job_status"],
    workingDays: json["working_days"],
    is_present: json["is_present"],
      total_hour: json["total_hour"],
      total_present: json["total_present"],
    jobid: json["jobid"],
    start_job_time: json["start_job_time"]
  );

  Map<String, dynamic> toJson() => {
    "applied_job_id": appliedJobId,
    "job_role": jobRole,
    "company_name": companyName,
    "job_address": jobAddress == null ? null : jobAddress,
    "slot": slot,
    "star": star,
    "total_rating": totalRating,
    "applied_date": appliedDate,
    "job_status": jobStatus,
    "working_days": workingDays,
    "is_present": is_present,
    "total_hour": total_hour,
    "total_present": total_present,
    "jobid":jobid,
    "start_job_time": start_job_time
  };
}
