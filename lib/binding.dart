import 'package:dentist/controller/auth/login_controller.dart';
import 'package:dentist/controller/auth/register_controller.dart';
import 'package:dentist/controller/get_started_controller.dart';
import 'package:dentist/controller/home/ViewPatientController.dart';
import 'package:dentist/core/class/crud.dart';
import 'package:get/get.dart';


class MyBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<RegisterController>(() => RegisterController(),fenix: true);
    Get.lazyPut<LoginController>(() => LoginController(),fenix: true);
    Get.lazyPut<GetStartedController>(() => GetStartedController(),fenix: true);
    Get.lazyPut<RegisterController>(() => RegisterController(),fenix: true);
    Get.lazyPut(() => ViewPatientController(),fenix: true);

    // Get.put(GetStartedController());

    // Get.put(RegisterController(), permanent: true);
    Get.put(Crud());
    // Get.put(TestControllerImp());
  }
}

