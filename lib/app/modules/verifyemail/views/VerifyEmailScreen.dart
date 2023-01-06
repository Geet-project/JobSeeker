import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:get/get.dart';
import 'package:jobprovider/app/core/resources/assets_manager.dart';
import 'package:jobprovider/app/core/widgets/custom_textfield.dart';
import 'package:jobprovider/app/modules/login/controllers/login_controller.dart';
import 'package:jobprovider/app/modules/verifyemail/controllers/verifyemailcontroller.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/widgets/round_button.dart';
import '../../../routes/app_pages.dart';

class VerifyEmailScreen extends GetView<VerifyEmailController>{
  const VerifyEmailScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return GetBuilder<VerifyEmailController>(
        builder: (controller){
          return SafeArea(
              child: Scaffold(
                appBar: AppBar (
                  systemOverlayStyle: SystemUiOverlayStyle(
                    // Status bar color
                    statusBarColor: Colors.white, // For iOS (dark icons)
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
                  title: Text("Verify Your Email",
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
                          const Color(0xFFFFFFFF),
                          const Color(0xFFF3FCFF),
                          const Color(0xFFDFF7FF),
                        ],
                      )
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                        children: [
                          SizedBox(height: 40,),
                          Image(image: AssetImage(ImageAssets.verifyemailimg,), width: 180,height: 180,),
                          SizedBox(height: 20,),
                          Text("Please Enter The 4 Digit Code Sent\n To Your Email Address",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: ColorManager.blacklight, fontFamily: "PoppinsRegular",
                              fontSize: 12, ),),
                          SizedBox(height: 50,),
                          VerificationCode(
                            length: 4,
                            fillColor: Colors.white,
                            textStyle: TextStyle(fontSize: 12),
                            underlineColor: ColorManager.blueColor,
                            underlineUnfocusedColor: ColorManager.blueColor,
                            keyboardType: TextInputType.number,
                            onCompleted: (value) {
                              controller.otp.value = value;
                            },
                            onEditing: (value){
                            },
                          ),
                          SizedBox(height: 20,),
                          Text("Resend Code", style: TextStyle(color: ColorManager.orangeColor,
                          fontFamily: "Poppins", fontSize: 12, decoration: TextDecoration.underline),),
                          SizedBox(height: 60,),
                          Center(
                            child: CustomButton(textColor: ColorManager.white,firstColor:ColorManager.blueColor ,
                              secondColor: ColorManager.blueColor, ButtonText: "VERIFY",
                              buttonBottomRightRadius: 30,buttonBottomLeftRadius: 30,buttonTopLeftRadius: 30,buttonTopRightRadius: 30,
                              ht: 50,wd: 150,textSize: 12,FontFamily: "Poppins", routeName: AppPages.INITIAL,
                              borderColor: ColorManager.blueColor ,onCustomButtonPressed: (){
                                controller.verifyOtp(controller.otp.value,Get.arguments, context);
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),

          );
        }
    );
  }

}