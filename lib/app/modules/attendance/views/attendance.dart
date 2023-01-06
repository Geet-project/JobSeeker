import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jobprovider/app/modules/attendance/controllers/attendance_controller.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/widgets/round_button.dart';
import '../../../routes/app_pages.dart';
import '../../home/controllers/homecontroller.dart';


class AttendanceScreen extends GetView<AttendanceController> {
  const AttendanceScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: ColorManager.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: AppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 16),
                onPressed: () => Navigator.of(context).pop(),
              ),
              backgroundColor: ColorManager.white,
              elevation: 0,
              title: Text("Mark Attendance", style: TextStyle(fontFamily: "Poppins", fontSize: 13,
                  color: ColorManager.black),),
            ),
          ),

          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(controller.jobitem.value!.companyName!, style: TextStyle(
                        fontFamily: "Poppins",fontSize: 16,
                        color: ColorManager.black
                    ),),
                  ),
                  SizedBox(height: 10,),
                  Container (
                    height: 360,
                    decoration: BoxDecoration(
                        color: ColorManager.white,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        boxShadow: [BoxShadow(
                          color: Colors.grey,
                          blurRadius: 3.0,
                        ),]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: CalendarCarousel(
                        pageScrollPhysics: ScrollPhysics(),
                        headerTextStyle: TextStyle(
                            color: ColorManager.black
                        ),
                        todayButtonColor: ColorManager.darkGreen,
                        todayTextStyle: TextStyle (
                            fontSize: 12
                        ),
                        weekendTextStyle: TextStyle(
                            color: ColorManager.blueColor,
                            fontSize: 12
                        ),
                        weekdayTextStyle: TextStyle(
                            color: ColorManager.black,
                            fontSize: 12
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total days of present", style: TextStyle(fontFamily: "Poppins"),),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Text(controller.jobitem.value!.total_present.toString()!+"/" +controller.jobitem.value!.total_hour.toString()!, style: TextStyle(
                            color: ColorManager.darkBlue,
                            fontFamily: "Poppins"
                        ),),
                      ),
                    ],
                  ),
                  // InkWell(
                  //   onTap: (){
                  //     controller.markAttendance(controller.jobitem.value!.appliedJobId!, 0,context, "0", "0" );
                  //   },
                  //   child: Text("Mark Leave", style: TextStyle(color: ColorManager.redColor,
                  //       fontFamily: "Poppins", decoration: TextDecoration.underline,
                  //       fontSize: 12),),
                  // ),
                  SizedBox(height: 20,),

                  Center(
                    child: CustomButton(textColor: ColorManager.white,
                      firstColor:controller.jobitem.value!.is_present==0 && controller.isJobtimeStart==true?
                      ColorManager.darkGreen:
                      ColorManager.lightGrey2 ,
                      secondColor: controller.jobitem.value!.is_present==0 && controller.isJobtimeStart==true?
                      ColorManager.darkGreen:
                      ColorManager.lightGrey2,
                      ButtonText: "Present",
                      buttonBottomRightRadius: 30,buttonBottomLeftRadius: 30,buttonTopLeftRadius: 30,buttonTopRightRadius: 30,
                      ht: 50,wd: 180,textSize: 12,FontFamily: "Poppins", routeName: AppPages.INITIAL,
                      borderColor: controller.jobitem.value!.is_present==1? ColorManager.lightGrey2: ColorManager.darkGreen ,
                      onCustomButtonPressed: () {
                        controller.jobitem.value!.is_present==0 && controller.isJobtimeStart==true
                            ? controller.getLocation(controller.jobitem.value!.appliedJobId!, 1, context):
                        null;
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}