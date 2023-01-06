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
import 'package:jobprovider/app/domain/repository/iattendance_repository.dart';
import 'package:jobprovider/app/domain/repository/ichangepassword_repository.dart';
import 'package:jobprovider/app/domain/repository/ilogin_repository.dart';

class AttendanceRepository extends IAttendanceRepository {
  @override
  Future<DataState<SentEmailResponse>> markAttendance(String token,
      int appliedjobid, int isPresent, String lat, String long) async {
    try {
      final httpResponse =
      await CommonRepository.getApiService().markAttedance(
          token, appliedjobid, isPresent, lat , long);
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
