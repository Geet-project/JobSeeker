import 'package:get/get.dart';
import 'package:jobprovider/app/modules/attendance/views/attendance.dart';
import 'package:jobprovider/app/modules/edit/bindings/editbindings.dart';
import 'package:jobprovider/app/modules/edit/views/edit_about.dart';
import 'package:jobprovider/app/modules/edit/views/edit_personal.dart';
import 'package:jobprovider/app/modules/getstarted/bindings/getstarted_binding.dart';
import 'package:jobprovider/app/modules/getstarted/views/getstarted.dart';
import 'package:jobprovider/app/modules/home/bindings/homebindings.dart';
import 'package:jobprovider/app/modules/home/views/home.dart';
import 'package:jobprovider/app/modules/jobdetail/bindings/jobs_binding.dart';
import 'package:jobprovider/app/modules/jobdetail/views/job_detailview.dart';
import 'package:jobprovider/app/modules/login/bindings/login_binding.dart';
import 'package:jobprovider/app/modules/login/views/loginview.dart';
import 'package:jobprovider/app/modules/notification/bindings/notificationbindings.dart';
import 'package:jobprovider/app/modules/notification/views/notification.dart';
import 'package:jobprovider/app/modules/password/views/create_password.dart';
import 'package:jobprovider/app/modules/payment/views/payment_history.dart';
import 'package:jobprovider/app/modules/signup/views/appointment.dart';
import 'package:jobprovider/app/modules/signup/views/signup.dart';
import 'package:jobprovider/app/modules/signup/views/singup_2.dart';
import 'package:jobprovider/app/modules/skills/views/skills.dart';
import 'package:jobprovider/app/modules/verifyemail/bindings/verifyemailbinding.dart';
import 'package:jobprovider/app/modules/verifyemail/views/VerifyEmailScreen.dart';
import 'package:jobprovider/app/modules/waitkyc/bindings/kyc_binding.dart';
import 'package:jobprovider/app/modules/waitkyc/views/waitkyc.dart';
import '../modules/attendance/bindings/attendance_binding.dart';
import '../modules/password/bindings/forgetpasswordbindings.dart';
import '../modules/password/views/forget_password.dart';
import '../modules/signup/bindings/appointment_binding.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/skills/bindings/skillsbindings.dart';
import '../modules/splash/bindings/splashbindings.dart';
import '../modules/splash/views/splashview.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.GET_STARTED,
      page: () => const GetStartedView(),
      binding: GetStartedBinding(),
    ),
    GetPage(
        name: _Paths.LOGIN,
        page: () => const LoginScreen(),
        binding: LoginBinding(),
        transition: Transition.fadeIn
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterScreen(),
      binding: SignUpBinding(),
        transition: Transition.fadeIn


    ),
    GetPage(
      name: _Paths.REGISTER2,
      page: () => const RegisterScreen2(),
      binding: SignUpBinding(),
        transition: Transition.fadeIn

    ),
    GetPage(
      name: _Paths.APPOINTMENT,
      page: () => const AppointmentScreen(),
      binding: AppointmentBinding(),
        transition: Transition.fadeIn

    ),
    GetPage(
      name: _Paths.FORGETPASSWORD,
      page: () => const ForgetPasswordScreen(),
      binding: ForgetPasswordBinding(),
        transition: Transition.fadeIn

    ),
    GetPage(
      name: _Paths.VERIFY_EMAIL,
      page: () => const VerifyEmailScreen(),
      binding: VerifyEmailBinding(),
        transition: Transition.fadeIn

    ),
    GetPage(
      name: _Paths.CREATEPASSWORD,
      page: () => const CreatePasswordScreen(),
      binding: ForgetPasswordBinding(),
        transition: Transition.fadeIn

    ),
    GetPage(
      name: _Paths.SKILLS,
      page: () => const SkillsScreen(),
      binding: SkillsBindings(),
        transition: Transition.fadeIn

    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeScreen(),
      binding: HomeBindings(),
        transition: Transition.fadeIn

    ),

    GetPage(
      name: _Paths.NOTIFIATION,
      page: () => const NotificationScreen(),
      binding: NotificationBinding(),
        transition: Transition.fadeIn

    ),
    GetPage(
      name: _Paths.EDIT_ABOUT,
      page: () => const EditAboutScreen(),
      binding: EditBindings(),
        transition: Transition.fadeIn
    ),
    GetPage(
      name: _Paths.EDIT_PERSONAL,
      page: () => const EditPersonalScreen(),
      binding: EditBindings(),
        transition: Transition.fadeIn

    ),
    GetPage(
      name: _Paths.JOB_DETAIL,
      page: () => const JobDetailScreen(),
      binding: JobDetailBindings(),
        transition: Transition.fadeIn

    ),
    GetPage(
        name: _Paths.ATTENDANCE,
        page: () => const AttendanceScreen(),
        binding: AttendanceBinding(),
        transition: Transition.fadeIn

    ),
    GetPage(
        name: _Paths.WAITKYC,
        page: () => const WaitKycScreen(),
        binding: KycBinding(),
        transition: Transition.fadeIn

    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBindings(),
    ),

  ];
}
