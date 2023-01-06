import 'dart:developer';
import 'dart:io';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:jobprovider/app/core/utils/app_utils.dart';
import 'package:jobprovider/app/domain/entities/login_response/login_response.dart';
import 'package:jobprovider/app/domain/repository/ilogin_repository.dart';

class LoginRepository extends ILoginRepository {
  @override
  Future<DataState<LoginResponse>> userLogin(String email, String password, String token) async {
    dynamic mhttpResponse;
    try {
      final httpResponse = await CommonRepository.getApiService().userLogin(email, password, token);
      mhttpResponse =httpResponse;
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      }
      return DataFailed (
        DioError (
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
