import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobprovider/app/core/resources/assets_manager.dart';
import 'package:jobprovider/app/core/widgets/custom_textfield.dart';
import 'package:jobprovider/app/modules/login/controllers/login_controller.dart';
import 'package:jobprovider/app/modules/signup/controllers/signup_controller.dart';
import 'package:jobprovider/app/routes/app_pages.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/widgets/round_button.dart';
import '../controllers/appointment_controller.dart';

class AppointmentScreen extends GetView<AppointmentController>{
  const AppointmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppointmentController>(
        builder: (controller){
          return SafeArea(
              child: Scaffold(
                appBar: AppBar(
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
                ),
                body: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: new BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.centerRight,
                        colors: [
                          const Color(0xFFFFFFFF),
                          const Color(0xFFF3FCFF),
                          const Color(0xFFF3FCFF),
                        ],
                      )
                  ),
                  child: SingleChildScrollView(
                    physics: ScrollPhysics (),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Add some details for the employer",style: TextStyle(
                            fontFamily: "Poppins", fontSize: 15
                          ),),
                          SizedBox(height: 4,),
                          Text("We will help you find the right job opportunities based on the details you enter here",style: TextStyle(
                              fontFamily: "PoppinsRegular", fontSize: 11
                          ),),
                          SizedBox(height: 30,),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text("Select Date for interview", style: TextStyle(fontFamily: "PoppinsRegular",
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
                                controller.chooseDate("Interview");
                              },
                              child: TextFormField(
                                maxLines:1 ,
                                controller: controller.interviewdateController,
                                decoration: InputDecoration(
                                  hintText: "Select date",
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
                                validator: (value) {
                                  return controller.validateDob(value!);
                                },
                                keyboardType: TextInputType.emailAddress,
                                style: TextStyle(
                                    color: ColorManager.blacklight ?? Colors.black, fontSize: 12
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 15,),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text("Select Time for interview", style: TextStyle(fontFamily: "PoppinsRegular",
                                fontSize: 13),),
                          ),
                          SizedBox(height: 10,),
                          GridView.count(
                            shrinkWrap: true,
                            cacheExtent: 0.0,
                            physics: ClampingScrollPhysics(),
                            crossAxisCount: 3,
                            childAspectRatio: 2,
                            children: List.generate(controller.appointmentList.value.length, (index) {
                              final timeslots = controller.appointmentList.value[index];
                              return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomRadio(timeslots.fromTime!, index)
                              );
                            }),
                          ),
                          SizedBox(height: 20,),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text("Upload Selfie", style: TextStyle(
                              fontFamily: "PoppinsRegular"
                            ),),
                          ),
                          SizedBox(height: 5,),
                          SizedBox(
                            height: 120,
                            child: Container(
                              decoration: BoxDecoration(
                                color: ColorManager.white,
                                borderRadius: BorderRadius.circular(15.0)
                              ),
                              child: Center(
                                child:  InkWell(
                                  onTap: (){
                                    showModalBottomSheet(
                                      context: context,
                                      builder: ((builder) =>
                                          bottomSheet(context)),
                                    );
                                    },
                                  child: DottedBorder(
                                    dashPattern: [4, 4],
                                    strokeWidth: 2,
                                    color: ColorManager.blueColor,
                                    strokeCap: StrokeCap.round,
                                    borderType: BorderType.RRect,
                                    radius: Radius.circular(10),
                                    child: Container(
                                        height: 70,
                                        width: 120,
                                        child:  _getImageContainer()
                                    ),
                                  ),
                                ),
                              ),                          ),
                          ),
                          SizedBox(height: 20,),
                          Center(
                            child: CustomButton(textColor: ColorManager.white,firstColor:ColorManager.blueColor ,
                              secondColor: ColorManager.blueColor, ButtonText: "SUBMIT",
                              buttonBottomRightRadius: 30,buttonBottomLeftRadius: 30,buttonTopLeftRadius: 30,buttonTopRightRadius: 30,
                              ht: 50,wd: 200,textSize: 12,FontFamily: "Poppins", routeName: AppPages.INITIAL,
                              borderColor: ColorManager.blueColor ,onCustomButtonPressed: (){
                              controller.saveAppoinmentData(context, Get.arguments);
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
          );
        }
    );
  }

  Widget CustomRadio(String txt, int index){
    return Obx (
      ()=> OutlinedButton (
          onPressed: () {
            controller.selected.value = index;
            controller.selectedTimeSlot.value = txt;
          },
          style: OutlinedButton.styleFrom(
              side: BorderSide(width: 0.0, color: Colors.white),
              backgroundColor: (controller.selected.value==index) ? ColorManager.lightBlue2 : Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
              )
          ) ,
          child: Text(txt,
            style: TextStyle(
                color: ColorManager.textColor,
                fontFamily: 'Lato',
                fontSize: 11
            ),)
      ),
    );
  }

  Widget _getImageContainer() {
    if(controller.imageFile==null){
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.cloud_upload, color: ColorManager.blueColor,),
          Text("Upload Image", style: TextStyle(color: Colors.black45, fontFamily: "Lato",
              fontSize: 10),)
        ],
      );
    }else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.file(File(controller.imageFile!.path), width: 30, height: 30,),
          SizedBox(height: 5),
          Text("Image Uploaded", style: TextStyle(color: Colors.black45, fontFamily: "Lato",
              fontSize:10),)
        ],
      );
    }
  }

  Widget bottomSheet(BuildContext context)
  {
    return Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20
        ),
        child: Column(
          children: [
            Text('Choose Photo',
              style: TextStyle(fontSize: 20.0),),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                    onPressed: (){
                      controller.takePhoto(ImageSource.camera);
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.camera),
                    label: Text('Camera')
                ),
                TextButton.icon(
                    onPressed: (){
                      controller.takePhoto(ImageSource.gallery);
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.image),
                    label: Text('Gallery')
                )
              ],
            )
          ],
        )
    );
  }
}