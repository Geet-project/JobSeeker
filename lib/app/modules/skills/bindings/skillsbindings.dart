import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:jobprovider/app/modules/skills/controllers/skillscontroller.dart';


class SkillsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SkillController> (() => SkillController());
  }
}