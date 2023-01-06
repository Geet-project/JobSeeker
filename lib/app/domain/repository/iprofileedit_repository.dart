
import 'package:jobprovider/app/domain/entities/job_responses/JobResponses.dart';
import 'package:jobprovider/app/domain/entities/job_responses/upcomingjobs_response.dart';
import 'package:jobprovider/app/domain/entities/login_response/login_response.dart';
import 'package:jobprovider/app/domain/entities/profile_response/update_profile_response.dart';
import 'package:jobprovider/app/domain/entities/profile_response/viewprofile_response.dart';

import '../../core/utils/app_utils.dart';
import '../entities/sentemail_response/sentemail_response.dart';


abstract class IEditProfileRepository {
  Future<DataState<UpdateProfileResponse>> editAbout(String token, String about);
  Future<DataState<UpdateProfileResponse>> editPersonalInfo(String token, String phone, String address);


}
