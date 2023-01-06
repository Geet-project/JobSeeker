import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jobprovider/app/core/resources/color_manager.dart';
import 'package:jobprovider/app/modules/jobs/views/ongoingjob.dart';
import 'package:jobprovider/app/modules/jobs/views/postjob.dart';
import 'package:jobprovider/app/modules/jobs/views/upcomingjobs.dart';

import '../controllers/homecontroller.dart';


class JobsTab extends GetView<HomeController> {
  const JobsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (controller) {
          return Scaffold(
            body: Column(
              children: [
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SizedBox(
                    height: 40,
                    child: TabBar(
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: ColorManager.lightBlue1,
                        border: Border.all(
                          color: ColorManager.blueColor
                        )
                      ),
                      controller: controller.controller,
                      labelPadding: EdgeInsets.symmetric(horizontal: 10),
                      tabs: [
                        Tab(child: Text("Up-Coming", style: TextStyle(color: Colors.black, fontSize: 10))),
                        Tab(child: Text("On-Going", style: TextStyle(color: Colors.black, fontSize: 10))),
                        Tab(child: Text("Past Jobs", style: TextStyle(color: Colors.black, fontSize: 10)))
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Expanded(child: TabBarView(
                  controller: controller.controller,
                  children: [
                    UpcomingJobtab(),
                    OnGoingJobTab(),
                    PostJobTab(),
                  ],
                ))
              ],
            ),
          );
        }
    );
  }
}