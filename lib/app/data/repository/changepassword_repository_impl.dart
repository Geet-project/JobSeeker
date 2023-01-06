import 'dart:developer';
import 'dart:io';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:jobprovider/app/core/utils/app_utils.dart';
import 'package:jobprovider/app/domain/entities/login_response/login_response.dart';
import 'package:jobprovider/app/domain/entities/sentemail_response/sentemail_response.dart';
import 'package:jobprovider/app/domain/repository/ichangepassword_repository.dart';
import 'package:jobprovider/app/domain/repository/ilogin_repository.dart';

class ChangePasswordRepository extends IChangePasswordRepository {
  @override
  Future<DataState<SentEmailResponse>> sentEmail(String email) async {
    try {
      final httpResponse =
          await CommonRepository.getApiService().sentEmail(email);
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
  Future<DataState<SentEmailResponse>> verifyOtp(String email, String otp)async {
    try {
      final httpResponse =
          await CommonRepository.getApiService().verifyOtp(email, otp);
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
  Future<DataState<SentEmailResponse>> changePassword(String email, String otp, String password, String confrim_password)async {
    try {
      final httpResponse =
      await CommonRepository.getApiService().changePassword(email, otp,password, confrim_password);
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
  Future<DataState<SentEmailResponse>> usingTokenChangePassword(String token, String password, String confirmpssword) async {
    try {
      final httpResponse =
          await CommonRepository.getApiService().usingTokenChangePassword(token,password, confirmpssword);
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
