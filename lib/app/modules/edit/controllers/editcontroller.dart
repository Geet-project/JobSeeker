import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:jobprovider/app/core/widgets/build_dialog_indicator.dart';
import 'package:jobprovider/app/domain/entities/profile_response/update_profile_response.dart';
import 'package:jobprovider/app/domain/repository/iprofileedit_repository.dart';

import '../../../core/utils/app_utils.dart';
import '../../../core/utils/shared_preference.dart';

class EditController extends GetxController{
  final IEditProfileRepository editProfileRepository = Get.find();
  TextEditingController editingController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  dynamic argumentData;



  final GlobalKey<FormState>aboutFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState>personalFromKey = GlobalKey<FormState>();


  String? validateAbout(String value) {
    if(value.isEmpty){
      return "*Please enter about";
    }
    return null;
  }

  String? validateAddress(String value) {
    if (value.isEmpty) {
      return "*Please Enter Address";
    }
    return null;
  }

  String? validatePhone(String value) {
    if (!GetUtils.isPhoneNumber(value)) {
      return "*Please Enter Phone Number";
    }
    return null;
  }

  @override
  void onInit() {
    super.onInit();
    argumentData = Get.arguments;
    if(argumentData[0]=="personal"){
      mobileController.text = argumentData[1];
      addressController.text = argumentData[2];
    }else{
      editingController.text = argumentData[1];
    }
    print(argumentData);
  }

  void editAbout(BuildContext context)  async {
    final isValid = aboutFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }else {
      aboutFormKey.currentState!.save();
      buildDialogLoadingIndicator();
      try {
        buildDialogLoadingIndicator();
        var token =  await User_Perference().getUserAccessToken();
        UpdateProfileResponse updateProfileResponse = (await editProfileRepository.editAbout("Bearer "+token, editingController.text)).data!;
        if (updateProfileResponse!=null) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Profile Updated"),
          ));
          Get.back(closeOverlays: true);
        } else {
          Get.back(closeOverlays: true);
        }

      } catch (e) {
        log("e $e");
        Get.back(closeOverlays: true);
      }
    }
  }

  void editPersonalInfo(BuildContext context)  async {
    final isValid = personalFromKey.currentState!.validate();
    if (!isValid) {
      return;
    }else {
      personalFromKey.currentState!.save();
      buildDialogLoadingIndicator();
      try {
        buildDialogLoadingIndicator();
        var token =  await User_Perference().getUserAccessToken();
        UpdateProfileResponse updateProfileResponse = (await editProfileRepository.editPersonalInfo("Bearer "+token, mobileController.text, addressController.text)).data!;
        Get.back(closeOverlays: true);
        if (updateProfileResponse!=null) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Profile Updated"),
          ));
        } else {
          Get.back(closeOverlays: true);
        }

      } catch (e) {
        log("e $e");
        Get.back(closeOverlays: true);
      }
    }
  }

}