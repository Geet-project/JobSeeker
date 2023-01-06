import 'dart:collection';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:jobprovider/app/core/utils/app_utils.dart';
import 'package:jobprovider/app/routes/app_pages.dart';

import '../../../core/utils/shared_preference.dart';
import '../../../domain/entities/login_response/login_data.dart';

class SkillController extends GetxController {

  final skillsList = <String>[].obs;
  final isChecked = <bool>[].obs;
  final selectedSkills = <String>[].obs;
  final firstSkillsMap = <String, bool>{}.obs;
  final selectedSkillsMap = <String, dynamic>{}.obs;
  final skillsMap = <String, bool>{}.obs;
  var loginData = LoginData().obs;
  final Map<String, bool> planets = HashMap(); // Is a HashMap

  @override
  void onInit() {
    super.onInit();
    getSelectedSkills();
    getLoginData();
  }

  getLoginData() async {
    dynamic argumentData = Get.arguments;
    var comeFrom = argumentData[0]['comeFrom'];
    loginData.value = await User_Perference().getUserInfo();
    skillsList.value = loginData.value.skills!;
    for (var i = 0; i < skillsList.value.length; i++) {
      skillsMap[skillsList.value[i]] = true;
    }
    if(comeFrom =="home") {
      for (var i = 0; i < selectedSkillsMap.value.length; i++) {
        skillsMap[selectedSkillsMap.value.keys.elementAt(i)] = selectedSkillsMap.value.values.elementAt(i);
      }
    }
    
  }
  updateCheckboxData(int index, bool value, String skillname) {
    skillsMap[skillname] = value;
    selectedSkillsMap[skillsList[index]] = value;
    update();
  }

  goToNextScreen() {
    User_Perference().saveUserInfo(loginData.value, true);
    User_Perference().saveSelectedSkills(selectedSkillsMap);
    if(!selectedSkillsMap.values.contains(true)) {
      showToastMessage(title: "Skills Error", message: "Please select atleast one skill");
    }else {
      Get.offAllNamed(Routes.HOME, arguments: "skills");
    }
  }

  void getSelectedSkills() async {
    selectedSkillsMap.value = (await User_Perference().getSelectedSkills())!;
    print(selectedSkillsMap.value);
  }




}