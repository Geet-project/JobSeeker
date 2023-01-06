import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:jobprovider/app/core/resources/assets_manager.dart';
import 'package:jobprovider/app/core/widgets/custom_textfield.dart';
import 'package:jobprovider/app/modules/login/controllers/login_controller.dart';
import 'package:jobprovider/app/modules/signup/controllers/signup_controller.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/widgets/round_button.dart';
import '../../../routes/app_pages.dart';

class RegisterScreen2 extends GetView<SignUpController> {
  const RegisterScreen2({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController> (
        builder: (controller){
          return SafeArea(
              child: Scaffold(
                appBar: AppBar (
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                  ),
                  backgroundColor: ColorManager.white,
                  elevation: 0.0,
                  leading: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                          child: Icon(Icons.arrow_back_ios_new_sharp, color: ColorManager.blacklight,)),
                    ),
                  ),
                  title: Text("Add Your Information",
                    style: TextStyle(color: ColorManager.blacklight, fontFamily: "Poppins",
                    fontSize: 16),),
                  centerTitle: true,
                ),
                body: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: new BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.centerRight,
                        colors: [
                          const Color(0xFFDFF7FF),
                          const Color(0xFFDFF7FF),
                          const Color(0xFF9FDAEE),
                        ],
                      )
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Form(
                        key: controller.saveBasicDateFormKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20,),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text("Name", style: TextStyle(fontFamily: "PoppinsRegular",
                              fontSize: 13),),
                            ),
                            SizedBox(height: 5,),
                            Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: ColorManager.blue.withOpacity(0.6),
                                    spreadRadius: 8,
                                    blurRadius: 8,
                                  ),
                                ],
                              ),
                              child: TextFormField(
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                maxLines:1 ,
                                controller: controller.nameController,
                                decoration: InputDecoration(
                                  hintText: "Enter Your Name",
                                  fillColor: ColorManager.white,
                                  contentPadding: EdgeInsets.all(20.0),
                                  enabled: true,
                                  filled: true,
                                  counterText: '',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                  hintStyle: TextStyle(fontWeight: FontWeight.normal),
                                ),
                                validator: (value){
                                  return controller.validateName(value!);
                                },
                                keyboardType: TextInputType.name,
                                style: TextStyle(
                                    color: ColorManager.blacklight ?? Colors.black, fontSize: 12
                                ),
                              ),
                            ),
                            // SizedBox(height: 10,),
                            // Padding(
                            //   padding: const EdgeInsets.only(left: 8.0),
                            //   child: Text("Last Name", style: TextStyle(fontFamily: "PoppinsRegular",
                            //       fontSize: 13),),
                            // ),
                            // SizedBox(height: 5,),
                            // Container(
                            //   decoration: BoxDecoration(
                            //     boxShadow: [
                            //       BoxShadow(
                            //         color: ColorManager.blue.withOpacity(0.6),
                            //         spreadRadius: 8,
                            //         blurRadius: 8,
                            //       ),
                            //     ],
                            //   ),
                            //   child: TextField(
                            //     maxLines:1 ,
                            //     controller: controller.emailController,
                            //     decoration: InputDecoration(
                            //       hintText: "Enter Your Last Name",
                            //       fillColor: ColorManager.white,
                            //       contentPadding: EdgeInsets.all(20.0),
                            //       enabled: true,
                            //       filled: true,
                            //       counterText: '',
                            //       border: OutlineInputBorder(
                            //         borderRadius: BorderRadius.circular(30.0),
                            //         borderSide: BorderSide(
                            //           width: 0,
                            //           style: BorderStyle.none,
                            //         ),
                            //       ),
                            //       hintStyle: TextStyle(fontWeight: FontWeight.normal),
                            //     ),
                            //     keyboardType: TextInputType.emailAddress,
                            //     style: TextStyle(
                            //         color: ColorManager.blacklight ?? Colors.black, fontSize: 12
                            //     ),
                            //   ),
                            // ),
                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text("DOB", style: TextStyle(fontFamily: "PoppinsRegular",
                                  fontSize: 13),),
                            ),
                            SizedBox(height: 5,),
                            Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: ColorManager.blue.withOpacity(0.6),
                                    spreadRadius: 8,
                                    blurRadius: 8,
                                  ),
                                ],
                              ),
                              child: InkWell(
                                onTap: (){
                                  controller.chooseDate("DOB");
                                },
                                child: TextFormField(

                                  maxLines:1 ,
                                  controller: controller.dobController,
                                  decoration: InputDecoration(
                                    hintText: "Select DOB date",
                                    fillColor: ColorManager.white,
                                    contentPadding: EdgeInsets.all(20.0),
                                    suffixIcon: Icon(Icons.calendar_today, color: ColorManager.grey3,
                                    size: 14,),
                                    enabled: false,
                                    filled: true,
                                    counterText: '',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      borderSide: BorderSide(
                                        width: 0,
                                        style: BorderStyle.none,
                                      ),
                                    ),
                                    hintStyle: TextStyle(fontWeight: FontWeight.normal),
                                  ),

                                  keyboardType: TextInputType.emailAddress,
                                  style: TextStyle(
                                      color: ColorManager.blacklight ?? Colors.black, fontSize: 12
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text("Gender", style: TextStyle(fontFamily: "PoppinsRegular",
                                  fontSize: 13),),
                            ),
                            SizedBox(height: 5,),
                            Obx(
                                () => Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: ColorManager.white
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: DropdownButton<String> (
                                    value: controller.genderSelected.value,
                                    style: TextStyle(fontSize: 12, color: Colors.black45),
                                    isExpanded: true,
                                    icon: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Icon(Icons.arrow_drop_down, color: ColorManager.primary,),
                                    ),
                                    underline: SizedBox(),
                                    items: <String>['Select Gender','Male', 'Female'].map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (String? value) {
                                      controller.setSelected(value);
                                    },
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text("Phone number", style: TextStyle(fontFamily: "PoppinsRegular",
                                  fontSize: 13),),
                            ),
                            SizedBox(height: 5,),
                            Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: ColorManager.blue.withOpacity(0.6),
                                    spreadRadius: 8,
                                    blurRadius: 8,
                                  ),
                                ],
                              ),
                              child: TextFormField (
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                maxLines:1 ,
                                controller: controller.phoneController,
                                decoration: InputDecoration(
                                  hintText: "Enter your number",
                                  fillColor: ColorManager.white,
                                  contentPadding: EdgeInsets.all(20.0),
                                  enabled: true,
                                  filled: true,
                                  counterText: '',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    borderSide: BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                  hintStyle: TextStyle(fontWeight: FontWeight.normal),
                                ),
                                validator: (value) {
                                  return controller.validatePhone(value!);
                                },
                                keyboardType: TextInputType.phone,
                                style: TextStyle(
                                    color: ColorManager.blacklight ?? Colors.black, fontSize: 12
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text("Provinences", style: TextStyle(fontFamily: "PoppinsRegular",
                                  fontSize: 13),),
                            ),
                            SizedBox(height: 5,),
                            Obx(
                                  () => Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: ColorManager.white
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: DropdownButton<String> (
                                    value: controller.stateSelected.value,
                                    style: TextStyle(fontSize: 12, color: Colors.black45),
                                    isExpanded: true,
                                    icon: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Icon(Icons.arrow_drop_down, color: ColorManager.primary,),
                                    ),
                                    underline: SizedBox(),
                                    items: controller.states.value.map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (String? value) {
                                      controller.setStateSelected(value);
                                    },
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text("Highest qualification", style: TextStyle(fontFamily: "PoppinsRegular",
                                  fontSize: 13),),
                            ),
                            SizedBox(height: 5,),
                            Obx(
                                  () => Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: ColorManager.white
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: DropdownButton<String> (
                                    value: controller.qualificationSelected.value,
                                    style: TextStyle(fontSize: 12, color: Colors.black45),
                                    isExpanded: true,
                                    icon: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Icon(Icons.arrow_drop_down, color: ColorManager.primary,),
                                    ),
                                    underline: SizedBox(),
                                    items: controller.higherqftitems.value.map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (String? value) {
                                      controller.setQualificationSelected(value);
                                    },
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20,),
                            Center(
                              child: CustomButton(textColor: ColorManager.white,firstColor:ColorManager.blueColor ,
                                secondColor: ColorManager.blueColor, ButtonText: "NEXT",
                                buttonBottomRightRadius: 30,buttonBottomLeftRadius: 30,buttonTopLeftRadius: 30,buttonTopRightRadius: 30,
                                ht: 50,wd: 150,textSize: 12,FontFamily: "Poppins", routeName: AppPages.INITIAL,
                                borderColor: ColorManager.blueColor ,onCustomButtonPressed: (){
                                  controller.userSaveInformation(context,Get.arguments);
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
          );
        }
    );
  }
}