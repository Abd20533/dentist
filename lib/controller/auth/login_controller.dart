
import 'package:dentist/core/class/status_request.dart';
import 'package:dentist/core/constant/app_name_routes.dart';
import 'package:dentist/core/functions/check_internet.dart';
import 'package:dentist/core/functions/handling_data_controller.dart';
import 'package:dentist/core/mycore/validation.dart';
import 'package:dentist/core/services/services.dart';
import 'package:dentist/core/shaerd/my_cash_helper.dart';
import 'package:dentist/data/data_sources/remote/auth/ModeleLogin.dart';
import 'package:dentist/data/data_sources/remote/auth/login_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {


  final Rx<StatusRequest> statusRequest = StatusRequest.none.obs;

 MyServices myServices = Get.find();
  LoginData loginData = LoginData(crud: Get.find());


  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  final RxBool isLoading = false.obs;

  final RxBool rememberMe = false.obs;

  final RxString errorMessage = ''.obs;
  MyServices services = Get.find();
  RxBool isPasswordVisible = false.obs;
  late ModelLogin modelLogin;


  GlobalKey<FormState> formState = GlobalKey<FormState>();
 void navigateToHome() {
   Get.offNamed('/home');
 }


  String? validateField(String value, String type) {
    return validate(value, type);
  }
  void rememberMeChanging(bool? value) {
    rememberMe.value = value ?? false;

    update();
  }



 void storeData(Map data) {
   CashHelper.putUserPassword(password: data['password']);

 }



 Future<void> login(
     {

  required  username,
  required  password,
}
   // required context,

 ) async {
   if(await checkFormState()){
   isLoading(true);
   errorMessage('');
   statusRequest.value = StatusRequest.loading;
   await loginData.postData(
     // username: "ookl@gmail.com",
     username: username,
     password:password,
     // password:"123mm123",
   ).then((value) async {
     print(value.statusCode);
     if (value.statusCode == 200) {
       modelLogin=ModelLogin.formJson(value.data);
       CashHelper.putUser(userToken:modelLogin.access );

       print("${modelLogin.access} ________is_________---");
       print(value.data);
        statusRequest.value = handlingDataController(value.data);
       statusRequest.value = StatusRequest.success;
       isLoading(false);
       navigateToHome();

       // isLoading(false);



       print(statusRequest);

       update();

     }
     isLoading(false);

   }).catchError((error) {
     isLoading(false);

     print(error.toString());
     update();

   });
 }
  else
  {
    statusRequest.value = StatusRequest.noInternet;


  }

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
 Future<void> login1() async {
    try {
      print("login");
      isLoading(true);
      errorMessage('');

      if (formState.currentState!.validate()) {
        statusRequest.value = StatusRequest.loading;
        var data = await loginData.postData(
          // email: emailController.text,
          // username: emailController.text,
          // password: passwordController.text,

        username: "ookl@gmail.com",
          password:"123mm123",
        );

        var response = data.data;
        statusRequest.value = handlingDataController(response);
print(statusRequest);
        if (statusRequest == StatusRequest.success) {
          if (response['status'] == 'success') {
            if (response['data']['users_approve'].toString() == '1') {
              storeData(response['data']);
              Get.offAllNamed(AppNameRoutes.homePage);
            } else {

            }
          } else {
            Get.defaultDialog(
              title: "Warning",
              middleText: "Email or Password not correct",
            );
            statusRequest.value = StatusRequest.failure;
          }
        }
        update();




    }else {}



    } catch (e) {
      errorMessage(e.toString());
      Get.snackbar('error'.tr, e.toString());
      print('error is ${e.toString()}');
    } finally {
      isLoading(false);
      // update();
    }
  }

  void navigateToRegister() => Get.offNamed('/register');

  // void forgotPassword() => Get.toNamed('/forgot-password');
  void forgotPassword() => Get.toNamed('/home');
  // void forgotPassword() => Get.toNamed('/patientDashboard');

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

//   print("Home");
// await Future.delayed(const Duration(seconds: 2));
// Get.to(Home());
// Get.offAllNamed('/home');


