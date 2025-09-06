import 'package:dentist/data/data_sources/remote/auth/forgot_password_data.dart';
import 'package:dentist/my_import.dart';

import 'package:get/get.dart';

class  ResetPasswordController extends GetxController {


  final Rx<StatusRequest> statusRequest = StatusRequest.none.obs;

  MyServices myServices = Get.find();
  ForgotPasswordData submitData = ForgotPasswordData(crud: Get.find());


 late GlobalKey<FormState> formStateResetPassword ;




  late TextEditingController passwordController = TextEditingController();
  late TextEditingController passwordConController = TextEditingController();


  final RxBool isLoading = false.obs;

  final RxString errorMessage = ''.obs;
  MyServices services = Get.find();
  RxBool isPasswordVisible = false.obs;
  late ModelLogin modelLogin;



  String? validateField(String value, String type) {
    return validate(value, type);
  }



  Future<bool> checkFormState() async {
    final form = formStateResetPassword.currentState;
    if (form != null && form.validate()) {
      if (await checkInternet() == false) {
        return false;
      }
      return true;
    } else {
      return false;
    }
  }

  Future<void> sendData(
      {
        required String linkUrl,
        // required GlobalKey<FormState> formState,
        required Map<String, dynamic>postData,}


      ) async {
    if(await checkFormState()){

      statusRequest.value = StatusRequest.loading;
      await submitData.postData(
        linkUrl: linkUrl,
        postData: postData,

      ).then((value) async {
        if (value.statusCode == 200||(value.statusCode<300&&value.statusCode>199)) {

          statusRequest.value = handlingDataController(value.data);
          statusRequest.value = StatusRequest.success;


          successResetPassword();
          update();

        }

        else{
        Get.snackbar("Error", "Error!");}

        isLoading(false);

      }).catchError((error) {
        isLoading(false);

        update();

      });
    }
    else
    {
      statusRequest.value = StatusRequest.noInternet;


    }

  }




  void socialLogin(String provider) {
    Get.snackbar('coming_soon'.tr, 'login_with_$provider'.tr);
  }

  @override
  void onClose() {
    // formStateResetPassword = GlobalKey<FormState>();

    passwordController.dispose();
    passwordConController.dispose();

    super.onClose();
  }


  @override
  void onInit() {
    formStateResetPassword = GlobalKey<FormState>();
    passwordController = TextEditingController();
    passwordConController = TextEditingController();

    super.onInit();
  }


  void login() => Get.offNamed('/login');
  void successResetPassword() => Get.offNamed('/successResetPassword');

  void navigateToRegister() => Get.offNamed('/register');

  void forgotPassword() => Get.toNamed('/home');


}
