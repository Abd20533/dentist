import 'package:dentist/core/mycore/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;
  final RxBool rememberMe = false.obs;
  RxBool isPasswordVisible = false.obs;

  GlobalKey<FormState> formState = GlobalKey<FormState>();


  String? validateField(String value, String type) {
    return validate(value, type);
  }



  void rememberMeChanging(bool? value) {
    rememberMe.value = value ?? false;

    update();
  }
  Future<void> register() async {
    try {
      isLoading(true);
      errorMessage('');

      if (formState.currentState!.validate()){


      await Future.delayed(const Duration(seconds: 2));
      Get.offAllNamed('/home');
    }} catch (e) {
      errorMessage(e.toString());
      Get.snackbar('error'.tr, e.toString());
    } finally {
      isLoading(false);
    }
  }

  void socialLogin(String provider) {
    Get.snackbar('coming_soon'.tr, 'login_with_$provider'.tr);
  }

  void navigateToLogin() {
    Get.offNamed('/login');
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}