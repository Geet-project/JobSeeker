import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:jobprovider/app/data/repository/register_repository_impl.dart';
import 'package:jobprovider/app/domain/repository/iregister_repository.dart';
import 'package:jobprovider/app/modules/signup/controllers/appointment_controller.dart';
import 'package:jobprovider/app/modules/signup/controllers/signup_controller.dart';

class AppointmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppointmentController> (() => AppointmentController());
    Get.lazyPut<IRegisterRepository>(() => RegisterRepository(), fenix: true);
  }
}