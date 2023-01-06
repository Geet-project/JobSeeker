import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../core/resources/assets_manager.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/widgets/round_button.dart';
import '../../../routes/app_pages.dart';
import '../controllers/homecontroller.dart';

class HomeTab extends GetView<HomeController> {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (controller) {

          return Obx(
                ()=>
                controller.isDataLoading.value ?
                const Center(child: CircularProgressIndicator(),):
                Container(child: SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: BannerCarousel(
                        height: 120,
                        banners: controller.listBanners,
                        activeColor: ColorManager.blueColor,
                        onTap: (id) => print(id),),
                    ),
                    SizedBox(height: 20),
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
                          controller.chooseHomeDate("home");
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
                                Text(controller.homeDate.value==""?"Select Date":controller.homeDate.value, style: TextStyle(color: ColorManager.lightGrey1,
                                    fontFamily: "PoppinsRegular", fontSize: 11),),
                                Icon(Icons.calendar_today, color: ColorManager.lightGrey1,size: 13,)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Obx(
                      ()=>Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                        child: GridView.count(
                          crossAxisCount: 3,
                          childAspectRatio: 0.7,
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          children: List.generate(
                              controller.jobslist.value.length, (index) {
                            final jobs = controller.jobslist.value[index];
                            return InkWell (
                              onTap: () {
                                Get.toNamed(Routes.JOB_DETAIL, arguments: jobs.id.toString()!);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 5.0, top: 10),
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: ColorManager.lightGrey2,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column (
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 60,
                                          child: Text(jobs.companyName==null? "Cleaner Jobs": jobs.companyName!,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: TextStyle(color: ColorManager.black,
                                            fontFamily: "PoppinsRegular", fontSize: 12),),
                                        ),
                                        SizedBox(height: 4,),
                                        Dash(
                                            direction: Axis.horizontal,
                                            length: 80,
                                            dashLength: 2,
                                            dashColor: ColorManager.lightGrey),
                                        SizedBox(height: 5),
                                        Row(
                                          children: [
                                            Icon(CupertinoIcons.briefcase, color: ColorManager.blueColor,
                                              size: 12,),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 3.0),
                                              child: SizedBox(
                                                width: 60,
                                                child: Text(jobs.jobRole!,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                  fontSize: 10,
                                                  color: ColorManager.grey,
                                                  overflow: TextOverflow.ellipsis,
                                                ),),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 3,),
                                        Row(
                                          children: [
                                            Icon(CupertinoIcons.location_solid, color: ColorManager.blueColor,
                                              size: 12,),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 3.0),
                                              child: SizedBox(
                                                width: 60,
                                                child: Text(jobs.jobArea!,
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                  softWrap: false,
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    color: ColorManager.grey
                                                ),),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        Dash(
                                            direction: Axis.horizontal,
                                            length: 80,
                                            dashLength: 2,
                                            dashColor: ColorManager.lightGrey),
                                        SizedBox(height: 5),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("\$"+jobs.payableSalary!, style: TextStyle(color: ColorManager.blueColor,
                                            fontSize: 11, fontWeight: FontWeight.w500),),
                                            Text(jobs.jobType==null? "Part-Time": jobs.jobType!, style: TextStyle(color: ColorManager.grey4,
                                                fontSize: 10),),
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        Text("Avail Opening - "+ jobs.noOfOpening!,
                                          maxLines: 1,
                                          style: TextStyle(color:
                                        ColorManager.grey4, fontSize: 9)),
                                        SizedBox(height: 8,),
                                        Center(
                                          child: CustomButton(textColor: ColorManager.white,firstColor:ColorManager.blueColor ,
                                            secondColor: ColorManager.blueColor, ButtonText: "APPLY",
                                            buttonBottomRightRadius: 30,buttonBottomLeftRadius: 30,buttonTopLeftRadius: 30,buttonTopRightRadius: 30,
                                            ht: 30,wd: 75,textSize: 12,FontFamily: "PoppinsRegular", routeName: AppPages.INITIAL,
                                            borderColor: ColorManager.blueColor ,onCustomButtonPressed: () {
                                              Get.toNamed(Routes.JOB_DETAIL, arguments: jobs.id.toString()!);
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}