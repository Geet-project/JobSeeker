import 'dart:developer';

import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:jobprovider/app/core/resources/assets_manager.dart';
import 'package:jobprovider/app/core/resources/color_manager.dart';
import 'package:jobprovider/app/core/utils/app_utils.dart';
import 'package:jobprovider/app/domain/entities/home_response/HomeResponse.dart';
import 'package:jobprovider/app/domain/entities/job_responses/JobResponses.dart';
import 'package:jobprovider/app/domain/entities/job_responses/upcomingjobs_response.dart';
import 'package:jobprovider/app/domain/repository/ihome_repository.dart';
import 'package:jobprovider/app/domain/repository/ijob_repository.dart';

import '../../../core/utils/shared_preference.dart';
import '../../../core/widgets/build_dialog_indicator.dart';
import '../../../routes/app_pages.dart';


class JobController extends GetxController {
  final IJobDetailRepository jobDetailRepository = Get.find();
  var isDataLoading = false.obs;
  JobData? jobData;

  @override
  void onInit() {
    super.onInit();
    getJobDetail(Get.arguments);
  }

  Size displaySize(BuildContext context) {
    debugPrint('Size = ' + MediaQuery.of(context).size.toString());
    return MediaQuery.of(context).size;
  }
  double displayWidth(BuildContext context) {
    debugPrint('Width = ' + displaySize(context).width.toString());
    return displaySize(context).width;
  }

  double displayHeight(BuildContext context) {
    debugPrint('Width = ' + displaySize(context).height.toString());
    return displaySize(context).height;
  }


  getJobDetail(String jobid) async {
    try {
      isDataLoading.value = true;
      var token =  await User_Perference().getUserAccessToken();
      jobData = (await jobDetailRepository.getJobDetail("Bearer "+token, jobid)).data?.data;
      if (jobData!=null) {
        isDataLoading.value = false;
        update();
      } else {
        isDataLoading.value = false;
      }
    } catch (e) {
      log("e $e");
    }
  }

  applyJob(String jobid, BuildContext context) async {
    try {
      buildDialogLoadingIndicator();
      var token =  await User_Perference().getUserAccessToken();
      final result = (await jobDetailRepository.applyJob("Bearer "+token, jobid)).data;
      Get.back();
      if(result==null) {
        showToastMessage(title: "Error", message: result!.message as String);
      }else {
        if(result!.status==200) {
          CoolAlert.show (
            context: context,
            type: CoolAlertType.success,
            text: 'Job Applied successfully!',
            backgroundColor: ColorManager.blueColor,
            onConfirmBtnTap: () {
              Get.offAllNamed(Routes.HOME);
            }
          );
        }else if(result!.status!=200) {
          showToastMessage(title: "Error", message: result!.message as String);
        }
      }
    } catch (e) {
      log("e $e");
      Get.back();
    }
  }



}