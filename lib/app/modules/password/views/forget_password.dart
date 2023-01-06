import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:jobprovider/app/core/resources/assets_manager.dart';
import 'package:jobprovider/app/core/widgets/custom_textfield.dart';
import 'package:jobprovider/app/modules/login/controllers/login_controller.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/widgets/round_button.dart';
import '../../../routes/app_pages.dart';
import '../controllers/forgetpasswordcontroller.dart';

class ForgetPasswordScreen extends GetView<ForgetPasswordController>{
  const ForgetPasswordScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgetPasswordController>(
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
                  title: Text("Forget Password",
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
                    child: Form(
                      key: controller.passwordFormKey,
                      child: Column(
                        children: [
                          SizedBox(height: 40,),
                          Image(image: AssetImage(ImageAssets.forgetpasswordimg,), width: 180,height: 180,),
                          SizedBox(height: 20,),
                          Text("Please Enter Your Email Address To\n Receive A Verification Code.",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: ColorManager.blacklight, fontFamily: "PoppinsRegular",
                                fontSize: 12, ),),
                          SizedBox(height: 40,),
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
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: TextFormField(
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                maxLines:1 ,
                                controller: controller.emailController,
                                decoration: InputDecoration(
                                  hintText: "Enter email address",
                                  fillColor: ColorManager.white,
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
                                  prefixIcon: Icon(Icons.email_outlined, color: ColorManager.lightBlue,),
                                ),
                                keyboardType: TextInputType.emailAddress,
                                style: TextStyle(
                                    color: ColorManager.blacklight ?? Colors.black, fontSize: 12
                                ),
                                validator: (value){
                                  return controller.validateEmail(value!);
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 60),
                          Center(
                            child: CustomButton(textColor: ColorManager.white,firstColor:ColorManager.blueColor ,
                              secondColor: ColorManager.blueColor, ButtonText: "SEND",
                              buttonBottomRightRadius: 30,buttonBottomLeftRadius: 30,buttonTopLeftRadius: 30,buttonTopRightRadius: 30,
                              ht: 50,wd: 150,textSize: 12,FontFamily: "Poppins", routeName: AppPages.INITIAL,
                              borderColor: ColorManager.blueColor ,onCustomButtonPressed: (){
                                controller.sentEmail();
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

}