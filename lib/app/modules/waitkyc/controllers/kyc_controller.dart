import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class KycController extends GetxController {
  dynamic argumentData;

  @override
  void onInit() {
    super.onInit();
    argumentData = Get.arguments;
    print(argumentData);
  }
}