
import 'package:jobprovider/app/domain/entities/login_response/login_response.dart';
import 'package:jobprovider/app/domain/entities/sentemail_response/sentemail_response.dart';

import '../../core/utils/app_utils.dart';

abstract class IChangePasswordRepository {
  Future<DataState<SentEmailResponse>> sentEmail(String email);
  Future<DataState<SentEmailResponse>> verifyOtp(String email, String otp);
  Future<DataState<SentEmailResponse>> changePassword(String email, String otp, String password , String confirmpssword);
  Future<DataState<SentEmailResponse>> usingTokenChangePassword(String token, String password , String confirmpssword);



}
