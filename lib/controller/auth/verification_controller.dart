import 'package:dentist/data/data_sources/remote/auth/forgot_password_data.dart';
import 'package:dentist/my_import.dart';
import 'package:dentist/view/screen/auth/forgot_password/reset_password.dart';

import 'package:get/get.dart';

class VerificationController extends GetxController {


  final Rx<StatusRequest> statusRequestOtp = StatusRequest.none.obs;

  MyServices myServices = Get.find();
  ForgotPasswordData submitData = ForgotPasswordData(crud: Get.find());

  late GlobalKey<FormState> formStateVerification;


  late TextEditingController otpController; //

  final RxBool isLoading = false.obs;

  final RxString errorMessage = ''.obs;
  RxBool isPasswordVisible = false.obs;

  Future<void> sendOtp() async {
    statusRequestOtp.value = StatusRequest.loading;
    // هنا تستدعي API أو Firebase لإرسال OTP
    await Future.delayed(const Duration(seconds: 1)); // محاكاة إرسال
    statusRequestOtp.value = StatusRequest.success;
  }

  // دالة للتحقق من الـ OTP
  Future<void> verifyOtp(String otp) async {

    statusRequestOtp.value = StatusRequest.loading;
print(otp);
print("___________________otp___________________--");
    await Future.delayed(const Duration(seconds: 1));
    if (otp == "12345" || otp.length==5) {
      statusRequestOtp.value = StatusRequest.success;
      Get.snackbar("Success", "OTP Verified!");
      // void verificationView() => Get.offNamed('/verificationView');
      Get.offAll(() => ResetPasswordView(otp))

      ; // ✅ يزيل الصفحة الحالية من الستاك

      // Get.off(() => ResetPasswordView(otp)); // يزيل الصفحة القديمة من الـ stack

    } else {
      statusRequestOtp.value = StatusRequest.failure;
      Get.snackbar("Error", "Invalid OTP!");
    }




  }




  String? validateField(String value, String type) {
    return validate(value, type);
  }




  Future<bool> checkFormState(GlobalKey<FormState> formState) async {

    if (formState.currentState!.validate()) {

      if (await checkInternet()==false) {

        return false;
      }
      return true;
    }else{
      return false;}
  }

  void navigateToRegister() => Get.offNamed('/register');

  void forgotPassword() => Get.toNamed('/home');

  void socialLogin(String provider) {
    Get.snackbar('coming_soon'.tr, 'login_with_$provider'.tr);
  }

  @override
  void onClose() {


    // otpController.dispose(); // ⬅️ جديد
    super.onClose();
  }


  @override
  void onInit() {

    otpController = TextEditingController();
    formStateVerification= GlobalKey<FormState>();
    super.onInit();
  }

}
