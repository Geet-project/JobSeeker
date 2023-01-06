import 'dart:developer';
import 'dart:io';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:jobprovider/app/core/utils/app_utils.dart';
import 'package:jobprovider/app/domain/entities/home_response/HomeResponse.dart';
import 'package:jobprovider/app/domain/entities/login_response/login_response.dart';
import 'package:jobprovider/app/domain/entities/profile_response/viewprofile_response.dart';
import 'package:jobprovider/app/domain/entities/sentemail_response/sentemail_response.dart';
import 'package:jobprovider/app/domain/repository/ihome_repository.dart';
import 'package:jobprovider/app/domain/repository/ilogin_repository.dart';

import '../../domain/entities/job_responses/upcomingjobs_response.dart';
import '../../domain/entities/payment_response/payment_response.dart';

class HomeRepository extends IHomeRepository {
  @override
  Future<DataState<HomeResponse>> getHomeData(String token, String date,String skills) async {
    try {
      final httpResponse = await CommonRepository.getApiService().getHomeData(token, date,skills);
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
  Future<DataState<UpcomingJobResponse>> ongoingjobs(String token) async {
    try {
      final httpResponse = await CommonRepository.getApiService().getOnGoingJobList(token);
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
  Future<DataState<UpcomingJobResponse>> pastjobs(String token, String date) async {
    try {
      final httpResponse = await CommonRepository.getApiService().getPastJobList(token, date);
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
  Future<DataState<UpcomingJobResponse>> upcomingJobs(String token, String date) async {
    try {
      final httpResponse = await CommonRepository.getApiService().getUpcomingJobList(token, date);
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
  Future<DataState<ViewProfileResponse>> getProfile(String token) async {
    try {
      final httpResponse =
          await CommonRepository.getApiService().getProfile(token);
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
  Future<DataState<SentEmailResponse>> deleteJob(String token, int jobid) async {
    try {
      final httpResponse =
          await CommonRepository.getApiService().deleteJob(token, jobid);
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
  Future<DataState<PaymentViewResponse>> viewPaymentData(String from_date, to_date, String token) async {
    try {
      final httpResponse = await CommonRepository.getApiService().getPaymentData(token,from_date, to_date);
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
