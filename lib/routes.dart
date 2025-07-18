

import 'package:dentist/view/screen/auth/login/login.dart';
import 'package:dentist/view/screen/auth/register/register.dart';
import 'package:dentist/view/screen/auth/started_r/get_started.dart';
import 'package:dentist/view/screen/home/home.dart';
import 'package:dentist/view/screen/home/Patient/setPatient.dart';
import 'package:dentist/view/screen/home/Patient/AddOnePatient.dart';
import 'package:dentist/view/screen/onboarding/on_baording.dart';
import 'package:dentist/view/screen/setting/settingView.dart';
import 'package:dentist/view/screen/splash/splash.dart';
import 'package:dentist/view/screen/welcome/welcome.dart';
import 'package:get/get.dart';

import 'core/middleware/my_middleware.dart';

List<GetPage<double>>? routesGetX = [
  //MyMiddleWare
  /// اول ما يشتغل التطبيق راح يبدا من| يعني مثل كلمو هووم
  // GetPage(name: "/", page: () => const Test2()),
  // GetPage(
  // name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),


  GetPage(
      name: "/", page: () => const Splash(

  ), middlewares: [MyMiddleWare()]),
  // GetPage(
  //     name: "/", page: () =>  Home(
  //
  // ), middlewares: [MyMiddleWare()]),




  GetPage(name: '/welcome', page: () => WelcomeView()),
  GetPage(name: '/OnBoarding', page: () => OnBoarding()),
  GetPage(name: '/Splash', page: () => Splash()),


  GetPage(
    name: '/doctorProfile',
    page: () => DoctorProfilePage(),
  ),


  GetPage(name: '/getStarted', page: () => GetStarted()),
  GetPage(name: '/register', page: () => Register()),
  GetPage(name: '/login', page: () => LogIn()),
  GetPage(name: '/home', page: () => Home()),
  GetPage(name: '/patient', page: () => Patient()),
  GetPage(name: '/patientForm', page: () => AddOnePatient()),
  // GetPage(name: '/patientDashboard', page: () => PatientDashboard()),







];

 ///no important beucuse routesGetX
// Map<String, Widget Function(BuildContext)> routes = {
//   AppNameRoutes.login: (context) => const Login(),
//   AppNameRoutes.onBoarding: (context) => const OnBoarding(),
//   AppNameRoutes.singUp: (context) => const SingUp(),
//   AppNameRoutes.forGetPassword: (context) => const ForgetPassword(),
//   AppNameRoutes.verFiyCode: (context) => const VerFiyCode(),
//   AppNameRoutes.resetPassword: (context) => const ResetPassword(),
//   AppNameRoutes.successSignUp: (context) => const SuccessSignUp(),
//   AppNameRoutes.successResetPassword: (context) => const SuccessResetPassword(),
//   AppNameRoutes.verFiyCodeSignUp: (context) => const VerFiyCodeSignUp(),
// };
