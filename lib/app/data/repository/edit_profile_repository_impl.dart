import 'dart:developer';
import 'dart:io';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:jobprovider/app/core/utils/app_utils.dart';
import 'package:jobprovider/app/domain/entities/login_response/login_response.dart';
import 'package:jobprovider/app/domain/entities/profile_response/update_profile_response.dart';
import 'package:jobprovider/app/domain/entities/profile_response/viewprofile_response.dart';
import 'package:jobprovider/app/domain/entities/sentemail_response/sentemail_response.dart';
import 'package:jobprovider/app/domain/repository/ichangepassword_repository.dart';
import 'package:jobprovider/app/domain/repository/ilogin_repository.dart';
import 'package:jobprovider/app/domain/repository/iprofileedit_repository.dart';

class EditProfileRepository extends IEditProfileRepository {
  @override
  Future<DataState<UpdateProfileResponse>> editAbout(String token,String about) async {
    try {
      final httpResponse = await CommonRepository.getApiService().updateAboutProfile(token, about);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      }
      return DataFailed(
        DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
          type: DioErrorType.response,
        ),
      );
    } on DioError catch (e) {
      log("DioError ${e.response.toString()}");
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<UpdateProfileResponse>> editPersonalInfo(String token, String phone, String address) async {
    try {
      final httpResponse = await CommonRepository.getApiService().updatePersonalInfo(token, phone, address);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      }
      return DataFailed(
        DioError(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          requestOptions: httpResponse.response.requestOptions,
          type: DioErrorType.response,
        ),
      );
    } on DioError catch (e) {
      log("DioError ${e.response.toString()}");
      return DataFailed(e);
    }
  }

}
