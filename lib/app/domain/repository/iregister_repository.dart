

import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:jobprovider/app/domain/entities/dropdown_responses/higher_qualification_response.dart';
import 'package:jobprovider/app/domain/entities/login_response/login_response.dart';
import 'package:jobprovider/app/domain/entities/register_response/BasicRegisterResponse.dart';
import 'package:jobprovider/app/domain/entities/register_response/RegisterResponse.dart';
import 'package:jobprovider/app/domain/entities/time_slot_responses/timeslot_response.dart';

import '../../core/utils/app_utils.dart';
import '../entities/dropdown_responses/state_responses.dart';

abstract class IRegisterRepository {
  Future<DataState<RegisterResponse>> userRegister(String email, String password, String password_confirmation);
  Future<DataState<BasicRegisterResponse>> userSaveBasicInfo(String token,String name, String dob, String gender,
      String phone, String city, String higherQft);

  Future<BasicRegisterResponse> appoinmentData(String token,String date, String filepath, String time);
  Future<DataState<HigherQualificationResponse>> gethQftData(String type);
  Future<DataState<TimeSlotResponse>> getTimeSlots();
  Future<DataState<StateResponse>> getstates();



}
