import 'dart:convert';

import 'package:jobprovider/app/domain/entities/login_response/login_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User_Perference{

  saveUserInfo(LoginData? userModel, bool isLoggedIn) async{
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (userModel!.id != null) {
      sharedPreferences.setBool("IsUserLoggedIn", isLoggedIn);
      sharedPreferences.setInt('id', userModel.id!);
      sharedPreferences.setString('email', userModel.email!);
      sharedPreferences.setString('phone', userModel.phone!);
      sharedPreferences.setString('name', userModel.name!);
      sharedPreferences.setString('accessToken', userModel.token!);
      sharedPreferences.setString('photo', userModel.photo!);
      sharedPreferences.setStringList("skills", userModel.skills!);
    }
  }

  saveSelectedSkills(Map<String, dynamic>selectedSkills) async{
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String encodedMap = json.encode(selectedSkills);
    sharedPreferences.setString("selectedSkills", encodedMap);
  }

  Future<Map<String, dynamic>?> getSelectedSkills() async{
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? selectedSkills = sharedPreferences.getString("selectedSkills");
    Map<String,dynamic> decodedMap = json.decode(selectedSkills!);
    return decodedMap;
  }


  Future<LoginData> getUserInfo() async
  {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    int? id=sharedPreferences.getInt('id');
    String? email = sharedPreferences.getString('email');
    String? phone = sharedPreferences.getString('phone');
    String? accessToken=sharedPreferences.getString('accessToken');
    String? photo =sharedPreferences.getString('photo');
    String? name =sharedPreferences.getString('name');
    List<String>? skills = sharedPreferences.getStringList("skills");


    return LoginData(
        id: id,
        email: email,
        phone: phone,
        token: accessToken,
        photo: photo,
        name: name,
        skills: skills
    );
  }

  Future<bool> checkUserStatus() async{
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.containsKey("IsUserLoggedIn"))
    {
      return sharedPreferences.getBool("IsUserLoggedIn")!;
    }
    return false;
  }


  Future<String> getUserAccessToken() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? accessToken;
    if(sharedPreferences.containsKey("accessToken"))
    {
      accessToken = sharedPreferences.getString("accessToken");
    }
    return accessToken!;
  }

  Future removeUserInfo() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("IsUserLoggedIn", false);
    sharedPreferences.remove('id');
    sharedPreferences.remove('email');
    sharedPreferences.remove('phone');
    sharedPreferences.remove('accessToken');
    sharedPreferences.remove("selectedSkills");
  }
}