import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobprovider/app/domain/entities/home_response/HomeResponse.dart';
import 'package:jobprovider/app/domain/entities/job_responses/JobResponses.dart';
import 'package:jobprovider/app/domain/entities/login_response/login_response.dart';
import 'package:jobprovider/app/domain/entities/notification_response/notification_response.dart';
import 'package:jobprovider/app/domain/entities/profile_response/update_profile_response.dart';
import 'package:jobprovider/app/domain/entities/profile_response/viewprofile_response.dart';
import 'package:jobprovider/app/domain/entities/register_response/BasicRegisterResponse.dart';
import 'package:jobprovider/app/domain/entities/register_response/RegisterResponse.dart';
import 'package:jobprovider/app/domain/entities/sentemail_response/sentemail_response.dart';
import 'package:retrofit/retrofit.dart';
import '../../../core/constants/app_constants.dart';
import '../../../domain/entities/dropdown_responses/higher_qualification_response.dart';
import '../../../domain/entities/dropdown_responses/state_responses.dart';
import '../../../domain/entities/job_responses/upcomingjobs_response.dart';
import '../../../domain/entities/payment_response/payment_response.dart';
import '../../../domain/entities/time_slot_responses/timeslot_response.dart';
part 'app_apis.g.dart';



@RestApi(baseUrl: serverBaseUrl)
abstract class AppApis {
  factory AppApis(Dio dio, {String baseUrl}) = _AppApis;

  @FormUrlEncoded()
  @POST("api/login")
  Future<HttpResponse<LoginResponse>> userLogin(
      @Field("email") String email,
      @Field("password") String password,
      @Field("fcm_token") String token);

  @FormUrlEncoded()
  @POST("api/register")
  Future<HttpResponse<RegisterResponse>> userRegister(
      @Field("email") String email,
      @Field("password") String password,
      @Field("password_confirmation") String password_confirmation,
      );

  @FormUrlEncoded()
  @POST("api/basic/information")
  Future<HttpResponse<BasicRegisterResponse>> userSaveBasicInfo(
      @Header("Authorization") String token,
      @Field("name") String name,
      @Field("dob") String dob,
      @Field("gendar")String gendar,
      @Field("phone") String phone,
      @Field("city") String city,
      @Field("higherQft") String higherQft,
      );

  @MultiPart()
  @POST("api/appoinment")
  Future<HttpResponse<BasicRegisterResponse>> appoinmentData(
      @Header("Authorization") String token,
      @Path("date") String date,
      @Part(name: 'photo') File? photo,
      );

  @GET("api/home")
  Future<HttpResponse<HomeResponse>> getHomeData(
      @Header("Authorization") String token,
      @Query("date") String date,
      @Query("skills") String skills);


  @GET("api/notification")
  Future<HttpResponse<NotificationResponse>> getNotification(@Header("Authorization") String token);

  @GET("api/jobdetails")
  Future<HttpResponse<JobDetailResponse>> getJobDetail(
      @Header("Authorization") String token,
      @Query("jobid") String jobid);

  @FormUrlEncoded()
  @POST("api/change/password")
  Future<HttpResponse<SentEmailResponse>> sentEmail(
      @Field("email") String email);

  @FormUrlEncoded()
  @POST("api/otp/verification")
  Future<HttpResponse<SentEmailResponse>> verifyOtp(
      @Field("email") String email,
      @Field("otp") String otp);

  @FormUrlEncoded()
  @POST("api/change/password/verify")
  Future<HttpResponse<SentEmailResponse>> changePassword(
      @Field("email") String email,
      @Field("otp") String otp,
      @Field("password") String password,
      @Field("password_confirmation") String password_confirmation);

  @FormUrlEncoded()
  @POST("api/apply/job")
  Future<HttpResponse<SentEmailResponse>> applyJob(
      @Header("Authorization") String token,
      @Field("jobid") String jobid);

  @GET("api/jobs/upcomming")
  Future<HttpResponse<UpcomingJobResponse>> getUpcomingJobList(@Header("Authorization") String token,
      @Query("date") String date,
      );

  @GET("api/jobs/ongoing")
  Future<HttpResponse<UpcomingJobResponse>> getOnGoingJobList(@Header("Authorization") String token);

  @GET("api/jobs/pastjob")
  Future<HttpResponse<UpcomingJobResponse>> getPastJobList(@Header("Authorization") String token,
      @Query("date") String date,
      );

  @GET("api/assets")
  Future<HttpResponse<HigherQualificationResponse>> getHqftData(@Query("type") String type);

  @GET("api/profile")
  Future<HttpResponse<ViewProfileResponse>> getProfile(@Header("Authorization") String token);

  @FormUrlEncoded()
  @POST("api/aboutus")
  Future<HttpResponse<UpdateProfileResponse>> updateAboutProfile(
      @Header("Authorization") String token,
      @Field("aboutus") String aboutus);

  @FormUrlEncoded()
  @POST("api/change/details")
  Future<HttpResponse<UpdateProfileResponse>> updatePersonalInfo(
      @Header("Authorization") String token,
      @Field("phone") String phone,
      @Field("address") String address);

  @FormUrlEncoded()
  @POST("api/profile/change/password")
  Future<HttpResponse<SentEmailResponse>> usingTokenChangePassword(
      @Header("Authorization") String token,
      @Field("password") String phone,
      @Field("password_confirmation") String address);

  @GET("api/timeslots")
  Future<HttpResponse<TimeSlotResponse>> getTimeSlots();

  @POST("api/delete/job")
  Future<HttpResponse<SentEmailResponse>> deleteJob(
      @Header("Authorization") String token,
      @Field("jobid") int jobid);

  @POST("api/markattandance")
  Future<HttpResponse<SentEmailResponse>> markAttedance(
      @Header("Authorization") String token,
      @Field("applied_job_id") int jobid,
      @Field("present") int isPresent,
      @Field("lat") String lat,
      @Field("longs") String long);

  @GET("api/payment")
  Future<HttpResponse<PaymentViewResponse>> getPaymentData(
      @Header("Authorization") String token,
      @Query("from_date") String from_date,
      @Query("to_date") String to_date
      );

  @GET("api/state")
  Future<HttpResponse<StateResponse>> getStates();

}
