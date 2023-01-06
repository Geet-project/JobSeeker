import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:jobprovider/app/data/repository/edit_profile_repository_impl.dart';
import 'package:jobprovider/app/modules/edit/controllers/editcontroller.dart';

import '../../../domain/repository/iprofileedit_repository.dart';

class EditBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditController> (() => EditController(), fenix: true);
    Get.lazyPut<IEditProfileRepository>(() => EditProfileRepository(), fenix: true);

  }
}