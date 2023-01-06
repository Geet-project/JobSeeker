import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/utils/shared_preference.dart';
import '../../../routes/app_pages.dart';


class SplashController extends GetxController {
  final duration = 6;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(seconds: duration), () async {
      if( await User_Perference().checkUserStatus()){
      Get.offAllNamed(Routes.HOME);
      }else if(!await User_Perference().checkUserStatus()){
      Get.offAllNamed(Routes.GETSTARTED);
      }
    });
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
}