import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:jobprovider/app/modules/verifyemail/controllers/verifyemailcontroller.dart';

import '../../../data/repository/changepassword_repository_impl.dart';
import '../../../domain/repository/ichangepassword_repository.dart';

class VerifyEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifyEmailController> (() => VerifyEmailController());
    Get.lazyPut<IChangePasswordRepository>(() => ChangePasswordRepository());

  }
}