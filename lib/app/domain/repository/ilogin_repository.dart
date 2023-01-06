
import 'package:jobprovider/app/domain/entities/login_response/login_response.dart';
import 'package:jobprovider/app/domain/entities/sentemail_response/sentemail_response.dart';

import '../../core/utils/app_utils.dart';

abstract class ILoginRepository {
  Future<DataState<LoginResponse>> userLogin(String email, String password, String token);
}
