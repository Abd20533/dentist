import 'package:dentist/controller/auth/ResetPasswordController.dart';
import 'package:dentist/controller/auth/SendEmailControoler.dart';
import 'package:dentist/controller/auth/login_controller.dart';
import 'package:dentist/controller/auth/register_controller.dart';
import 'package:dentist/controller/auth/verification_controller.dart';
import 'package:dentist/controller/get_started_controller.dart';
import 'package:dentist/core/class/crud.dart';
import 'package:get/get.dart';


class MyBinding extends Bindings {
  @override
  void dependencies() {

    Get.put(Crud());
    Get.lazyPut<LoginController>(() => LoginController(),fenix: true);
    Get.lazyPut<GetStartedController>(() => GetStartedController(),fenix: true);
    Get.lazyPut<RegisterController>(() => RegisterController(),fenix: true);


    Get.lazyPut<ResetPasswordController>(() => ResetPasswordController(), fenix: true);
    Get.lazyPut<SendEmailController>(() => SendEmailController(), fenix: true);
    Get.create<VerificationController>(() => VerificationController());



  }
}

