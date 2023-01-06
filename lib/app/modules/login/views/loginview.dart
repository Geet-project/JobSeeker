import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jobprovider/app/core/resources/assets_manager.dart';
import 'package:jobprovider/app/core/widgets/custom_textfield.dart';
import 'package:jobprovider/app/modules/login/controllers/login_controller.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/widgets/round_button.dart';
import '../../../routes/app_pages.dart';

class LoginScreen extends GetView<LoginController>{
  const LoginScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        builder: (controller){
          return SafeArea(
              child: Scaffold(
                resizeToAvoidBottomInset: true,
                body: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: new BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.centerRight,
                        colors: [
                          const Color(0xFFDFF7FF),
                          const Color(0xFFF3FCFF),
                          const Color(0xFF9FDAEE),
                        ],
                      )
                  ),
                  child: SingleChildScrollView(
                    reverse: true,
                    child: Form(
                      key: controller.loginFromKey,

                      child: Column(
                        children: [
                          Image(image: AssetImage(ImageAssets.cvimg,), width: 250,height: 250,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                              decoration: BoxDecoration(
                                color: ColorManager.white,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              width: controller.displayWidth(context),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Log In", style: TextStyle(color: ColorManager.black,
                                        fontSize: 16, fontWeight: FontWeight.bold, fontFamily: "Poppins",
                                        decoration: TextDecoration.none),),
                                    Divider(height: 13,
                                      color: ColorManager.blueColor,
                                      thickness: 2.5,
                                      indent: 20,
                                      endIndent: 200,),
                                    SizedBox(height: 5),
                                    Text("Enter your Username & Password", style: TextStyle(
                                        color: ColorManager.grey1,
                                        fontSize: 12, fontWeight: FontWeight.normal,
                                        decoration: TextDecoration.none),),
                                    SizedBox(height: 30,),
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
                                      child:
                                      TextFormField(
                                        autovalidateMode: AutovalidateMode.onUserInteraction,
                                        scrollPadding: EdgeInsets.only(bottom:40),
                                        maxLines:1 ,
                                        controller: controller.emailController,
                                        decoration: InputDecoration(
                                          hintText: "Enter Email",
                                          fillColor: ColorManager.white,
                                          enabled: true,
                                          filled: true,
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
                                        validator: (value){
                                          return controller.validateEmail(value!);
                                        },
                                        keyboardType: TextInputType.emailAddress,
                                        style: TextStyle(
                                            color: ColorManager.blacklight ?? Colors.black, fontSize: 12
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20,),
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
                                      child:
                                      Obx(
                                        ()=> TextFormField(
                                          autovalidateMode: AutovalidateMode.onUserInteraction,
                                          maxLines:1 ,
                                          maxLength: 40,
                                          controller: controller.passwordController,
                                          decoration: InputDecoration(
                                              hintText: "Enter Password",
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
                                              prefixIcon: Icon(Icons.lock_open, color: ColorManager.lightBlue,),
                                              suffix: InkWell(
                                                child: Icon (
                                                    controller.passwordVisible.value ? Icons.visibility
                                                        : Icons.visibility_off
                                                ),
                                                onTap: () {
                                                  controller.passwordVisible.value = !controller.passwordVisible.value;
                                                },
                                              )
                                          ),
                                          validator: (value){
                                            return controller.validatePassword(value!);
                                          },
                                          obscureText: controller.passwordVisible.value,
                                          style: TextStyle(
                                              color: ColorManager.blacklight ?? Colors.black, fontSize: 12
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10,),

                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Padding(
                                        padding: const EdgeInsets.only(right: 4.0),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(context, Routes.FORGET_PASSWORD);
                                          },
                                          child: Text("Forgot Password?", style: TextStyle(color:
                                          ColorManager.lightBlue, fontSize: 12, fontFamily: "PoppinsRegular"),),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Center(
                                      child: CustomButton(textColor: ColorManager.white,firstColor:ColorManager.blueColor ,
                                        secondColor: ColorManager.blueColor, ButtonText: "LOGIN",
                                        buttonBottomRightRadius: 30,buttonBottomLeftRadius: 30,buttonTopLeftRadius: 30,buttonTopRightRadius: 30,
                                        ht: 50,wd: 150,textSize: 12,FontFamily: "Poppins", routeName: AppPages.INITIAL,
                                        borderColor: ColorManager.blueColor ,onCustomButtonPressed: (){
                                          controller.checkLogin();
                                          },
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 40,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Dont have an account?",
                              style: TextStyle(
                                color: ColorManager.grey1,
                                fontFamily: 'PoppinsRegular',
                                fontSize: 12
                              ),),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: InkWell(
                                  onTap: (){
                                    Navigator.pushNamed(context, Routes.REGISTER);
                                  },
                                  child: Text("Sign up",
                                    style: TextStyle(
                                        color: ColorManager.blacklight,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w700,
                                        fontSize: 13,
                                      decoration: TextDecoration.underline,
                                    ),),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 20,),

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