import 'dart:developer';
import 'dart:io';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:jobprovider/app/core/utils/app_utils.dart';
import 'package:jobprovider/app/domain/entities/home_response/HomeResponse.dart';
import 'package:jobprovider/app/domain/entities/job_responses/JobResponses.dart';
import 'package:jobprovider/app/domain/entities/job_responses/upcomingjobs_response.dart';
import 'package:jobprovider/app/domain/entities/login_response/login_response.dart';
import 'package:jobprovider/app/domain/entities/sentemail_response/sentemail_response.dart';
import 'package:jobprovider/app/domain/repository/ihome_repository.dart';
import 'package:jobprovider/app/domain/repository/ilogin_repository.dart';

import '../../domain/repository/ijob_repository.dart';

class JobRepository extends IJobDetailRepository {
  @override
  Future<DataState<JobDetailResponse>> getJobDetail(String token, String jobid) async {
    try {
      final httpResponse = await CommonRepository.getApiService().getJobDetail(token, jobid);
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
  Future<DataState<SentEmailResponse>> applyJob(String token, String jobid) async {
    try {
      final httpResponse = await CommonRepository.getApiService().applyJob(token, jobid);
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
