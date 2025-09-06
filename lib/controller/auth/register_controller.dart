
import 'package:dentist/my_import.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class RegisterController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;
  final RxBool rememberMe = false.obs;
  RxBool isPasswordVisible = false.obs;
  final Rx<StatusRequest> statusRequest = StatusRequest.none.obs;


  MyServices myServices = Get.find();
  SignUpData signUpData = SignUpData(crud: Get.find());


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





  Future<bool> checkFormStateOld() async {

    if (formState.currentState!.validate()) {

      if (await checkInternet()==false) {

        return false;
      }
      return true;
    }else{
      return false;}
  }


  Future<void> signUpOld(


      ) async {
    if(await checkFormState()){
      isLoading(true);
      errorMessage('');
      statusRequest.value = StatusRequest.loading;
      await signUpData.postData(
        email: emailController.text,
        firstName:firstNameController.text ,
        lastName:lastNameController.text ,
        password:passwordController.text,
        // password:"123mm123",
      ).then((value) async {
        if (value.statusCode == 200 || value.statusCode == 201 ) {
          statusRequest.value = handlingDataController(value.data);
          statusRequest.value = StatusRequest.success;

          isLoading(false);

          navigateToLogin();


          update();

        }
      }).catchError((error) {

        isLoading(false);


      });
    }}

  Future<void> signUp() async {
    if (await checkFormState()) {
      isLoading(true);
      errorMessage('');
      statusRequest.value = StatusRequest.loading;

      await signUpData.postData(
        email: emailController.text,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        password: passwordController.text,
      ).then((value) async {
        if (value.statusCode == 200 || value.statusCode == 201) {
          // ✅ نجاح
          statusRequest.value = handlingDataController(value.data);
          statusRequest.value = StatusRequest.success;
          isLoading(false);

          Get.snackbar("نجاح", "تم إنشاء الحساب بنجاح 🎉",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green.shade100,
              colorText: Colors.black);

          navigateToLogin();
          update();
        } else {
          // ❌ السيرفر رجّع خطأ
          isLoading(false);
          Get.snackbar("خطأ", "فشل في إنشاء الحساب: ${value.statusMessage ?? "تحقق من البيانات"}",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red.shade100,
              colorText: Colors.black);
          statusRequest.value = StatusRequest.serverFailure;
          update();
        }
      }).catchError((error) {
        isLoading(false);
        Get.snackbar("خطأ", "حدث خطأ أثناء التسجيل: $error",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red.shade100,
            colorText: Colors.black);
        statusRequest.value = StatusRequest.serverException;
        update();
      });
    } else {
      // 🚨 checkFormState رجع false
      Get.snackbar("تنبيه", "الرجاء التأكد من صحة البيانات المدخلة أو الاتصال بالإنترنت",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.orange.shade100,
          colorText: Colors.black);
    }
  }



  Future<bool> checkFormState() async {
    if (formState.currentState!.validate()) {
      if (await checkInternet() == false) {
        Get.snackbar("خطأ", "لا يوجد اتصال بالإنترنت",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red.shade100,
            colorText: Colors.black);
        return false;
      }
      return true;
    } else {
      Get.snackbar("خطأ", "الرجاء ملء الحقول بشكل صحيح",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.shade100,
          colorText: Colors.black);
      return false;
    }
  }




  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}

