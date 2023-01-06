import 'package:get/get.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../data/datasources/remote/app_apis.dart';

showToastMessage({required String title, required String message, Color bColor=Vx.blue400}) {
  Get.snackbar(title, message,
      duration: const Duration(seconds: 2),
      backgroundColor: bColor,
      colorText: Vx.white);
}

abstract class DataState<T> {
  final T? data;
  final DioError? error;

  const DataState({  this.data,  this.error});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  DataFailed(DioError error) : super(error: error) {
    debugPrint("error $error");
  }
}

class CommonRepository {
  static AppApis _apiService = AppApis(getDio());

  static AppApis getApiService() {
    return _apiService;
  }

  static setApiService() {
    _apiService = AppApis(getDio());
  }

  static Dio getDio() {
    return Dio(
      BaseOptions(
        contentType: 'application/json',
      ),
    );
  }
}
