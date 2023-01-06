import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jobprovider/app/core/resources/assets_manager.dart';
import 'package:jobprovider/app/core/resources/color_manager.dart';
import 'package:jobprovider/app/modules/home/controllers/homecontroller.dart';
import 'package:jobprovider/app/modules/home/views/jobs_tab.dart';
import 'package:jobprovider/app/modules/notification/controllers/notificationcontroller.dart';

import '../../../routes/app_pages.dart';


class PaymentScreen extends GetView<HomeController>{
  const PaymentScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (controller) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Obx(
                  ()=> Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Text("Job Calendar", style: TextStyle(
                            color: ColorManager.blacklight, fontFamily: "PoppinsMedium",
                            fontSize: 14,fontWeight: FontWeight.bold
                        ),),
                        SizedBox(height: 20),
                        Text("Select Date (MM/DD/YYYY)", style: TextStyle(
                          color: ColorManager.grey, fontFamily: "PoppinsMedium",
                          fontSize: 13
                        ),),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: InkWell(
                                  onTap: (){
                                    controller.chooseDate("from");
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
                                          Text(controller.fromDate.value, style: TextStyle(color: ColorManager.lightGrey1,
                                          fontFamily: "PoppinsRegular", fontSize: 11),),
                                          Icon(Icons.calendar_today, color: ColorManager.lightGrey1,size: 13,)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: InkWell(
                                  onTap: (){
                                    controller.chooseDate("to");
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
                                          Text(controller.toDate.value, style: TextStyle(color: ColorManager.lightGrey1,
                                              fontFamily: "PoppinsRegular", fontSize: 11),),
                                          Icon(Icons.calendar_today, color: ColorManager.lightGrey1,size: 13,)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 20,),
                        controller.isPaymentDataLoading.value ?
                        const Center(child: CircularProgressIndicator(),):
                        ListView.builder(
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          itemExtent: null,
                          itemCount: controller.paymentDataList.length,
                          itemBuilder: (BuildContext context, int index){
                            final paymentitemList = controller.paymentDataList.value[index];
                            return InkWell(
                              onTap: () {
                                Get.toNamed(Routes.JOB_DETAIL, arguments: paymentitemList.id!);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8.0),
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
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(paymentitemList.jobRole!, style: TextStyle(color: ColorManager.black,
                                                fontWeight: FontWeight.bold, fontFamily: "Poppins", fontSize: 12),),
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Icon(Icons.home_work_outlined,color: ColorManager.grey4,size: 14,),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 8.0),
                                              child: Text(paymentitemList.companyName!,
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
                                              child: SizedBox(
                                                width: 200,
                                                child: Text(paymentitemList.jobArea==null ? "Delhi/NCR, Sector-19, Faridabad": paymentitemList.jobArea!,
                                                    style: TextStyle(fontFamily: "PoppinsRegular", color: Colors.black87,
                                                      fontSize: 10,)
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          children: [
                                            Text("Total Hours: ", style: TextStyle(color: ColorManager.black, fontSize: 11),),
                                            Text(paymentitemList.hours.toString(), style: TextStyle(color: ColorManager.black, fontSize: 11),),
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        Row(
                                          children: [
                                            Text("Total Earnings: ", style: TextStyle(color: ColorManager.black, fontSize: 11),),
                                            Text(paymentitemList.wages.toString(), style: TextStyle(color: ColorManager.black, fontSize: 11),),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),

                        // Container(
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(10.0),
                        //     color: ColorManager.white
                        //   ),
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(10.0),
                        //     child: Column(
                        //       children: [
                        //         Row(
                        //           children: [
                        //             Text("Total earning -", style: TextStyle(color: ColorManager.black,
                        //                 fontFamily: "PoppinsRegular", fontSize: 12),
                        //             ),
                        //             Padding(
                        //               padding: const EdgeInsets.only(left: 8.0),
                        //               child: Text(controller.paymentViewData.value.data!.totalEarning==null ? "\$0.00": "\$"+controller.paymentViewData.value.data!.totalEarning!, style: TextStyle(color: ColorManager.darkGreen,
                        //                   fontFamily: "PoppinsRegular", fontSize: 12),
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //         SizedBox(height: 10,),
                        //         Row(
                        //           children: [
                        //             Text("Total paid payment -", style: TextStyle(color: ColorManager.black,
                        //                 fontFamily: "PoppinsRegular", fontSize: 12),
                        //             ),
                        //             Padding(
                        //               padding: const EdgeInsets.only(left: 8.0),
                        //               child: Text(controller.paymentViewData.value.data!.totalPaid==null ? "\$0.00": "\$"+controller.paymentViewData.value.data!.totalPaid!, style: TextStyle(color: ColorManager.darkGreen,
                        //                   fontFamily: "PoppinsRegular", fontSize: 12),
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //         SizedBox(height: 10,),
                        //         Row(
                        //           children: [
                        //             Text("Due payment -", style: TextStyle(color: ColorManager.black,
                        //                 fontFamily: "PoppinsRegular", fontSize: 12),
                        //             ),
                        //             Padding(
                        //               padding: const EdgeInsets.only(left: 8.0),
                        //               child: Text(controller.paymentViewData.value.data!.remaing==null ? "\$0.00": "\$"+controller.paymentViewData.value.data!.remaing!, style: TextStyle(color: ColorManager.redColor,
                        //                   fontFamily: "PoppinsRegular", fontSize: 12),
                        //               ),
                        //             ),
                        //           ],
                        //         )
                        //       ],
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ),
              )
            ),
          );
        }
    );
  }
}