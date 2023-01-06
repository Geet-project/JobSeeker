import 'dart:developer';
import 'dart:io';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:jobprovider/app/core/utils/app_utils.dart';
import 'package:jobprovider/app/domain/entities/home_response/HomeResponse.dart';
import 'package:jobprovider/app/domain/entities/login_response/login_response.dart';
import 'package:jobprovider/app/domain/entities/notification_response/notification_response.dart';
import 'package:jobprovider/app/domain/entities/register_response/RegisterResponse.dart';
import 'package:jobprovider/app/domain/repository/ihome_repository.dart';
import 'package:jobprovider/app/domain/repository/ilogin_repository.dart';
import 'package:jobprovider/app/domain/repository/inotification_repository.dart';

class NotificationRepository extends INotificationRepository {

  @override
  Future<DataState<NotificationResponse>> getNotification(String token) async {
    try {
      final httpResponse = await CommonRepository.getApiService().getNotification(token);
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
