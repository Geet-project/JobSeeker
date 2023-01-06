
import 'package:jobprovider/app/domain/entities/home_response/HomeResponse.dart';
import 'package:jobprovider/app/domain/entities/login_response/login_response.dart';
import 'package:jobprovider/app/domain/entities/profile_response/viewprofile_response.dart';
import 'package:jobprovider/app/domain/entities/sentemail_response/sentemail_response.dart';

import '../../core/utils/app_utils.dart';
import '../entities/job_responses/upcomingjobs_response.dart';
import '../entities/payment_response/payment_response.dart';

abstract class IHomeRepository {
  Future<DataState<HomeResponse>> getHomeData(String token,String date, String skills);
  Future<DataState<UpcomingJobResponse>> upcomingJobs(String token, String date);
  Future<DataState<UpcomingJobResponse>> ongoingjobs(String token);
  Future<DataState<UpcomingJobResponse>> pastjobs(String token, String date);
  Future<DataState<ViewProfileResponse>> getProfile(String token);
  Future<DataState<SentEmailResponse>> deleteJob(String token, int jobid);
  Future<DataState<PaymentViewResponse>> viewPaymentData(String from_date, to_date, String toke);




}
