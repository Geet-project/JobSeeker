import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:jobprovider/app/routes/app_pages.dart';

import '../../../core/utils/app_utils.dart';
import '../../../core/utils/shared_preference.dart';
import '../../../core/widgets/build_dialog_indicator.dart';
import '../../../domain/repository/ichangepassword_repository.dart';

class ForgetPasswordController extends GetxController {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();
  final GlobalKey<FormState>passwordFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState>changePasswordFormKey = GlobalKey<FormState>();
  var passwordVisible = true.obs;
  var repasswordVisible = true.obs;
  final IChangePasswordRepository changepasswordRepository = Get.find<IChangePasswordRepository>();


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

  String? validateConfirmPassword(String value) {
    if (repasswordController.text!= passwordController.text) {
      return "*Password and Confirm Password should match";
    }
    return null;
  }

  sentEmail()  async {
    final isValid = passwordFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }else {
      passwordFormKey.currentState!.save();
      buildDialogLoadingIndicator();
      try {
        final result = await changepasswordRepository.sentEmail(emailController.text);
        Get.back();
        if(result.error!=null) {
          showToastMessage(title: "Login Error", message: result.error!.message);
        }else{
          if(result.data!.status==200) {
            Get.toNamed(Routes.VERIFY_EMAIL, arguments: emailController.text);
          }else if(result.data!.status!=200){
            showToastMessage(title: "Error", message: result.data!.message!);
          }
        }
      } catch (error) {
        print(error);
      }
    }
  }

  void changePssword(BuildContext context)  async {
    final isValid = changePasswordFormKey.currentState!.validate();
    dynamic argumentData = Get.arguments;
    var comeFrom = argumentData[2]['comefrom'];
    if (!isValid) {
      return;
    }
    else {
      changePasswordFormKey.currentState!.save();
      buildDialogLoadingIndicator();
      if (comeFrom == "forgetpassword") {
        try {
          final result = await changepasswordRepository.changePassword(
              argumentData[1]['email'], argumentData[0]['otp'],
              passwordController.text, repasswordController.text);
          Get.back();
          if (result.data!.status != 200) {
            showToastMessage(
                title: "Error", message: result!.data!.message as String);
          } else {
            if (result.data!.status == 200) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Password Changed"),
              ));
              Get.offAllNamed(Routes.LOGIN);
            }
          }
        } catch (error) {
          print(error);
        }
      }else if(comeFrom=="TokenPassword")  {
        var token =  await User_Perference().getUserAccessToken();

        try {
          final result = await changepasswordRepository.usingTokenChangePassword(
            token, passwordController.text, repasswordController.text);
          Get.back();
          if (result.data!.status != 200) {
            showToastMessage(
                title: "Error", message: result!.data!.message as String);
          } else {
            if (result.data!.status == 200) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("Password Changed"),
              ));
              Get.offAllNamed(Routes.LOGIN);
            }
          }
        } catch (error) {
          print(error);
        }
      }
    }


  }




}