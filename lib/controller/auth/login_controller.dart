
import 'package:dentist/core/mycore/validation.dart';
import 'package:dentist/core/services/services.dart';
import 'package:dentist/view/screen/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  final RxBool isLoading = false.obs;

  final RxBool rememberMe = false.obs;

  final RxString errorMessage = ''.obs;
  MyServices services = Get.find();
  RxBool isPasswordVisible = false.obs;

  // services.sharedPreferences.getInt('id')!
  GlobalKey<FormState> formState = GlobalKey<FormState>();


  String? validateField(String value, String type) {
    return validate(value, type);
  }


  void rememberMeChanging(bool? value) {
    rememberMe.value = value ?? false;

    update();
  }


  Future<void> login() async {
    try {
      print("login");
      isLoading(true);
      errorMessage('');

      if (formState.currentState!.validate()) {


print("Home");
      await Future.delayed(const Duration(seconds: 2));
      Get.to(Home());
      // Get.offAllNamed('/home');
    }
      print(" NOT Home");
      print(passwordController.text);
      print(emailController.text);


    } catch (e) {
      errorMessage(e.toString());
      Get.snackbar('error'.tr, e.toString());
    } finally {
      isLoading(false);
      // update();
    }
  }

  void navigateToRegister() => Get.offNamed('/register');

  void forgotPassword() => Get.toNamed('/forgot-password');

  void socialLogin(String provider) {
    Get.snackbar('coming_soon'.tr, 'login_with_$provider'.tr);
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }


  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

}