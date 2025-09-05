
import 'package:dentist/my_import.dart';


import 'package:dentist/data/data_sources/remote/patient/AddPatient.dart';
import 'package:get/get.dart';
class AddPatientController extends GetxController {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final phoneController = TextEditingController();
  final Rx<StatusRequest> statusRequest = StatusRequest.none.obs;

  AddPatientsData submitData = AddPatientsData(crud: Get.find());
  final RxString errorMessage = ''.obs;
  final RxBool isLoading = false.obs;
  var selectedCountryCode = "+963".obs;
  var gender = "male".obs;

void clear(){

   nameController.text="";
 ageController.text="";
   phoneController.text="";
   gender ="male".obs;


}

void testSubmit (){

  debugPrint("تم إنشاء المريض: ${phoneController.text}");
  Get.snackbar("نجاح", "تمت إضافة المريض بنجاح");

}

  Future<void>addPatients(


      ) async {

    isLoading(true);
    errorMessage('');
    statusRequest.value = StatusRequest.loading;

    if(nameController.text.isEmpty || ageController.text.isEmpty||phoneController.text.isEmpty) {
      Get.snackbar("خطأ", "يرجى إدخال الاسم والعمر");
      return;


    }

    await submitData.postData(
      age:ageController.text ,
      gender: gender.value,
      name: nameController.text,
      phone: phoneController.text,


    ).then((value) async {
      if ( value.statusCode <= 300 &&value.statusCode >= 199 ) {


        statusRequest.value = handlingDataController(value.data);
        statusRequest.value = StatusRequest.success;
        isLoading(false);
        Get.snackbar("نجاح", "تمت إضافة المريض بنجاح");

        final patientController = Get.find<PatientController>();
        await patientController.getPatients();
        clear();
        update();

      }
      isLoading(false);

    }).catchError((error) {
      isLoading(false);

      update();

    });





  }

}


