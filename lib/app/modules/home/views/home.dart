import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:jobprovider/app/core/resources/assets_manager.dart';
import 'package:jobprovider/app/core/utils/shared_preference.dart';
import 'package:jobprovider/app/core/widgets/custom_textfield.dart';
import 'package:jobprovider/app/modules/home/controllers/homecontroller.dart';
import 'package:jobprovider/app/modules/home/views/jobs_tab.dart';
import 'package:jobprovider/app/modules/home/views/profile_tab.dart';
import 'package:jobprovider/app/modules/login/controllers/login_controller.dart';
import 'package:jobprovider/app/modules/payment/views/payment_history.dart';

import '../../../core/resources/color_manager.dart';
import '../../../core/widgets/round_button.dart';
import '../../../routes/app_pages.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';

import 'home_tab.dart';

class HomeScreen extends GetView<HomeController>{
  const HomeScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final bottomBarPages = [
      const HomeTab(),
      const JobsTab(),
      const PaymentScreen(),
      const ProfileTab(),
    ];
    return GetBuilder<HomeController>(
        builder: (controller)  {
          return SafeArea(
            child: Scaffold(
              key: controller.scaffoldKey,
              appBar: AppBar(
                systemOverlayStyle: SystemUiOverlayStyle(
                  // Status bar color
                  statusBarColor: Colors.white,
                  // Status bar brightness (optional)
                  statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
                  statusBarBrightness: Brightness.light, // For iOS (dark icons)
                ),
                elevation: 0,
                backgroundColor: ColorManager.white,
                title: Image(image: AssetImage(
                  ImageAssets.fastracklogo
                ), width:100),
                leading: IconButton(
                  onPressed: () {
                    controller.scaffoldKey.currentState!.openDrawer(); // left side
                  },
                  icon: Image.asset(
                    ImageAssets.drawericon,
                    fit: BoxFit.cover,
                    width: 20,
                    height: 20,
                  ),
                ),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.notifications_none,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.NOTIFICATION);
                    },
                  )
                ],
              ),
              drawer: ClipRRect(
                borderRadius: BorderRadius.only(topRight: Radius.circular(40), bottomRight: 
                Radius.circular(40)),
                child: Drawer(
                  child: Column(
                    children: [
                      Obx(
                        () => DrawerHeader(
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Image.network(
                                    controller.loginData.value!.photo ==null?
                                    "https://picsum.photos/250?image=9": controller.loginData.value!.photo!, height: 80, width: 80,
                                    fit: BoxFit.cover,),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(controller.loginData.value!.name==null ? "": controller.loginData.value!.name! , style: TextStyle(color: ColorManager.blacklight,
                                      fontFamily: "Poppins"),),
                                      SizedBox(height: 3),
                                      SizedBox(
                                        child: Text(controller.loginData.value!.email ==null ? "": controller.loginData.value!.email!,
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: false,
                                        style: TextStyle(color: ColorManager.blacklight,
                                        fontFamily: "PoppinsRegular", fontSize: 11),),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.person_outline, color: ColorManager.blueColor),
                        title: Text("Profile"),
                        onTap: () {
                          controller.changeTabIndex(3);
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.work, color: ColorManager.blueColor),
                        title: Text("Update Skills"),
                        onTap: () {
                          Get.toNamed(Routes.SKILL,arguments: [{"comeFrom": "home"}]);
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.work_history_outlined, color: ColorManager.blueColor),
                        title: Text("My Job"),
                        onTap: () {
                          controller.changeTabIndex(1);
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.payments_outlined, color: ColorManager.blueColor),
                        title: Text("Job Calendar"),
                        onTap: () {
                          controller.changeTabIndex(2);
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.change_circle_outlined, color: ColorManager.blueColor),
                        title: Text("Change Password"),
                        onTap: () {
                          Get.toNamed(Routes.CREATE_PASSWORD, arguments: [
                            {"comefrom": "TokenPassword"}
                          ]);
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.info_outline, color: ColorManager.blueColor),
                        title: Text("About"),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.policy_outlined, color: ColorManager.blueColor),
                        title: Text("Privacy Policy"),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.logout, color: ColorManager.blueColor),
                        title: Text("Log Out"),
                        onTap: () {
                          Navigator.pop(context);
                          controller.userLogOut(context);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              body: DoubleBackToCloseApp(
                snackBar: const SnackBar(
                  content: Text('Tap back again to leave'),
                ),
                child: IndexedStack (
                  index: controller.tabIndex.value,
                  children: bottomBarPages,
                ),
              ),
              bottomNavigationBar: Obx(
                    () => Container(
                  decoration : BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow (
                        blurRadius: 20,
                        color: Colors.black.withOpacity(.1),
                      )
                    ],
                  ),
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                      child: GNav(
                        rippleColor: ColorManager.white,
                        hoverColor: ColorManager.white,
                        gap: 8,
                        activeColor: ColorManager.white,
                        iconSize: 24,
                        padding :  EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        duration: Duration(milliseconds: 400),
                        tabBackgroundColor: ColorManager.white,
                        color: Colors.black,
                        tabs: [
                          GButton(
                            icon: CupertinoIcons.home,
                            iconColor: ColorManager.grey4,
                            iconActiveColor: ColorManager.blueColor,
                          ),
                          GButton(
                            icon: CupertinoIcons.briefcase,
                            iconActiveColor: ColorManager.blueColor,
                            iconColor: ColorManager.grey4,
                          ),
                          GButton(
                            icon: Icons.payments_outlined,
                            iconActiveColor: ColorManager.blueColor,
                            iconColor: ColorManager.grey4,
                          ),
                          GButton(
                            icon: CupertinoIcons.person,
                            iconActiveColor: ColorManager.blueColor,
                            iconColor: ColorManager.grey4,
                          )
                        ],
                        selectedIndex: controller.tabIndex.value ,
                        onTabChange: (index) {
                          controller.changeTabIndex(index);
                        },
                      ),
                    ),
                  ),
                ),

              ),

            ),
          );
        }
    );
  }

}