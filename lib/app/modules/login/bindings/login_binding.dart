import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:jobprovider/app/data/repository/login_repository_impl.dart';
import 'package:jobprovider/app/domain/repository/ilogin_repository.dart';
import 'package:jobprovider/app/modules/login/controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ILoginRepository>(() => LoginRepository(), fenix: true);
    Get.lazyPut<LoginController> (() => LoginController(), fenix: true);
  }
}