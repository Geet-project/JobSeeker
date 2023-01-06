import 'dart:developer';

import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';
import 'package:jobprovider/app/core/resources/assets_manager.dart';
import 'package:jobprovider/app/domain/entities/notification_response/notification_response.dart';

import '../../../core/utils/shared_preference.dart';
import '../../../domain/repository/inotification_repository.dart';

class NotificationController extends GetxController{
  final INotificationRepository notificationRepo = Get.find();
  var isDataLoading = false.obs;
  final notiList = <NotificationData>[].obs;

  @override
  void onInit() {
    super.onInit();
    getNotificationList();
  }

  getNotificationList() async {
    try {
      isDataLoading.value = true;
      var token =  await User_Perference().getUserAccessToken();
      NotificationResponse notiData = (await notificationRepo.getNotification("Bearer "+token)).data!;
      if (notiData!=null) {
        isDataLoading.value = false;
        notiList.value = notiData!.data!;
        update();
      } else {
        isDataLoading.value = false;

      }
    } catch (e) {
      log("e $e");
    }
  }

  String dateFormat(String date){
    DateTime parseDate = new DateFormat("yyyy-MM-dd HH:mm:ss").parse(date);
    var inputDate = DateTime.parse(parseDate.toString());
    var outputFormat = DateFormat('dd MMM, yyyy');
    var outputDate = outputFormat.format(inputDate);
    return outputDate;
  }



}