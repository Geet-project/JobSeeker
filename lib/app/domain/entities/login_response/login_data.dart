class LoginData {
  LoginData({
    this.id,
    this.name,
    this.email,
    this.city,
    this.state,
    this.pincode,
    this.address,
    this.phone,
    this.age,
    this.gendar,
    this.dob,
    this.satutsincountry,
    this.industry,
    this.aboutus,
    this.jobType,
    this.drivingNo,
    this.sinNo,
    this.passportNo,
    this.passportFront,
    this.passportBack,
    this.canadaVisa,
    this.resume,
    this.higherQft,
    this.course,
    this.coursetype,
    this.specialisation,
    this.university,
    this.passoutyear,
    this.language,
    this.workStu,
    this.wFrom,
    this.present,
    this.startDate,
    this.endDate,
    this.employee,
    this.skills,
    this.photo,
    this.dlNo,
    this.dlFile,
    this.sinFile,
    this.visaNo,
    this.visaFile,
    this.sinno,
    this.passportFrontFile,
    this.passportBackFile,
    this.experinceLetter,
    this.emailVerifiedAt,
    this.otp,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.token,
    this.isRegiserPending,
    this.appointments,
    this.appoinment_date,
    this.appoinment_time,
    this.email_verified_at
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
  String? gendar;
  String? dob;
  String? satutsincountry;
  String? industry;
  String? aboutus;
  String? jobType;
  String? drivingNo;
  String? sinNo;
  String? passportNo;
  String? passportFront;
  String? passportBack;
  String? canadaVisa;
  String? resume;
  String? higherQft;
  String? course;
  String? coursetype;
  String? specialisation;
  String? university;
  String? passoutyear;
  String? language;
  String? workStu;
  String? wFrom;
  String? present;
  String? startDate;
  String? endDate;
  String? employee;
  List<String>? skills;
  String? photo;
  String? dlNo;
  String? dlFile;
  String? sinFile;
  String? visaNo;
  String? visaFile;
  String? sinno;
  String? passportFrontFile;
  String? passportBackFile;
  String? experinceLetter;
  String? emailVerifiedAt;
  String? otp;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? token;
  int? isRegiserPending;
  int? appointments;
  String? appoinment_date;
  String? appoinment_time;
  String? email_verified_at;

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    city: json["city"],
    state: json["state"],
    pincode: json["pincode"],
    address: json["address"],
    phone: json["phone"],
    age: json["age"],
    gendar: json["gendar"],
    dob: json["dob"],
    satutsincountry: json["satutsincountry"],
    industry: json["industry"],
    aboutus: json["aboutus"],
    jobType: json["job_type"],
    drivingNo: json["driving_no"],
    sinNo: json["sin_no"],
    passportNo: json["passport_no"],
    passportFront: json["passport_front"],
    passportBack: json["passport_back"],
    canadaVisa: json["canada_visa"],
    resume: json["resume"],
    higherQft: json["higherQft"],
    course: json["course"],
    coursetype: json["coursetype"],
    specialisation: json["specialisation"],
    university: json["university"],
    passoutyear: json["passoutyear"],
    language: json["language"],
    workStu: json["work_stu"],
    wFrom: json["w_from"],
    present: json["present"],
    startDate: json["start_date"],
    endDate: json["end_date"],
    employee: json["employee"],
    skills: List<String>.from(json["skills"].map((x) => x)),
    photo: json["photo"],
    dlNo: json["dl_no"],
    dlFile: json["dl_file"],
    sinFile: json["sin_file"],
    visaNo: json["visa_no"],
    visaFile: json["visa_file"],
    sinno: json["sinno"],
    passportFrontFile: json["passport_front_file"],
    passportBackFile: json["passport_back_file"],
    experinceLetter: json["experince_letter"],
    emailVerifiedAt: json["email_verified_at"],
    otp: json["otp"],
    status: json["status"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    token: json["token"],
    isRegiserPending: json["is_regiser_pending"],
    appointments: json["appointments"],
    appoinment_date: json["appoinment_date"],
    appoinment_time: json["appoinment_time"],
      email_verified_at: json["email_verified_at"]
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
    "gendar": gendar,
    "dob": dob,
    "satutsincountry": satutsincountry,
    "industry": industry,
    "aboutus": aboutus,
    "job_type": jobType,
    "driving_no": drivingNo,
    "sin_no": sinNo,
    "passport_no": passportNo,
    "passport_front": passportFront,
    "passport_back": passportBack,
    "canada_visa": canadaVisa,
    "resume": resume,
    "higherQft": higherQft,
    "course": course,
    "coursetype": coursetype,
    "specialisation": specialisation,
    "university": university,
    "passoutyear": passoutyear,
    "language": language,
    "work_stu": workStu,
    "w_from": wFrom,
    "present": present,
    "start_date": startDate,
    "end_date": endDate,
    "employee": employee,
    "skills": List<dynamic>.from(skills!.map((x) => x)),
    "photo": photo,
    "dl_no": dlNo,
    "dl_file": dlFile,
    "sin_file": sinFile,
    "visa_no": visaNo,
    "visa_file": visaFile,
    "sinno": sinno,
    "passport_front_file": passportFrontFile,
    "passport_back_file": passportBackFile,
    "experince_letter": experinceLetter,
    "email_verified_at": emailVerifiedAt,
    "otp": otp,
    "status": status,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "token": token,
    "is_regiser_pending": isRegiserPending,
    "appointments": appointments,
    "appoinment_date": appoinment_date,
    "appoinment_time": appoinment_time,
    "email_verified_at": email_verified_at,
  };
}
