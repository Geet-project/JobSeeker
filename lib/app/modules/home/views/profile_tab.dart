import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jobprovider/app/core/resources/assets_manager.dart';
import 'package:jobprovider/app/routes/app_pages.dart';

import '../../../core/resources/color_manager.dart';
import '../controllers/homecontroller.dart';

class ProfileTab extends GetView<HomeController> {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (controller){
          controller.getProfile();
          return Scaffold(
            body: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Center(
                    child: SizedBox(
                      height: 90,
                      width: 90,
                      child: Stack(
                        clipBehavior: Clip.none,
                        fit: StackFit.expand,
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(controller.profileData!.photo!),
                          ),
                          // Positioned(
                          //     bottom: -5,
                          //     right: -30,
                          //     child: RawMaterialButton(
                          //       onPressed: () {},
                          //       elevation: 2.0,
                          //       fillColor: Color(0xFFF5F6F9),
                          //       child: Icon(Icons.camera_alt_outlined, color: Colors
                          //           .blue, size: 12,),
                          //       padding: EdgeInsets.all(5.0),
                          //       shape: CircleBorder(),
                          //     )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(controller.profileData!.name == null ? "" : controller.profileData!.name!,
                    style: TextStyle(fontFamily: "Poppins", fontSize: 16),),
                  SizedBox(height: 6,),
                  Text(controller.profileData!.phone == null ? "" : controller.profileData!.phone!, style: TextStyle(
                      fontFamily: "PoppinsRegular", color: ColorManager.grey4,
                      fontSize: 12),),
                  Text(controller.profileData!.address == null ? "" : controller.profileData!.address!, style: TextStyle(
                      fontFamily: "PoppinsRegular", color: ColorManager.grey4,
                      fontSize: 12),),

                  // Container(
                  //   decoration: BoxDecoration(
                  //     color: ColorManager.white,
                  //     borderRadius: BorderRadius.all(Radius.circular(30)),
                  //     border: Border.all(color: ColorManager.blueColor),
                  //   ),
                  //   child: Padding(
                  //     padding: const EdgeInsets.symmetric(
                  //         horizontal: 25.0, vertical: 8),
                  //     child: Text("Update Profile", style: TextStyle(
                  //         color: ColorManager.blueColor,
                  //         fontFamily: "PoppinsRegular"
                  //     ),),
                  //   ),
                  // ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("About", style: TextStyle(fontFamily: "PoppinsRegular",
                          color: ColorManager.black,),),
                        InkWell(
                            onTap: () {
                              Get.toNamed(Routes.EDIT_ABOUT, arguments: [
                                "about",
                                controller.profileData!.aboutus==null? "": controller.profileData!.aboutus!
                              ]);
                              },
                            child: Icon(Icons.edit, color: ColorManager.blueColor,
                              size: 15,)),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child:
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text( controller.profileData!.aboutus ==null?
                        "":
                        controller.profileData!.aboutus!,
                        style: TextStyle(fontFamily: "PoppinsRegular",
                            color: ColorManager.textColor,
                            fontSize: 11),),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(thickness: 0.5, color: ColorManager.textColor,),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Personal Information", style: TextStyle(
                          fontFamily: "PoppinsRegular",
                          color: ColorManager.black,),),
                        InkWell(
                            onTap: () {
                              Get.toNamed(Routes.EDIT_PERSONAL, arguments: [
                                "personal",
                                controller.profileData!.phone!,
                                controller.profileData!.address==null?"": controller.profileData!.address!
                              ]);
                            },
                            child: Icon(Icons.edit, color: ColorManager.blueColor,
                              size: 15,)),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),

                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.call, color: ColorManager.grey,
                                  size: 12,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text("Mobile No.",
                                    style: TextStyle(
                                        color: ColorManager.textColor,
                                        fontFamily: "PoppinsRegular",
                                        fontSize: 11),),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(controller.profileData!.phone! ==null ? "9987464765": controller.profileData!.phone!, style: TextStyle(
                                  color: ColorManager.black,
                                  fontFamily: "PoppinsRegular", fontSize: 12),),
                            ),
                            SizedBox(height: 15,),
                            Row(
                              children: [
                                Icon(Icons.person, color: ColorManager.grey,
                                  size: 12,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text("Gender",
                                    style: TextStyle(color: ColorManager.textColor,
                                        fontFamily: "PoppinsRegular",
                                        fontSize: 11),),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text("Female", style: TextStyle(
                                  color: ColorManager.black,
                                  fontFamily: "PoppinsRegular", fontSize: 12),),
                            ),

                            SizedBox(height: 15,),
                            Row(
                              children: [
                                Icon(Icons.location_on_sharp, color: ColorManager
                                    .grey,
                                  size: 12,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text("My Location",
                                    style: TextStyle(color: ColorManager.textColor,
                                        fontFamily: "PoppinsRegular",
                                        fontSize: 11),),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: SizedBox(
                                width: 200,
                                child: Text(controller.profileData!.address==null ? "":
                                  controller.profileData!.address!,
                                  style: TextStyle(color: ColorManager.black,
                                      fontFamily: "PoppinsRegular", fontSize: 12),),
                              ),
                            )
                          ],
                        ),
                        Spacer(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.email, color: ColorManager.grey,
                                  size: 12,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text("Email-Id", style: TextStyle(
                                      color: ColorManager.textColor,
                                      fontFamily: "PoppinsRegular",
                                      fontSize: 11),),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: SizedBox(
                                width: 140,
                                child: Text(controller.profileData!.email! ==null ? "": controller.profileData!.email!,
                                  style: TextStyle(color: ColorManager.black,
                                      fontFamily: "PoppinsRegular", fontSize: 12),),
                              ),
                            ),
                            SizedBox(height: 15,),
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_month, color: ColorManager.grey,
                                  size: 12,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text("Date of Birth", style: TextStyle(
                                      color: ColorManager.textColor,
                                      fontFamily: "PoppinsRegular",
                                      fontSize: 11),),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(controller.profileData!.dob ==null ? "": controller.profileData!.dob!,
                                style: TextStyle(color: ColorManager.black,
                                    fontFamily: "PoppinsRegular", fontSize: 12),),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(thickness: 0.5, color: ColorManager.textColor,),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Education", style: TextStyle(
                          fontFamily: "PoppinsRegular",
                          color: ColorManager.black,),),
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Text(controller.profileData!.higherQft!,
                            style: TextStyle(fontFamily: "PoppinsRegular", color:
                            ColorManager.blacklight, fontSize: 12),),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 20.0),
                        //   child: Text("Government Polytechnic Manesar",
                        //     style: TextStyle(fontFamily: "PoppinsRegular", color:
                        //     ColorManager.blacklight,
                        //         fontSize: 11),),
                        // ),
                        // SizedBox(height: 5,),
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 20.0),
                        //   child: Text("2016, Full Time",
                        //     style: TextStyle(fontFamily: "PoppinsRegular", color:
                        //     ColorManager.lightGrey,
                        //         fontSize: 11),),
                        // ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Divider(
                            thickness: 0.5, color: ColorManager.textColor,),
                        ),
                        SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Key Skills", style: TextStyle(
                                fontFamily: "PoppinsRegular",
                                color: ColorManager.black,),),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                          child: GridView.count(
                            crossAxisCount: 4,
                            childAspectRatio: 1.8,
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            children: List.generate(controller.profileData!.skills!.length, (index) {
                              return Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1,
                                        color: ColorManager.lightGrey,
                                      ),
                                      borderRadius: BorderRadius.circular(20.0)
                                    ),
                                    child: Center(
                                      child: Text(controller.profileData!.skills![index],
                                      style: TextStyle(color: ColorManager.lightGrey,
                                      fontSize: 10.0),),
                                    ),
                                  )
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }

    );
  }

}