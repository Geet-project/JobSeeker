import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jobprovider/app/core/resources/color_manager.dart';
import 'package:jobprovider/app/core/widgets/round_button.dart';
import 'package:jobprovider/app/modules/edit/controllers/editcontroller.dart';

import '../../../routes/app_pages.dart';

class EditAboutScreen extends GetView<EditController>{
  const EditAboutScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditController>(
        builder: (controller){
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: ColorManager.white,
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(CupertinoIcons.multiply, color: ColorManager.black,)
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),
                      Text("Edit About",
                        style: TextStyle(color: ColorManager.black, fontFamily: "Poppins"),),
                      SizedBox(height: 10,),
                      Text("You can write about your years of experience, industry, or skills. people also talk about their achievements or previous job experiences.",
                        style: TextStyle(color: ColorManager.textColor,
                            fontFamily: "PoppinsRegular", fontSize: 11),),
                      SizedBox(height: 20,),
                      Form(
                        key: controller.aboutFormKey,
                        child: TextFormField(
                          controller: controller.editingController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          maxLines: 4,
                          decoration: InputDecoration(
                              hintText: 'Write Here',
                            hintStyle: TextStyle(fontFamily: "PoppinsRegular", fontSize: 12)
                          ),
                          validator: (value){
                            return controller.validateAbout(value!);
                          },
                          keyboardType: TextInputType.text,

                        ),
                      ),
                      SizedBox(height: 300),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: CustomButton(textColor: ColorManager.white,firstColor:ColorManager.blueColor ,
                          secondColor: ColorManager.blueColor, ButtonText: "Save",
                          buttonBottomRightRadius: 30,buttonBottomLeftRadius: 30,buttonTopLeftRadius: 30,buttonTopRightRadius: 30,
                          ht: 50,wd: 190,textSize: 12,FontFamily: "Poppins", routeName: AppPages.INITIAL,
                          borderColor: ColorManager.blueColor ,onCustomButtonPressed: ()
                          {
                            controller.editAbout(context);
                          },
                        ),
                      ),
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