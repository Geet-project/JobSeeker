import 'dart:developer';
import 'dart:io'as io;
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobprovider/app/core/constants/app_constants.dart';
import 'package:jobprovider/app/core/utils/app_utils.dart';
import 'package:jobprovider/app/domain/entities/dropdown_responses/higher_qualification_response.dart';
import 'package:jobprovider/app/domain/entities/dropdown_responses/state_responses.dart';
import 'package:jobprovider/app/domain/entities/login_response/login_response.dart';
import 'package:jobprovider/app/domain/entities/register_response/BasicRegisterResponse.dart';
import 'package:jobprovider/app/domain/entities/register_response/RegisterResponse.dart';
import 'package:jobprovider/app/domain/entities/time_slot_responses/timeslot_response.dart';
import 'package:jobprovider/app/domain/repository/ilogin_repository.dart';
import 'package:jobprovider/app/domain/repository/iregister_repository.dart';

class RegisterRepository extends IRegisterRepository {
  @override
  Future<DataState<RegisterResponse>> userRegister(String email, String password, String confirm_password) async {
    try {
      final httpResponse = await CommonRepository.getApiService().userRegister(email, password,confirm_password );
      if (httpResponse.response.statusCode == io.HttpStatus.ok) {
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
  Future<DataState<BasicRegisterResponse>> userSaveBasicInfo(String token,String name, String dob, String gender, String phone, String city,
      String higherQft) async {
    try {
      final httpResponse =
          await CommonRepository.getApiService().userSaveBasicInfo(token,name, dob,gender, phone, city, higherQft );
      if (httpResponse.response.statusCode == io.HttpStatus.ok) {
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
  Future<BasicRegisterResponse> appoinmentData(String token, String date,filePath , time)async {
    try {
      var formData;
      if(filePath!=null){
        formData= FormData.fromMap( {
          "photo" : await MultipartFile.fromFile(filePath,
              filename: filePath
                  .split('/')
                  .last),
          "date": date,
          "time": time
        });
      }

      Response response = await Dio().post( serverBaseUrl+ "api/appoinment",
          data: formData,options: Options(headers:{
            'Authorization': 'Bearer $token',
            'Content-type': 'multipart/form-data',
            'Accept': 'application/json'}));
      print(response.toString());
      if (response.statusCode == 200) {
        BasicRegisterResponse basicRegisterResponse = BasicRegisterResponse.fromJson(response.data);
        return basicRegisterResponse;
      } else {
        throw Exception('Failed to Register: ${response.data}');
      }

    } on SocketException catch (e) {
      throw e;
    } on HttpException catch(e) {
      throw e;
    } on FormatException catch (e) {
      throw e;
    }
    // try {
    //   final httpResponse = await CommonRepository.getApiService().appoinmentData(token,date,photo);
    //   if (httpResponse.response.statusCode == io.HttpStatus.ok) {
    //     return DataSuccess(httpResponse.data);
    //   }
    //   return DataFailed(
    //     DioError(
    //       error: httpResponse.response.statusMessage,
    //       response: httpResponse.response,
    //       requestOptions: httpResponse.response.requestOptions,
    //       type: DioErrorType.response,
    //     ),
    //   );
    // } on DioError catch (e) {
    //   log("DioError ${e.response.toString()}");
    //   return DataFailed(e);
    // }
  }

  @override
  Future<DataState<HigherQualificationResponse>> gethQftData(String type) async {
    try {
      final httpResponse = await CommonRepository.getApiService().getHqftData(type);
      if (httpResponse.response.statusCode == io.HttpStatus.ok) {
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
  Future<DataState<TimeSlotResponse>> getTimeSlots() async {
    try {
      final httpResponse = await CommonRepository.getApiService().getTimeSlots();
      if (httpResponse.response.statusCode == io.HttpStatus.ok) {
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
  Future<DataState<StateResponse>> getstates() async {
    try {
      final httpResponse = await CommonRepository.getApiService().getStates();
      if (httpResponse.response.statusCode == io.HttpStatus.ok) {
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
