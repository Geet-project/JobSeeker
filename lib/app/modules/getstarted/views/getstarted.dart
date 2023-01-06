import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jobprovider/app/core/resources/color_manager.dart';
import 'package:jobprovider/app/core/utils/shared_preference.dart';
import 'package:jobprovider/app/routes/app_pages.dart';
import 'package:retrofit/http.dart';
import '../../../core/resources/assets_manager.dart';
import '../../../core/widgets/build_screen_background.dart';
import '../../../core/widgets/round_button.dart';
import '../controllers/getstarted_controller.dart';

class GetStartedView extends GetView<GetStartedController>{
  const GetStartedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)  {
    return BuildScaffold(
        backgroundImg: ImageAssets.getstartedbg,
        body: Padding(
          padding: const EdgeInsets.only(top: 50.0, left: 30.0),
          child: Column (
            children: [
              Text("Find your\ndream job\nhere!", style: TextStyle(color: ColorManager.black,
              fontSize: 22, fontWeight: FontWeight.bold, fontFamily: "Poppins"),),
              SizedBox(height: 20,),
              CustomButton(textColor: ColorManager.white,firstColor:ColorManager.projectBlack ,
              secondColor: ColorManager.projectBlack, ButtonText: "Get Start",
              buttonBottomRightRadius: 30,buttonBottomLeftRadius: 30,buttonTopLeftRadius: 30,buttonTopRightRadius: 30,
                ht: 50,wd: 150,textSize: 12,FontFamily: "Poppins", routeName: AppPages.INITIAL,
                borderColor: ColorManager.projectBlack ,onCustomButtonPressed: ()
                async {
                  if( await User_Perference().checkUserStatus()){
                    Get.offAllNamed(Routes.HOME);
                  }else if(!await User_Perference().checkUserStatus()){
                    Get.offAllNamed(Routes.LOGIN);
                  }
                },
              )
            ],
          ),
        )
    );

  }

}