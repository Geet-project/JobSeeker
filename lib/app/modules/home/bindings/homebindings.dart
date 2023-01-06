import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:jobprovider/app/data/repository/home_repository_impl.dart';
import 'package:jobprovider/app/domain/repository/ihome_repository.dart';
import 'package:jobprovider/app/modules/home/controllers/homecontroller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController> (() => HomeController(), fenix: true);
    Get.lazyPut<IHomeRepository>(() => HomeRepository(), fenix: true);

  }
}