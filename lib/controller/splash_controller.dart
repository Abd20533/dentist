import 'dart:async';
import 'package:get/get.dart';
import 'package:dentist/view/screen/welcome/welcome.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 3), () {
      Get.off(() => const WelcomeView());
    });
  }
}
