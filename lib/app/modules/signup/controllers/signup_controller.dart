import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:jobprovider/app/domain/entities/dropdown_responses/higher_qualification_response.dart';
import 'package:jobprovider/app/domain/entities/dropdown_responses/state_responses.dart' as state;
import 'package:jobprovider/app/domain/repository/iregister_repository.dart';
import 'package:jobprovider/app/routes/app_pages.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/utils/app_utils.dart';
import '../../../core/utils/shared_preference.dart';
import '../../../core/widgets/build_dialog_indicator.dart';

class SignUpController extends GetxController {
  var passwordVisible = true.obs;
  var repasswordVisible = true.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController interviewdateController = TextEditingController();
  final IRegisterRepository registerRepository = Get.find<IRegisterRepository>();
  final GlobalKey<FormState>registerFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState>saveBasicDateFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState>appoinmentFormKey = GlobalKey<FormState>();
  var selectedDate = DateTime.now().obs;
  final qualificationSelected = "Select Highest Qualification".obs;
  final stateSelected = "Select Provinence".obs;

  final genderSelected = "Select Gender".obs;
  final selected = 0.obs;
  PickedFile? imageFile;
  final ImagePicker picker = ImagePicker();
  final higherqftDataList = <HigherQualificationDatum>[].obs;
  final stateDataList = <state.Datum>[].obs;

  final higherqftitems = <String>[].obs;
  final states = <String>[].obs;



  @override
  void onInit() {
    super.onInit();
    getHigherQualificationData();
    getStates();
  }
  Size displaySize(BuildContext context) {
    debugPrint('Size = ' + MediaQuery.of(context).size.toString());
    return MediaQuery.of(context).size;
  }
  double displayWidth(BuildContext context) {
    debugPrint('Width = ' + displaySize(context).width.toString());
    return displaySize(context).width;
  }
  void changePasswordVisiblity(){
    passwordVisible.value = !passwordVisible.value;
  }
  void changeRePasswordVisiblity(){
    repasswordVisible.value = !repasswordVisible.value;
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    repasswordController.dispose();
    super.onClose();
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "*Please Provide valid Email";
    }
    return null;
  }

  String? validateName(String value) {
    if (value.isEmpty) {
      return "*Please Enter Name";
    }
    return null;
  }
  String? validateDob(String value) {
    if (value.isEmpty) {
      return "*Please Enter Dob";
    }
    return null;
  }

  String? validatePhone(String value) {
    if (!GetUtils.isPhoneNumber(value)) {
      return "*Please Enter Phone Number";
    }
    return null;
  }

  String? validateCity(String value) {
    if (value.isEmpty) {
      return "*Please Enter City";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 6) {
      return "*Password must be of 6 characters";
    }
    return null;
  }

  String? validateGender(String value) {
    if (value.isEmpty) {
      return "*Please Select Gender";
    }
    return null;
  }

  String? validateQualification(String value) {
    if (value.isEmpty) {
      return "*Please Select Higher Qualification";
    }
    return null;
  }

  String? validateConfirmPassword(String value) {
    if (repasswordController.text!= passwordController.text) {
      return "*Password and Confirm Password should match";
    }
    return null;
  }

  void userRegister(BuildContext context)  async {
    final isValid = registerFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    else {
      registerFormKey.currentState!.save();
      buildDialogLoadingIndicator();
      try {
        final result = await registerRepository.userRegister(emailController.text, passwordController.text, repasswordController.text);
        Get.back();
        if(result.data!.status!=200) {
          showToastMessage(title: "Error", message: result!.data!.message as String);
        } else {
          if(result.data!.status==200){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Registration successfull. A Link has been sent to your Email-Id."),
            ));
            // Get.offNamed(Routes.REGISTER2, arguments: result.data!.data!.token);
          }
        }
      } catch (error) {
        print(error);
        Get.back();
        showToastMessage(title: "Error", message: "Something went wrong");
      }
    }
  }

  void userSaveInformation(BuildContext context, String token)  async {
    final isValid = saveBasicDateFormKey.currentState!.validate();
    if (nameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Please enter name"),
      ));
      return;
    }else if(dobController.text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Please select DOB"),
      ));
      return;
    }else if(genderSelected.value=="Select Gender"){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Please select Gender"),
      ));
      return;
    }else if (!GetUtils.isPhoneNumber(phoneController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Please enter valid phone number"),
      ));
      return;
    }else if (stateSelected.value == "Select Provinence") {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Please select Provinence"),
      ));
      return;
    }
    else if(qualificationSelected.value == "Select Highest Qualification"){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Please select Qualification"),
      ));
      return;
    } else {
      saveBasicDateFormKey.currentState!.save();
      buildDialogLoadingIndicator();
      try {
        final result = await registerRepository.userSaveBasicInfo("Bearer "+token,nameController.text, dobController.text, genderSelected.value, phoneController.text,
        stateSelected.value, qualificationSelected.value);
        Get.back();
        if(result.data!.status!=200) {
          showToastMessage(title: "Error", message: result!.data!.message as String);
        }else {
          if(result.data!.status==200){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Data Saved"),
            ));
            Get.offNamed(Routes.APPOINTMENT,arguments: token);
          }
        }
      } catch (error) {
        Get.back();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(error.toString()),
        ));
        print(error);
      }
    }
  }

  // void saveAppoinmentData(BuildContext context, String token)  async {
  //   if (interviewdateController.text.isEmpty) {
  //     Get.snackbar("Date Error", "Please enter date");
  //   }else if(imageFile==null){
  //     Get.snackbar("Image Error", "Please upload photo");
  //   }
  //   else {
  //     appoinmentFormKey.currentState!.save();
  //     buildDialogLoadingIndicator();
  //     try {
  //       final result = await registerRepository.appoinmentData("Bearer "+token, interviewdateController.text,
  //           File(imageFile!.path)
  //       );
  //       Get.back();
  //       if(result.data!.status!=200) {
  //         showToastMessage(title: "Error", message: result!.data!.message as String);
  //       }else {
  //         if(result.data!.status==200) {
  //           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //             content: Text("Data Saved"),
  //           ));
  //         }
  //       }
  //     } catch (error) {
  //       Get.back();
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //         content: Text(error.toString()),
  //       ));
  //       print(error);
  //     }
  //   }
  // }


  chooseDate(String type) async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!, initialDate: DateTime.now(),
        firstDate: DateTime(1900), //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2101),
        confirmText: 'Confirm',
        helpText: 'Select DOB',
        cancelText: 'Close'
    );
    if(pickedDate!=null && pickedDate!=selectedDate.value){
      String formattedDate = new DateFormat("yyyy-MM-dd").format(pickedDate);
      if(type=="DOB")
        dobController.text = formattedDate;
      else if(type=="Interview")
        interviewdateController.text=  formattedDate;
    }
  }

  void setSelected(String? value){
    genderSelected.value = value!;
  }
  void setQualificationSelected(String? value){
    qualificationSelected.value = value!;
  }

  void setStateSelected(String? value){
    stateSelected.value = value!;
  }


  void takePhoto(ImageSource source) async{
    var pickedFile = await picker.getImage(source: source);
    if (pickedFile != null) {
      imageFile = pickedFile;
      update();
    } else {
      Get.snackbar('Error', 'Please Provide Image');
    }
  }

  getHigherQualificationData() async {
    higherqftitems.clear();
    try {
      final result = await registerRepository.gethQftData("Higher Qualification");
      if(result.data!.status!=200) {

      }else {
        if(result.data!.status==200) {
          higherqftDataList.value= result.data!.data!;
          higherqftitems.insert(0, "Select Highest Qualification");
          for(int i=0; i<higherqftDataList.value.length; i++) {
            final dataList = higherqftDataList.value[i];
            higherqftitems.add(dataList.name!);
          }
        }
      }
    } catch (error) {
      print(error);
    }

  }


  getStates() async {
    states.clear();
    try {
      final result = await registerRepository.getstates();
      if(result.data!.status!=200) {

      }else {
        if(result.data!.status==200) {
          stateDataList.value= result.data!.data!;
          states.insert(0, "Select Provinence");
          for(int i=0; i<stateDataList.value.length; i++) {
            final dataList = stateDataList.value[i];
            states.add(dataList.name!);
          }
        }
      }
    } catch (error) {
      print(error);
    }

  }

}