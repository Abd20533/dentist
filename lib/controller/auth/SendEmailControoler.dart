import 'package:dentist/data/data_sources/remote/auth/forgot_password_data.dart';
import 'package:dentist/my_import.dart';

import 'package:get/get.dart';

class SendEmailController extends GetxController {


  final Rx<StatusRequest> statusRequest = StatusRequest.none.obs;

  MyServices myServices = Get.find();
  ForgotPasswordData submitData = ForgotPasswordData(crud: Get.find());


  GlobalKey<FormState> formStateSendEmail = GlobalKey<FormState>();



  late TextEditingController emailController = TextEditingController();

  final RxBool isLoading = false.obs;

  final RxString errorMessage = ''.obs;
  MyServices services = Get.find();
  RxBool isPasswordVisible = false.obs;
  late ModelLogin modelLogin;





  String? validateField(String value, String type) {
    return validate(value, type);
  }


  void verificationView() => Get.offNamed('/verificationView');

  Future<void> send(
      {
        required String linkUrl,

        required GlobalKey<FormState> formState,
        required Map<String, dynamic>postData,}


      ) async {
    if(await checkFormState(formState)){

      statusRequest.value = StatusRequest.loading;
      await submitData.postData(
        linkUrl: linkUrl,
        postData: postData,

      ).then((value) async {
        if (value.statusCode == 200||(value.statusCode<300&&value.statusCode>199)) {

          statusRequest.value = handlingDataController(value.data);
          statusRequest.value = StatusRequest.success;

          Get.snackbar('نجاح', 'نجاح');

          verificationView();


          update();

        }
        isLoading(false);

      }).catchError((error) {
        Get.snackbar('فشل', '$error'.toString());

        isLoading(false);

        update();

      });
    }
    else
    {
      statusRequest.value = StatusRequest.noInternet;


    }

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



  void socialLogin(String provider) {
    Get.snackbar('coming_soon'.tr, 'login_with_$provider'.tr);
  }

  @override
  void onClose() {
    emailController.dispose();

    super.onClose();
  }


  @override
  void onInit() {
    emailController = TextEditingController();

    super.onInit();
  }

}
