import 'package:dentist/my_import.dart';
import 'package:dentist/view/screen/auth/forgot_password/send_email.dart';
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
     username: username,
     password:password,
     // password:"123mm123",
   ).then((value) async {
     if (value.statusCode == 200) {
       modelLogin=ModelLogin.formJson(value.data);

       print("Before storage - Token: ${CashHelper.getUserToken()}");
       await CashHelper.putUser(userToken: "");

       await CashHelper.putUser(userToken: modelLogin.access);
        DioHelper.updateToken(modelLogin.access);
       await DioHelper.init();
       print("After storage - Token: ${CashHelper.getUserToken()}");
       print("Model token: ${modelLogin.access}");
       Get.snackbar("نجاح", "تم إنشاء الحساب بنجاح 🎉",
           snackPosition: SnackPosition.BOTTOM,
           backgroundColor: Colors.green.shade100,
           colorText: Colors.black);

       Future.delayed(const Duration(seconds: 2));
if(CashHelper.getUserToken()!.isNotEmpty){
  statusRequest.value = handlingDataController(value.data);
  statusRequest.value = StatusRequest.success;
  isLoading(false);
  Future.delayed(const Duration(seconds: 2), () {
     navigateToHome();
  });


}




       update();

     }

     else{


       Get.snackbar("خطأ", "فشل في إنشاء الحساب: ${value.statusMessage ?? "تحقق من البيانات"}",
           snackPosition: SnackPosition.BOTTOM,
           backgroundColor: Colors.red.shade100,
           colorText: Colors.black);
     }
     isLoading(false);

   }).catchError((error) {

     Get.snackbar("خطأ", "حدث خطأ أثناء التسجيل: $error",
         snackPosition: SnackPosition.BOTTOM,
         backgroundColor: Colors.red.shade100,
         colorText: Colors.black);
     isLoading(false);

     update();

   });
 }
  else
  {
    Get.snackbar("تنبيه", "الرجاء التأكد من صحة البيانات المدخلة أو الاتصال بالإنترنت",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.orange.shade100,
        colorText: Colors.black);
    statusRequest.value = StatusRequest.noInternet;


  }

  }

 Future<bool> checkFormState() async {

   if (formState.currentState!.validate()) {

     if (await checkInternet()==false) {
       Get.snackbar("خطأ", "لا يوجد اتصال بالإنترنت",
           snackPosition: SnackPosition.BOTTOM,
           backgroundColor: Colors.red.shade100,
           colorText: Colors.black);

       return false;
     }
     return true;
   }else{

     Get.snackbar("خطأ", "الرجاء ملء الحقول بشكل صحيح",
         snackPosition: SnackPosition.BOTTOM,
         backgroundColor: Colors.red.shade100,
         colorText: Colors.black);

     return false;}
 }


  void navigateToRegister() => Get.offNamed('/register');

  // void forgotPassword() => Get.toNamed('/home');
  // void forgotPassword() => Get.to(SendEmail());
  void forgotPassword() => Get.offNamed('/sendEmail');


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


