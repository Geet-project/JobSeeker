import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jobprovider/app/core/resources/assets_manager.dart';
import 'package:jobprovider/app/core/widgets/custom_textfield.dart';
import 'package:jobprovider/app/modules/login/controllers/login_controller.dart';
import 'package:jobprovider/app/modules/skills/controllers/skillscontroller.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/widgets/round_button.dart';
import '../../../routes/app_pages.dart';

class SkillsScreen extends GetView<SkillController>{
  const SkillsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SkillController>(
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
                  leading: Container (
                    child: Padding (
                      padding: const EdgeInsets.only(left: 10.0),
                      child: InkWell (
                        onTap: () {
                          Navigator.pop(context);
                        },
                          child: Icon(Icons.arrow_back_ios_new_sharp, color: ColorManager.blacklight,)),
                    ),
                  ),
                  title: Text("Select Skill",
                    style: TextStyle(color: ColorManager.blacklight, fontFamily: "Poppins",
                        fontSize: 16),),
                  centerTitle: true,
                ),
                body: Container (
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
                    child: Obx(
                          ()=> Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                            child:
                            GridView.count(
                              crossAxisCount: 2,
                              childAspectRatio: 1.2,
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              children: List.generate(controller.skillsList.value.length, (index) {
                                final mskillsMap = controller.skillsMap.value;
                                bool value = mskillsMap.values.elementAt(index) ;
                                String skillValue = mskillsMap.keys.elementAt(index) ;
                                return Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Image(image: AssetImage(ImageAssets.vehicleimg), width: 60,height: 60,),
                                            Checkbox(
                                              checkColor: Colors.white,
                                              activeColor: Colors.lightBlue,
                                              value: value ,
                                              shape: CircleBorder(),
                                              onChanged: (bool? value) {
                                                controller.updateCheckboxData(index, value!,skillValue );
                                              },
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8.0),
                                          child: Text(controller.skillsList.value[index], style: TextStyle(color: ColorManager.blacklight,
                                          fontSize: 11, fontFamily: "PoppinsRegular"),),
                                        )
                                      ],
                                    )
                                );
                              }),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: Center(
                              child: CustomButton(textColor: ColorManager.white,firstColor:ColorManager.blueColor ,
                                secondColor: ColorManager.blueColor, ButtonText: "NEXT",
                                buttonBottomRightRadius: 30,buttonBottomLeftRadius: 30,buttonTopLeftRadius: 30,buttonTopRightRadius: 30,
                                ht: 45,wd: 150,textSize: 12,FontFamily: "Poppins", routeName: AppPages.INITIAL,
                                borderColor: ColorManager.blueColor ,onCustomButtonPressed: (){
                                  controller.goToNextScreen();
                                },
                              ),
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