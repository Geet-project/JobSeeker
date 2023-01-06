import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jobprovider/app/core/resources/color_manager.dart';
import 'package:jobprovider/app/modules/home/controllers/homecontroller.dart';
import 'package:jobprovider/app/modules/home/views/jobs_tab.dart';
import 'package:jobprovider/app/modules/jobdetail/controller/jobs_controller.dart';
import 'package:jobprovider/app/routes/app_pages.dart';
import 'package:retrofit/http.dart';

import '../../../core/resources/assets_manager.dart';


class OnGoingJobTab extends GetView<HomeController>{
  const OnGoingJobTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (controller) {
          return
            controller.isOnGoingDataLoading.value ?
            const Center(child: CircularProgressIndicator(),):
            Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 14, right: 14),
              child:
              Obx(
                ()=> ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemExtent: null,
                  itemCount: controller.ongoingjobList.length,
                  itemBuilder: (BuildContext context, int index){
                    final ongoingjoblist = controller.ongoingjobList.value[index];
                    return InkWell (
                      onTap: () {
                        Get.toNamed(Routes.JOB_DETAIL, arguments: ongoingjoblist.jobid!);
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.home_work_outlined,color: ColorManager.grey4,size: 14,),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 8.0),
                                          child: Text(ongoingjoblist.companyName!, style: TextStyle(color: ColorManager.black,
                                              fontFamily: "Poppins", fontSize: 12),),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Icon(Icons.location_on_sharp,color: ColorManager.grey4,size: 14,),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(ongoingjoblist.jobAddress==null ? "Delhi/NCR, Sector-19, Faridabad": ongoingjoblist.jobAddress!,
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
                                      child: Text("Slot- "+ongoingjoblist.slot!,
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
                                      child: Text("Applied date -"+ ongoingjoblist.appliedDate!,
                                          style: TextStyle(fontFamily: "PoppinsRegular", color: Colors.black87,
                                            fontSize: 10,)
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 15,),
                                InkWell(
                                  onTap: (){
                                    Get.toNamed(Routes.ATTENDANCE, arguments: ongoingjoblist);
                                  },
                                  child: SizedBox(
                                    height: 20,
                                    width: 200,
                                    child: Text("Mark attendance", style: TextStyle(
                                      color: ColorManager.blueColor, decoration: TextDecoration.underline,
                                      fontSize: 13,fontWeight: FontWeight.w700
                                    ),),
                                  ),
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
          );

        }
    );
  }
}