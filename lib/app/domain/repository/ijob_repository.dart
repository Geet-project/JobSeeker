
import 'package:jobprovider/app/domain/entities/job_responses/JobResponses.dart';
import 'package:jobprovider/app/domain/entities/job_responses/upcomingjobs_response.dart';
import 'package:jobprovider/app/domain/entities/login_response/login_response.dart';

import '../../core/utils/app_utils.dart';
import '../entities/sentemail_response/sentemail_response.dart';


abstract class IJobDetailRepository {
  Future<DataState<JobDetailResponse>> getJobDetail(String token, String jobid);
  Future<DataState<SentEmailResponse>> applyJob(String token, String jobid);



}
