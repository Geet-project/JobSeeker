import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:jobprovider/app/data/repository/changepassword_repository_impl.dart';
import 'package:jobprovider/app/domain/repository/ichangepassword_repository.dart';

import '../controllers/forgetpasswordcontroller.dart';

class ForgetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IChangePasswordRepository>(() => ChangePasswordRepository());
    Get.lazyPut<ForgetPasswordController> (() => ForgetPasswordController());
  }
}