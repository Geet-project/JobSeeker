import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:jobprovider/app/domain/entities/job_responses/upcomingjobs_response.dart';
import 'package:jobprovider/app/domain/repository/iattendance_repository.dart';

import '../../../core/utils/app_utils.dart';
import '../../../core/utils/shared_preference.dart';
import '../../../core/widgets/build_dialog_indicator.dart';
import '../../../domain/entities/sentemail_response/sentemail_response.dart';
import '../../../domain/repository/ichangepassword_repository.dart';
import '../../../routes/app_pages.dart';

class AttendanceController extends GetxController {
  final jobitem = Rxn<Datum>();
  final IAttendanceRepository attendanceRepository = Get.find();
  late StreamSubscription<Position> streamSubscription;
  var latitude = 'Getting Latitude..'.obs;
  final isJobtimeStart = false.obs;
  var longitude = 'Getting Longitude..'.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    jobitem.value = Get.arguments;
    checkJobTimeStart();
  }

  void checkJobTimeStart() {
    String midnightTime = "23:59";
    DateTime now = DateTime.now();
    String currentTimeFormat = DateFormat('HH:mm').format(now);
    DateTime jobTime = new DateFormat("HH:mm").parse(jobitem.value!.start_job_time!);
    DateTime currentTime = new DateFormat("HH:mm").parse(currentTimeFormat);
    DateTime midnightTimeDt = new DateFormat("HH:mm").parse(midnightTime);
    bool isAfter = currentTime.isAfter(jobTime);
    bool isBefore = currentTime.isBefore(midnightTimeDt);
    if(isAfter && isBefore){
      isJobtimeStart.value = true;
    }
  }



  markAttendance(int jobid, int isPresent,BuildContext context, String lat, String long) async {
    try {
      var token =  await User_Perference().getUserAccessToken();
      buildDialogLoadingIndicator();
      final response = (await attendanceRepository.markAttendance("Bearer "+token, jobid, isPresent, lat, long)).data!;
      if (response!=null) {
        Get.back(closeOverlays: true);
        if(response.status==200) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Attendance Marked")
          ));
        }else if(response.status!=200){
          showToastMessage(title: " Error", message: response.message!);
        }
      } else {
        Get.back(closeOverlays: true);
        showToastMessage(title: "Login Error", message: "something went wrong");

      }
    } catch (e) {
      log("e $e");
      Get.back(closeOverlays: true);
      showToastMessage(title: "Login Error", message: e.toString());

    }
  }

  getLocation(int jobid, int isPresent,BuildContext context) async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      showToastMessage(title: "GPS Error", message: "Location service are disabled");
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        showToastMessage(title: "GPS Error", message: "Location service are denied");

        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      showToastMessage(title: "GPS Error", message: "Location permissions are permanently denied, we cannot request permissions.");
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    latitude.value  = position.latitude.toString();
    longitude.value = position.longitude.toString();
    print(position.latitude);
    print(position.longitude);
    markAttendance(jobid, isPresent, context, latitude.value, longitude.value);
    // streamSubscription =
    //     Geolocator.getPositionStream().listen((Position position) {
    //       latitude.value = 'Latitude : ${position.latitude}';
    //       longitude.value = 'Longitude : ${position.longitude}';
    //     });

  }

}