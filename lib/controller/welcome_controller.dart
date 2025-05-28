import 'dart:async';
import 'package:get/get.dart';

class WelcomeController extends GetxController {
  static WelcomeController get to => Get.find();

  @override
  void onReady() {
    super.onReady();
    _startTimer();
  }

  void _startTimer() {
    Timer(const Duration(seconds: 3), () {
      Get.offNamed('/OnBoarding');
    });
  }
}