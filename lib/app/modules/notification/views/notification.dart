import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jobprovider/app/core/resources/assets_manager.dart';
import 'package:jobprovider/app/core/resources/color_manager.dart';
import 'package:jobprovider/app/modules/home/controllers/homecontroller.dart';
import 'package:jobprovider/app/modules/home/views/jobs_tab.dart';
import 'package:jobprovider/app/modules/notification/controllers/notificationcontroller.dart';


class NotificationScreen extends GetView<NotificationController>{
  const NotificationScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotificationController>(
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
                title: Text("Notifications", style: TextStyle(fontFamily: "Poppins", fontSize: 13,
                color: ColorManager.black),),
              ),
            ),
            body: SingleChildScrollView(
              child: Obx(
                    ()=>
                controller.isDataLoading.value ?
                SizedBox(
                  height: 300,
                  child: Center(
                      child: CircularProgressIndicator()
                  ),
                ):
                controller.notiList.length>0 ?
                Column(
                  children: [
                    SizedBox(height: 10),
                    SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: ListView.builder(
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemExtent: null,
                        itemCount: controller.notiList.length,
                        itemBuilder: (BuildContext context, int index) {
                          final notificationList = controller.notiList.value[index];
                          return Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        notificationList.is_read ==0?Icon(Icons.circle, color: ColorManager.darkBlue,size: 12,):
                                        Container(),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10.0),
                                          child: SizedBox(
                                            width: 230,
                                            child: Text(
                                              notificationList.title!,
                                              softWrap: false,
                                              maxLines: 2,
                                              style: TextStyle(color: ColorManager.black,
                                              overflow: TextOverflow.clip,
                                                fontFamily: "Poppins", ),),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(controller.dateFormat(notificationList.createdAt.toString()!), style: TextStyle(fontFamily: "PoppinsRegular",
                                    fontSize: 10),)
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text(notificationList.description!,
                                    softWrap: false,
                                    maxLines: 2,
                                  style: TextStyle(fontFamily: "PoppinsRegular",
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 12),),
                                ),
                                SizedBox(height: 8,),
                                Center(
                                  child: Dash(
                                      direction: Axis.horizontal,
                                      length: 140,
                                      dashLength: 3,
                                      dashColor: ColorManager.lightGrey),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ):
                Column(
                  children: [
                    SizedBox(height: 300,),
                    Center(
                      child: Text("Unable to get notifications", style: TextStyle(
                        fontFamily: "PoppinsRegular", fontSize: 12
                      ),),
                    )
                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}