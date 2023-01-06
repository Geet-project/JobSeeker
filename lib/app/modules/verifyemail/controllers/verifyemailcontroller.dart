import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../core/utils/app_utils.dart';
import '../../../core/widgets/build_dialog_indicator.dart';
import '../../../domain/repository/ichangepassword_repository.dart';
import '../../../routes/app_pages.dart';

class VerifyEmailController extends GetxController {
  final IChangePasswordRepository changepasswordRepository = Get.find<IChangePasswordRepository>();
  var otp = "".obs;


  verifyOtp(String otp,String email, BuildContext context)  async {
    if (otp.length<4) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Invalid OTP"),
      ));
    }else {
      buildDialogLoadingIndicator();
      try {
        final result = await changepasswordRepository.verifyOtp(email, otp);
        Get.back();
        if(result.error!=null) {
          showToastMessage(title: "Login Error", message: result.error!.message);
        }else {
          if(result.data!.status==200) {
            Get.offNamed(Routes.CREATE_PASSWORD, arguments: [
              {"otp": otp},
              {"email": email},
              {"comefrom": "forgetpassword"}
            ]);
          }else if(result.data!.status!=200){
            showToastMessage(title: "Error", message: result.data!.message!);
          }
        }
      } catch (error) {
        print(error);
      }
    }
  }
}