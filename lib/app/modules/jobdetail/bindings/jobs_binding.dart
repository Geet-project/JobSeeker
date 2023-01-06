import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:jobprovider/app/data/repository/home_repository_impl.dart';
import 'package:jobprovider/app/data/repository/job_repository_impl.dart';
import 'package:jobprovider/app/domain/repository/ihome_repository.dart';
import 'package:jobprovider/app/domain/repository/ijob_repository.dart';
import 'package:jobprovider/app/modules/home/controllers/homecontroller.dart';
import 'package:jobprovider/app/modules/jobdetail/controller/jobs_controller.dart';

class JobDetailBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JobController> (() => JobController(), fenix: true);
    Get.lazyPut<IJobDetailRepository>(() => JobRepository(), fenix: true);
  }
}