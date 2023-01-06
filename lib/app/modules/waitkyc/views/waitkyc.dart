import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jobprovider/app/core/resources/assets_manager.dart';
import 'package:jobprovider/app/modules/attendance/controllers/attendance_controller.dart';
import 'package:jobprovider/app/modules/waitkyc/controllers/kyc_controller.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/widgets/round_button.dart';
import '../../../routes/app_pages.dart';
import '../../home/controllers/homecontroller.dart';


class WaitKycScreen extends GetView<KycController> {
  const WaitKycScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(image: AssetImage(ImageAssets.wait_kyc), width: 200,height: 200,),
              Text("Waiting For Kyc", style: TextStyle(
                color: ColorManager.black, fontWeight: FontWeight.bold,
                fontFamily: "Poppins"
              ),),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Text("Hi "+ controller.argumentData[0] + " Your Job Registration Interview / Approval Process is under way.\n"
                    "Please contact at below given date and time:\n\n" +controller.argumentData[1]+ " "+ controller.argumentData[2],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorManager.grey2, fontWeight: FontWeight.normal,
                  fontFamily: "PoppinsRegular",fontSize: 12
                ),),
              ),
              SizedBox(height: 20),

              Center(
                child: CustomButton(textColor: ColorManager.white,firstColor:ColorManager.blueColor ,
                  secondColor: ColorManager.blueColor, ButtonText: "EXIT",
                  buttonBottomRightRadius: 30,buttonBottomLeftRadius: 30,buttonTopLeftRadius: 30,buttonTopRightRadius: 30,
                  ht: 50,wd: 150,textSize: 12,FontFamily: "Poppins", routeName: AppPages.INITIAL,
                  borderColor: ColorManager.blueColor ,onCustomButtonPressed: () {
                  SystemNavigator.pop();
                  },
                ),
              )
            ],
          ),
        )
    );
  }
}