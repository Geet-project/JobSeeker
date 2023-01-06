import 'dart:developer';

import 'package:banner_carousel/banner_carousel.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:jobprovider/app/core/resources/assets_manager.dart';
import 'package:jobprovider/app/core/utils/app_utils.dart';
import 'package:jobprovider/app/domain/entities/home_response/HomeResponse.dart' as home;
import 'package:jobprovider/app/domain/entities/login_response/login_data.dart';
import 'package:jobprovider/app/domain/entities/payment_response/payment_response.dart';
import 'package:jobprovider/app/domain/entities/profile_response/viewprofile_response.dart';
import 'package:jobprovider/app/domain/entities/sentemail_response/sentemail_response.dart';
import 'package:jobprovider/app/domain/repository/ihome_repository.dart';

import '../../../core/notificationservice/local_notification_service.dart';
import '../../../core/utils/shared_preference.dart';
import '../../../core/widgets/build_dialog_indicator.dart';
import '../../../domain/entities/job_responses/upcomingjobs_response.dart' as upcoming;
import '../../../domain/repository/ijob_repository.dart';
import '../../../routes/app_pages.dart';


import 'package:get/get.dart';

class HomeController extends FullLifeCycleController with GetSingleTickerProviderStateMixin,WidgetsBindingObserver {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'LEFT'),
    Tab(text: 'RIGHT'),
  ];
  var scaffoldKey = new GlobalKey<ScaffoldState>();
  home.HomeData? homeData;
  final IHomeRepository homeRepository = Get.find();
  var isDataLoading = false.obs;
  var isUpcomigDataLoading = false.obs;
  var isOnGoingDataLoading = false.obs;
  var isPastJobDataLoading = false.obs;
  var isProfileDataLoading = false.obs;
  var isPaymentDataLoading = false.obs;
  final listBanners = <BannerModel>[].obs;
  final bannerList= <home.Banner>[].obs;
  var jobslist = <home.Job>[].obs;
  var tabIndex=0.obs;
  var loginData = LoginData().obs;
  final upcomingjobList = <upcoming.Datum>[].obs;
  final ongoingjobList = <upcoming.Datum>[].obs;
  final pastjobList = <upcoming.Datum>[].obs;
  final paymentDataList = <Datum>[].obs;
  ProfileData? profileData;
  var paymentViewData = PaymentViewResponse().obs;
  var fromDate = "From Date".obs;
  var dateFormat = DateFormat("yyyy-MM-dd");
  var homeDate ="".obs;
  var upcomingJobDate = "".obs;
  var pastJobDate = "".obs;
  var toDate = "To Date".obs;
  TextEditingController fromDateController = TextEditingController();
  final GlobalKey<FormState>fromkey = GlobalKey<FormState>();
  TextEditingController toDateController = TextEditingController();
  late TabController controller ;
  final selectedSkillsMap = <String, dynamic>{}.obs;
  final list = <String>[].obs;

  void changeTabIndex(int index) {
    tabIndex.value= index;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getFirebaseMessage();
    getHomeData();
    getLoginData();
    getUpcomingJob();
    getOnGoingJob();
    getPastJobs();
    getProfile();
    getPaymentData();
    tabControllerInitiailize();
    homeDate.value = dateFormat.format(DateTime.now());
    upcomingJobDate.value = dateFormat.format(DateTime.now());
    pastJobDate.value = dateFormat.format(DateTime.now());
  }


  void tabControllerInitiailize() {
    controller = TabController(vsync: this, length: 3);
  }

  @override
  void onClose() {
    super.onClose();
  }

  void userLogOut(BuildContext context) {
    CoolAlert.show (
        context: context,
        type: CoolAlertType.confirm,
        text: 'You want to logout?',
        confirmBtnText: 'Yes',
        cancelBtnText: 'No',
        confirmBtnColor: Colors.green,
        onCancelBtnTap: (){
          Navigator.pop(context);
        },
        onConfirmBtnTap: () {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Logout successfully")
          ));
          User_Perference().removeUserInfo();
          Get.offAllNamed(Routes.LOGIN);
        }
    );
  }

  Size displaySize(BuildContext context) {
    debugPrint('Size = ' + MediaQuery.of(context).size.toString());
    return MediaQuery.of(context).size;
  }
  double displayWidth(BuildContext context) {
    debugPrint('Width = ' + displaySize(context).width.toString());
    return displaySize(context).width;
  }

  getHomeData() async {
    try {
      isDataLoading.value = true;
      var token =  await User_Perference().getUserAccessToken();
      selectedSkillsMap.value = (await User_Perference().getSelectedSkills())!;
      for(var i =0 ; i<selectedSkillsMap.length;i++){
        if(selectedSkillsMap.value.values.elementAt(i) == true){
          list.value.add(selectedSkillsMap.value.keys.elementAt(i));
        }
      }
      print(list);
      print(list.toString());
      homeData = (await homeRepository.getHomeData("Bearer "+token, homeDate.value,list.toString())).data?.data;
      Get.back();
      bannerList.clear();
      if (homeData!=null) {
        isDataLoading.value = false;
        bannerList.value = homeData!.banner!;
        jobslist.value = homeData!.job!;
        for (var i = 0; i < bannerList.length; i++) {
          final banneritem = bannerList.value[i];
          BannerModel bannerModel = BannerModel(imagePath: banneritem.image!, id: i.toString());
          listBanners.add(bannerModel);
        }
        update();
      } else {
        isDataLoading.value = false;
      }
    } catch (e) {
      log("e $e");
      Get.back();
    }
  }

  getLoginData() async {
    loginData.value = await User_Perference().getUserInfo();
  }

  getUpcomingJob() async {
    try {
      isUpcomigDataLoading.value = true;
      var token =  await User_Perference().getUserAccessToken();
      upcoming.UpcomingJobResponse upcomingJobResponse = (await homeRepository.upcomingJobs("Bearer "+token, upcomingJobDate.value)).data!;
      if (upcomingJobResponse!=null) {
        isUpcomigDataLoading.value = false;
        upcomingjobList.value = upcomingJobResponse!.data!;
        update();
      } else {
        isUpcomigDataLoading.value = false;

      }
    } catch (e) {
      log("e $e");
      Get.back();
    }
  }

  getOnGoingJob() async {
    try {
      isOnGoingDataLoading.value = true;
      var token =  await User_Perference().getUserAccessToken();
      upcoming.UpcomingJobResponse upcomingJobResponse = (await homeRepository.ongoingjobs("Bearer "+token)).data!;
      if (upcomingJobResponse!=null) {
        isOnGoingDataLoading.value = false;
        ongoingjobList.value = upcomingJobResponse!.data!;
        update();
      } else {
        isOnGoingDataLoading.value = false;

      }
    } catch (e) {
      log("e $e");
      Get.back();
    }
  }

  getPastJobs() async {
    try {
      isPastJobDataLoading.value = true;
      var token =  await User_Perference().getUserAccessToken();
      upcoming.UpcomingJobResponse upcomingJobResponse = (await homeRepository.pastjobs("Bearer "+token, pastJobDate.value)).data!;
      if (upcomingJobResponse!=null) {
        isPastJobDataLoading.value = false;
        pastjobList.value = upcomingJobResponse!.data!;
        update();
      } else {
        isPastJobDataLoading.value = false;

      }
    } catch (e) {
      log("e $e");
      Get.back();
    }
  }

  getProfile() async {
    try {
      isProfileDataLoading.value = true;
      var token =  await User_Perference().getUserAccessToken();
      ViewProfileResponse viewProfileResponse = (await homeRepository.getProfile("Bearer "+token)).data!;
      if (viewProfileResponse!=null) {
        isProfileDataLoading.value = false;
        profileData = viewProfileResponse. data;
        update();
      } else {
        isPastJobDataLoading.value = false;
      }
    } catch (e) {
      log("e $e");
      Get.back();
    }
  }

  getPaymentData() async {
    try {
      isPaymentDataLoading.value = true;
      var token =  await User_Perference().getUserAccessToken();
      PaymentViewResponse paymentViewResponse = (await homeRepository.viewPaymentData(fromDate.value, toDate.value,"Bearer "+token, )).data!;
      if (paymentViewResponse!=null) {
        isPaymentDataLoading.value = false;
        paymentViewData.value = paymentViewResponse;
        paymentDataList.value = paymentViewResponse.data!.data!;
      } else {
        isPaymentDataLoading.value = false;
      }
    } catch (e) {
      log("e $e");
      Get.back();
    }
  }



  deleteJob(int jobid, BuildContext context) async {
    try {
      var token =  await User_Perference().getUserAccessToken();
      buildDialogLoadingIndicator();
      SentEmailResponse response = (await homeRepository.deleteJob("Bearer "+token, jobid)).data!;
      if (response!=null) {
        Get.back(closeOverlays: true);
        if(response.status==200) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Job Deleted Successfully")
          ));
          getUpcomingJob();
        }else if(response.status!=200) {
          showToastMessage(title: " Error", message: response.message!);
        }
      } else {
        Get.back(closeOverlays: true);
      }
    } catch (e) {
      log("e $e");
      Get.back();
    }
  }

  getFirebaseMessage() {
    FirebaseMessaging.instance.getInitialMessage().then(
          (message) {
        print("FirebaseMessaging.instance.getInitialMessage");
        if (message != null) {
          print("New Notification");
          // if (message.data['_id'] != null) {
          //   Navigator.of(context).push(
          //     MaterialPageRoute(
          //       builder: (context) => DemoScreen(
          //         id: message.data['_id'],
          //       ),
          //     ),
          //   );
          // }
        }
      },
    );

    // 2. This method only call when App in forground it mean app must be opened
    FirebaseMessaging.onMessage.listen(
          (message) {
        print("FirebaseMessaging.onMessage.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data11 ${message.data}");
          LocalNotificationService.createanddisplaynotification(message);
        }
      },
    );

    // 3. This method only call when App in background and not terminated(not closed)
    FirebaseMessaging.onMessageOpenedApp.listen(
          (message) {
        print("FirebaseMessaging.onMessageOpenedApp.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data22 ${message.data['_id']}");
          LocalNotificationService.createanddisplaynotification(message);
        }
      },
    );
  }

  chooseDate(String type) async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!, initialDate: DateTime.now(),
        firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2101),
        confirmText: 'Confirm',
        helpText: 'Select Date',
        cancelText: 'Close'
    );
    if(pickedDate!=null && pickedDate!=fromDate.value) {
      String formattedDate = new DateFormat("yyyy-MM-dd").format(pickedDate);
      if(type=="from")
        fromDate.value = formattedDate;
      else if(type=="to")
        toDate.value=  formattedDate;
    }
    getPaymentData();
  }

  chooseHomeDate(String type) async {
    DateTime? pickedDate = await showDatePicker(
        context: Get.context!,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(), //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2101),
        confirmText: 'Confirm',
        helpText: 'Select Date',
        cancelText: 'Close'
    );
    if(pickedDate!=null && pickedDate!=fromDate.value){
      String formattedDate = new DateFormat("yyyy-MM-dd").format(pickedDate);
      if(type=="home")
      {
        homeDate.value = formattedDate;
        getHomeData();
      }
      else if(type=="upcoming")
      {
        upcomingJobDate.value=  formattedDate;
        getUpcomingJob();

      }
      else if(type=="past"){
        upcomingJobDate.value=  formattedDate;
        getPastJobs();

      }
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print('state = $state');
  }

  @override
  void onDetached() {
    print('detached');
  }

  @override
  void onInactive() {
    print('inActive');
  }

  @override
  void onPaused() {
    print('onPaused');
  }

  @override
  void onResumed() {
    print('onResumed');
  }
}