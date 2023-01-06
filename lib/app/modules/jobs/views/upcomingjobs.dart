import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jobprovider/app/core/resources/assets_manager.dart';
import 'package:jobprovider/app/core/resources/color_manager.dart';
import 'package:jobprovider/app/modules/home/controllers/homecontroller.dart';
import 'package:jobprovider/app/modules/home/views/jobs_tab.dart';

import '../../../routes/app_pages.dart';
import '../../jobdetail/controller/jobs_controller.dart';


class UpcomingJobtab extends GetView<HomeController>{
  const UpcomingJobtab({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController> (
        builder: (controller) {
          return controller.isUpcomigDataLoading.value ?
            const Center(child: CircularProgressIndicator(),):
            SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text("Select Date (YYYY-MM-DD)", style: TextStyle(
                        color: ColorManager.grey, fontFamily: "PoppinsMedium",
                        fontSize: 13
                    ),),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: InkWell(
                      onTap: () {
                        controller.chooseHomeDate("upcoming");
                      },
                      child: Container(
                        decoration: BoxDecoration (
                            color: ColorManager.white,
                            borderRadius: BorderRadius.circular(2),
                            border: Border.all(
                                width: 1,
                                color: ColorManager.lightwhite
                            )
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(controller.upcomingJobDate.value==""?"Select Date":controller.upcomingJobDate.value, style: TextStyle(color: ColorManager.lightGrey1,
                                  fontFamily: "PoppinsRegular", fontSize: 11),),
                              Icon(Icons.calendar_today, color: ColorManager.lightGrey1,size: 13,)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 14, right: 14),
                      child:
                      Obx(
                            ()=> ListView.builder(
                          physics: const ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemExtent: null,
                          itemCount: controller.upcomingjobList.length,
                          itemBuilder: (BuildContext context, int index){
                            final upcomingjoblist = controller.upcomingjobList.value[index];
                            return InkWell(
                              onTap: () {
                                Get.toNamed(Routes.JOB_DETAIL, arguments: upcomingjoblist.jobid!);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: ColorManager.lightBlue3,
                                      border: Border.all(
                                        color: ColorManager.lightBlue,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(20))
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(upcomingjoblist.jobRole!, style: TextStyle(color: ColorManager.black,
                                                fontWeight: FontWeight.bold, fontFamily: "Poppins", fontSize: 12),),
                                            InkWell(
                                                onTap: (){
                                                  controller.deleteJob(upcomingjoblist.appliedJobId!, context);
                                                },

                                                child: Icon(Icons.delete_forever_rounded, color: ColorManager.redColor, size: 20,))
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Icon(Icons.home_work_outlined,color: ColorManager.grey4,size: 14,),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 8.0),
                                              child: Text(upcomingjoblist.companyName!,
                                                  style: TextStyle(fontFamily: "PoppinsRegular", color: Colors.black87,
                                                    fontSize: 12,)
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        Row(
                                          children: [
                                            Icon(Icons.location_on_sharp,color: ColorManager.grey4,size: 14,),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 8.0),
                                              child: Text(upcomingjoblist.jobAddress==null ? "Delhi/NCR, Sector-19, Faridabad": upcomingjoblist.jobAddress!,
                                                  style: TextStyle(fontFamily: "PoppinsRegular", color: Colors.black87,
                                                    fontSize: 10,)
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        Row(
                                          children: [
                                            Icon(Icons.timer_outlined,color: ColorManager.grey4,size: 14,),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 8.0),
                                              child: Text("Slot- "+ upcomingjoblist.slot!,
                                                  style: TextStyle(fontFamily: "PoppinsRegular", color: Colors.black87,
                                                    fontSize: 10,)
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10,),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: ColorManager.lightBlue1,
                                              borderRadius: BorderRadius.circular(10)
                                          ) ,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 10.0,
                                                vertical: 13),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Image(image: AssetImage(ImageAssets.donemark), width: 15,height: 15),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 10.0),
                                                  child: Text("Application Sent Today",
                                                    style: TextStyle(fontFamily: "PoppinsRegular", fontSize: 12),),
                                                )
                                              ],
                                            ),
                                          ),
                                        )

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
          ),
                ],
              ),
            );
        }
    );
  }
}