

import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:jobprovider/app/domain/entities/login_response/login_response.dart';
import 'package:jobprovider/app/domain/entities/notification_response/notification_response.dart';
import 'package:jobprovider/app/domain/entities/register_response/BasicRegisterResponse.dart';
import 'package:jobprovider/app/domain/entities/register_response/RegisterResponse.dart';

import '../../core/utils/app_utils.dart';

abstract class INotificationRepository {
  Future<DataState<NotificationResponse>> getNotification(String token);
}
