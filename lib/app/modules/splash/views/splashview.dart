
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/resources/assets_manager.dart';
import '../../../core/resources/color_manager.dart';
import '../controller/splashcontroller.dart';



class SplashView extends GetView<SplashController>{
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      body: Container(
        width: controller.displayWidth(context),
        height: controller.displayHeight(context),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageAssets.splashbg),
              fit: BoxFit.fill,
            ),
        ),
        child:
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage(ImageAssets.applogo),
                width: 80),
              SizedBox(height: 15,),
              Image(image: AssetImage(ImageAssets.fastapplogo),
                width: 110),
            ]
        ),
      ),
    );
  }

}