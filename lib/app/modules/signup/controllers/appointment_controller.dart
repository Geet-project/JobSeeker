import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:jobprovider/app/domain/entities/time_slot_responses/timeslot_response.dart';
import 'package:jobprovider/app/domain/repository/iregister_repository.dart';
import 'package:jobprovider/app/routes/app_pages.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/utils/app_utils.dart';
import '../../../core/utils/shared_preference.dart';
import '../../../core/widgets/build_dialog_indicator.dart';

class AppointmentController extends GetxController {
  var passwordVisible = true.obs;
  var repasswordVisible = true.obs;
  TextEditingController interviewdateController = TextEditingController();
  final IRegisterRepository registerRepository = Get.find<IRegisterRepository>();
  final GlobalKey<FormState>appoinmentFormKey = GlobalKey<FormState>();
  var selectedDate = DateTime.now().obs;
  final qualificationSelected = "Graduate".obs;
  final genderSelected = "Male".obs;
  final selected = 0.obs;
  final selectedTimeSlot = "".obs;
  PickedFile? imageFile;
  final ImagePicker picker = ImagePicker();
  var isDataLoading = false.obs;
  final appointmentList = <TimeSlotResponseDatum>[].obs;


  @override
  void onInit() {
    getTimeSlots();
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
  void changePasswordVisiblity(){
    passwordVisible.value = !passwordVisible.value;
  }
  void changeRePasswordVisiblity(){
    repasswordVisible.value = !repasswordVisible.value;
  }

  @override
  void onClose() {

    super.onClose();
  }

  String? validateDob(String value) {
    if (value.isEmpty) {
      return "*Please Enter Dob";
    }
    return null;
  }




  void saveAppoinmentData(BuildContext context, String token)  async {
    if (interviewdateController.text.isEmpty) {
      Get.snackbar("Date Error", "Please enter date");
    }else if(selectedTimeSlot.value == ""){
      Get.snackbar("Slot Error", "Please select any one slot.");
    }
    else if(imageFile==null){
      Get.snackbar("Image Error", "Please upload photo");
    }
    else {
      buildDialogLoadingIndicator();
      final response = await registerRepository.appoinmentData(token,interviewdateController.text, imageFile!.path,
        selectedTimeSlot.value
      );
      Get.back();
      if(response.status==200) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Data Saved"),
        ));
        Get.offNamed(Routes.LOGIN);
      }else{
        Get.snackbar('Error', response.message==null? "Something went wrong": response.message!);
      }
    }
  }

  chooseDate(String type) async {
    final now = DateTime.now();
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: DateTime(now.year, now.month, now.day+1),
        firstDate: DateTime(now.year, now.month, now.day+1), //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2101),
        confirmText: 'Confirm',
        helpText: 'Select Interview Date',
        cancelText: 'Close'
    );
    if(pickedDate!=null && pickedDate!=selectedDate.value){
      String formattedDate = new DateFormat("yyyy-MM-dd").format(pickedDate);
      if(type=="Interview")
        interviewdateController.text=  formattedDate;
    }
  }

  void setSelected(String? value){
    genderSelected.value = value!;
  }
  void setQualificationSelected(String? value) {
    qualificationSelected.value = value!;
  }
  void takePhoto(ImageSource source) async{
    try{
      var pickedFile = await picker.getImage(source: source);
      if (pickedFile != null) {
        imageFile = pickedFile;
        update();
      } else {
        Get.snackbar('Error', 'Please Provide Image');
      }
    } catch(error) {
      Get.snackbar('Error', error.toString());
    }
  }

  getTimeSlots() async {
    try {
      isDataLoading.value = true;
      TimeSlotResponse timeSlotResponse = (await registerRepository.getTimeSlots()).data!;
      if (timeSlotResponse!=null) {
        isDataLoading.value = false;
        appointmentList.value = timeSlotResponse!.data!;
        update();
      } else {
        isDataLoading.value = false;

      }
    } catch (e) {
      log("e $e");
    }
  }

}