import 'package:dentist/view/screen/auth/register/register.dart';
import 'package:get/get.dart';

class GetStartedController extends GetxController {
  void handleSignUp() {
    // Get.to(() => const Register());
    Get.offAll(() => const Register());

    // Get.off(() => const Register());

    //
    // Get.offNamed('register');
    // Get.offNamed('getStarted');

  }

}