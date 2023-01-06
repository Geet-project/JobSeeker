import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:jobprovider/app/data/repository/notification_repository_impl.dart';
import 'package:jobprovider/app/domain/repository/inotification_repository.dart';
import 'package:jobprovider/app/modules/home/controllers/homecontroller.dart';
import 'package:jobprovider/app/modules/notification/controllers/notificationcontroller.dart';

class NotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationController> (() => NotificationController(),fenix: true);
    Get.lazyPut<INotificationRepository>(() => NotificationRepository(), fenix: true);
  }
}