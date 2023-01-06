import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:jobprovider/app/core/utils/app_utils.dart';
import 'package:jobprovider/app/core/utils/shared_preference.dart';
import 'package:jobprovider/app/core/widgets/build_dialog_indicator.dart';
import 'package:jobprovider/app/data/repository/login_repository_impl.dart';
import 'package:jobprovider/app/domain/entities/login_response/login_response.dart';
import 'package:jobprovider/app/domain/repository/ilogin_repository.dart';
import 'package:jobprovider/app/routes/app_pages.dart';

import '../../../core/resources/color_manager.dart';
import 'package:flutter/cupertino.dart';


class LoginController extends GetxController {

  var passwordVisible = true.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _status = Rx<RxStatus>(RxStatus.empty());
  RxStatus get status => _status.value;
  final GlobalKey<FormState>loginFromKey = GlobalKey<FormState>();
  final ILoginRepository loginRepository = Get.find<ILoginRepository>();
  final loginResponse = <LoginResponse>[].obs;
  String deviceTokenToSendPushNotification = "";
  final skillsList = <String>[].obs;
  final selectedSkillsMap = <String, dynamic>{}.obs;



  @override
  void onInit() {
    getDeviceTokenToSendNotification();
    super.onInit();
  }



  Size displaySize(BuildContext context) {
    debugPrint('Size = ' + MediaQuery.of(context).size.toString());
    return MediaQuery.of(context).size;
  }
  double displayWidth(BuildContext context) {
    debugPrint('Width = ' + displaySize(context).width.toString());
    return displaySize(context).width;
  }

  OutlineInputBorder getBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(30.0)),
      borderSide: BorderSide(width: 2, color: ColorManager.grey1),
    );
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "*Please Provide valid Email";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 5) {
      return "*Password must be of 6 characters";
    }
    return null;
  }

  void checkLogin()  async {
    final isValid = loginFromKey.currentState!.validate();
    if (!isValid) {
      return;
    }else {
      loginFromKey.currentState!.save();
      buildDialogLoadingIndicator();
      try {
        final result = await loginRepository.userLogin(emailController.text, passwordController.text, deviceTokenToSendPushNotification);
        Get.back(closeOverlays: true);
        if(result.error==null) {
          if(result.data?.success==200) {
            showToastMessage(title: "Success", message: "Login Success");
            if(result.data?.data?.email_verified_at!=null){
              if(result.data?.data?.isRegiserPending==0) {
                Get.offAllNamed(Routes.REGISTER2, arguments: result.data?.data?.token );
              }else if(result.data?.data?.appointments==0) {
                Get.offAllNamed(Routes.APPOINTMENT, arguments: result.data?.data?.token);
              } else if(result.data?.data?.status!.compareTo("pending")==0) {
                Get.offAllNamed(Routes.WAIT_KYC, arguments: [
                  result.data!.data!.name,
                  result.data!.data!.appoinment_date==null? "": result.data!.data!.appoinment_date,
                  result.data!.data!.appoinment_time==null? "": result.data!.data!.appoinment_time,
                ]);
              }
              else {
                User_Perference().saveUserInfo(result.data?.data, true);
                skillsList.value = result.data!.data!.skills!;
                for (var i = 0; i < skillsList.value.length; i++) {
                  selectedSkillsMap[skillsList[i]] = true;
                }
                User_Perference().saveSelectedSkills(selectedSkillsMap);
                Get.offAllNamed(Routes.HOME, arguments: "login");
              }
            }else {
              showToastMessage(title: "Login Error", message: "Your Email is not Verified Yet.");
            }

          }
        } else {
          showToastMessage(title: "Login Error", message: result.error!.response!.data['error']!);
        }
      } catch (error) {
        Get.back(closeOverlays: true);
        print(error);
        showToastMessage(title: "Login Error", message: error.toString());
      }
    }
  }

  Future<void> getDeviceTokenToSendNotification() async {
    final FirebaseMessaging _fcm = FirebaseMessaging.instance;
    final token = await _fcm.getToken();
    deviceTokenToSendPushNotification = token.toString();
    print("Token Value $deviceTokenToSendPushNotification");
  }
}