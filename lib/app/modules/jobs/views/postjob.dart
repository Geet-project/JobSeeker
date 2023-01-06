import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jobprovider/app/core/resources/color_manager.dart';
import 'package:jobprovider/app/modules/home/controllers/homecontroller.dart';
import 'package:jobprovider/app/modules/home/views/jobs_tab.dart';

import '../../../routes/app_pages.dart';
import '../../jobdetail/controller/jobs_controller.dart';


class PostJobTab extends GetView<HomeController>{
  const PostJobTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController> (
        builder: (controller) {
          return
            controller.isPastJobDataLoading.value ?
            const Center(child: CircularProgressIndicator(),):
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    SizedBox(height: 10),
                    Text("Select Date (YYYY-MM-DD)", style: TextStyle(
                        color: ColorManager.grey, fontFamily: "PoppinsMedium",
                        fontSize: 13
                    ),),
                    SizedBox(height: 10),
                    InkWell(
                      onTap: () {
                        controller.chooseHomeDate("past");
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
                              Text(controller.pastJobDate.value==""?"Select Date":controller.pastJobDate.value, style: TextStyle(color: ColorManager.lightGrey1,
                                  fontFamily: "PoppinsRegular", fontSize: 11),),
                              Icon(Icons.calendar_today, color: ColorManager.lightGrey1,size: 13,)
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Obx(
                        ()=> ListView.builder(
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          itemExtent: null,
                          itemCount: controller.pastjobList.length,
                          itemBuilder: (BuildContext context, int index){
                            final pastjoblist = controller.pastjobList.value[index];
                            return InkWell(
                              onTap: () {
                                Get.toNamed(Routes.JOB_DETAIL, arguments: pastjoblist.jobid!);
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
                                        SizedBox(height: 5),
                                        Text(pastjoblist.jobRole!,
                                            style: TextStyle(fontFamily: "Poppins", color: Colors.black87,
                                              fontSize: 13,)
                                        ),
                                        SizedBox(height: 5,),
                                        Row(
                                          children: [
                                            Icon(Icons.home_work_outlined,color: ColorManager.grey4,size: 14,),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 8.0),
                                              child: Text(pastjoblist.companyName!, style: TextStyle(color: ColorManager.black,
                                                  fontFamily: "PoppinsRegular", fontSize: 12),),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        Row(
                                          children: [
                                            Icon(Icons.location_on_sharp,color: ColorManager.grey4,size: 14,),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 8.0),
                                              child: Text(pastjoblist.jobAddress==null ? "Delhi/NCR, Sector-19, Faridabad": pastjoblist.jobAddress!,
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
                                              child: Text("Slot- "+pastjoblist.slot!,
                                                  style: TextStyle(fontFamily: "PoppinsRegular", color: Colors.black87,
                                                    fontSize: 10,)
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        Row(
                                          children: [
                                            Icon(Icons.calendar_today,color: ColorManager.grey4,size: 14,),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 8.0),
                                              child: Text("Working Hours- "+pastjoblist.total_hour.toString()!,
                                                  style: TextStyle(fontFamily: "PoppinsRegular", color: Colors.black87,
                                                    fontSize: 10,)
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 8,),
                                        Row(
                                          children: [
                                            Text("Job status",
                                                style: TextStyle(fontFamily: "PoppinsRegular", color: Colors.black87,
                                                  fontSize: 11,)
                                            ),                              Padding(
                                              padding: const EdgeInsets.only(left: 12.0),
                                              child: Text(pastjoblist.jobStatus!,
                                                  style: TextStyle(fontFamily: "PoppinsRegular", color: Colors.blue,
                                                    fontSize: 10,)
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 5),


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
                  ],
                ),
              ),
            );

        }
    );
  }
}