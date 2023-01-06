import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jobprovider/app/core/resources/assets_manager.dart';
import 'package:jobprovider/app/core/resources/color_manager.dart';
import 'package:jobprovider/app/modules/home/controllers/homecontroller.dart';
import 'package:jobprovider/app/modules/home/views/jobs_tab.dart';
import 'package:jobprovider/app/modules/notification/controllers/notificationcontroller.dart';

import '../../../core/widgets/round_button.dart';
import '../../../routes/app_pages.dart';
import '../controller/jobs_controller.dart';


class JobDetailScreen extends GetView<JobController>{
  const JobDetailScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<JobController>(
        builder: (controller) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(60),
              child: AppBar(
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 16),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                backgroundColor: ColorManager.white,
                elevation: 0,
                title: Text("Job Details", style: TextStyle(fontFamily: "Poppins", fontSize: 13,
                    color: ColorManager.black),),
              ),
            ),
            body : controller.isDataLoading.value? const Center(child: CircularProgressIndicator(),):
            Container(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(controller.jobData!.jobRole==null ? "Senior Desinger Electrical":
                      controller.jobData!.jobRole!,
                      style: TextStyle(
                        fontSize: 14,color: ColorManager.black,
                        fontFamily: "PoppinsMedium"
                      ),),
                      SizedBox(height: 5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(controller.jobData!.vendor==null ? "Bachtel Corporation":
                          controller.jobData!.vendor!,
                            style: TextStyle(
                                fontSize: 12,color: ColorManager.black,
                                fontFamily: "PoppinsRegular"
                            ),),
                          Text(controller.jobData!.created_at==null ? "4 hours ago":
                          controller.jobData!.created_at!,
                            style: TextStyle(
                                fontSize: 12,color: ColorManager.darkGreen,
                                fontFamily: "PoppinsRegular"
                            ),),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Column(
                            children:[
                              Image.asset(ImageAssets.dollar_sign,
                              height: 50,width: 50),
                              SizedBox(height: 5,),
                              Text("Salary", style: TextStyle(
                                fontFamily: 'PoppinsLight',
                                fontSize: 11
                              ),),
                              SizedBox(height: 2,),
                              Text("\$"+controller.jobData!.payableSalary!, style: TextStyle(
                                  fontFamily: 'PoppinsRegular',
                                fontSize: 12.5, fontWeight: FontWeight.bold
                              ),)
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 50.0),
                            child: Column(
                              children:[
                                Image.asset(ImageAssets.timer_sign,
                                    height: 50,width: 50),
                                SizedBox(height: 5,),
                                Text("Job Type", style: TextStyle(
                                    fontFamily: 'PoppinsLight',
                                  fontSize: 11
                                ),),
                                SizedBox(height: 2,),
                                Text(controller.jobData!.jobType==null?"Part Time":controller.jobData!.jobType!, style: TextStyle(
                                    fontFamily: 'PoppinsRegular',
                                    fontSize: 12.5, fontWeight: FontWeight.bold
                                ),)
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Icon(Icons.calendar_month, size: 18),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(controller.jobData!.job_date==null?"":controller.jobData!.job_date!,
                              style: TextStyle(fontFamily: "PoppinsRegular", fontSize: 12),),
                          )
                        ],
                      ),
                      SizedBox(height: 8,),
                      Row(
                        children: [
                          Icon(Icons.timer_outlined, size: 18),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(controller.jobData!.startJobTime ==null ? "":controller.jobData!.startJobTime!+ " to " + controller.jobData!.endJobTime! ,
                              style: TextStyle(fontFamily: "PoppinsRegular", fontSize: 12),),
                          )
                        ],
                      ),
                      // SizedBox(height: 8,),
                      // Row(
                      //   children: [
                      //     Icon(Icons.group, size: 18),
                      //     Padding(
                      //       padding: const EdgeInsets.only(left: 10.0),
                      //       child: Text("11-55 employees",
                      //         style: TextStyle(fontFamily: "PoppinsRegular", fontSize: 12),),
                      //     )
                      //   ],
                      // ),
                      SizedBox(height: 8,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.phone, size: 18),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text(controller.jobData!.phone!,
                                  style: TextStyle(fontFamily: "PoppinsRegular", fontSize: 12),),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.email, size: 18),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Text(controller.jobData!.email!,
                                  style: TextStyle(fontFamily: "PoppinsRegular", fontSize: 12),),
                              )
                            ],
                          )

                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.location_on_sharp, size: 18),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.75,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text( controller.jobData!.jobAddress==null? "":controller.jobData!.jobAddress!,
                                style: TextStyle(fontFamily: "PoppinsRegular", fontSize: 12),),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 150,),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Center(
                          child: CustomButton(
                            textColor: ColorManager.white,
                            firstColor:controller.jobData!.is_applied==1? ColorManager.lightGrey2: ColorManager.blueColor ,
                            secondColor: controller.jobData!.is_applied==1? ColorManager.lightGrey2: ColorManager.blueColor,
                            ButtonText: controller.jobData!.is_applied==1? "Applied": "Apply Now",
                            buttonBottomRightRadius: 30,buttonBottomLeftRadius: 30,buttonTopLeftRadius: 30,buttonTopRightRadius: 30,
                            ht: 50,wd: 250,textSize: 12,FontFamily: "Poppins", routeName: AppPages.INITIAL,
                            borderColor: controller.jobData!.is_applied==1? ColorManager.lightGrey2: ColorManager.blueColor ,
                            onCustomButtonPressed: () {
                              controller.jobData!.is_applied==1? null : controller.applyJob(Get.arguments, context);
                            },
                          ),
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