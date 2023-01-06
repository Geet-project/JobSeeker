// To parse this JSON data, do
//
//     final paymentViewResponse = paymentViewResponseFromJson(jsonString);

import 'dart:convert';

PaymentViewResponse paymentViewResponseFromJson(String str) => PaymentViewResponse.fromJson(json.decode(str));

String paymentViewResponseToJson(PaymentViewResponse data) => json.encode(data.toJson());

class PaymentViewResponse {
  PaymentViewResponse({
    this.data,
    this.status,
  });

  Data? data;
  int? status;

  factory PaymentViewResponse.fromJson(Map<String, dynamic> json) => PaymentViewResponse(
    data: Data.fromJson(json["data"]),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": data!.toJson(),
    "status": status,
  };
}

class Data {
  Data({
    this.totalEarning,
    this.totalPaid,
    this.remaing,
    this.data,
  });

  String? totalEarning;
  String? totalPaid;
  String? remaing;
  List<Datum>? data;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    totalEarning: json["total_earning"],
    totalPaid: json["total_paid"],
    remaing: json["remaing"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total_earning": totalEarning,
    "total_paid": totalPaid,
    "remaing": remaing,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.companyName,
    this.jobRole,
    this.jobArea,
    this.id,
    this.invoiceid,
    this.vendorId,
    this.userid,
    this.jobid,
    this.fromDate,
    this.toDate,
    this.hours,
    this.wages,
    this.total,
    this.type,
    this.commission,
    this.createdAt,
    this.updatedAt,
  });

  String? companyName;
  String? jobRole;
  String? jobArea;
  int? id;
  int? invoiceid;
  int? vendorId;
  int? userid;
  int? jobid;
  String? fromDate;
  String? toDate;
  String? hours;
  String? wages;
  String? total;
  String? type;
  String? commission;
  String? createdAt;
  String? updatedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    companyName: json["company_name"],
    jobRole: json["job_role"],
    jobArea: json["job_area"],
    id: json["id"],
    invoiceid: json["invoiceid"],
    vendorId: json["vendor_id"],
    userid: json["userid"],
    jobid: json["jobid"],
    fromDate: json["from_date"],
    toDate: json["to_date"],
    hours: json["hours"],
    wages: json["wages"],
    total: json["total"],
    type: json["type"],
    commission: json["commission"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "company_name": companyName,
    "job_role": jobRole,
    "job_area": jobArea,
    "id": id,
    "invoiceid": invoiceid,
    "vendor_id": vendorId,
    "userid": userid,
    "jobid": jobid,
    "from_date": fromDate,
    "to_date": toDate,
    "hours": hours,
    "wages": wages,
    "total": total,
    "type": type,
    "commission": commission,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
