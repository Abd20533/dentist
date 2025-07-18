import 'package:dentist/core/class/status_request.dart';
import 'package:dentist/core/functions/check_internet.dart';
import 'package:dentist/core/functions/handling_data_controller.dart';
import 'package:dentist/core/mycore/validation.dart';
import 'package:dentist/core/services/services.dart';
import 'package:dentist/data/data_sources/remote/auth/sign_up_data.dart';
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





  Future<bool> checkFormState() async {

    if (formState.currentState!.validate()) {

      if (await checkInternet()==false) {

        return false;
      }
      return true;
    }else{
      return false;}
  }


  Future<void> signUp(


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
        print(value.data);
        if (value.statusCode == 200 || value.statusCode == 201 ) {
          print(value.data);
          statusRequest.value = handlingDataController(value.data);
          statusRequest.value = StatusRequest.success;
          // isLoading(false);



          print(statusRequest);
          isLoading(false);

          navigateToLogin();


          update();

        }
      }).catchError((error) {
        isLoading(false);

        print(error.toString());

      });
    }}








  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}

