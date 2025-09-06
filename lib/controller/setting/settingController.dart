
import 'dart:io';
import 'package:dentist/core/class/status_request.dart';
import 'package:dentist/data/data_sources/remote/user/user_data.dart';
import 'package:dentist/model/user/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class DoctorProfileController extends GetxController {


  @override
  void onInit() {
    getInfo();

    super.onInit();
  }

  late User user;

  var certificateDate = ''.obs;
  Rx<File?> doctorImage = Rx<File?>(null);

  final ImagePicker _picker = ImagePicker();

   UserData userData= UserData(crud: Get.find());

  final Rx<StatusRequest> statusRequest = StatusRequest.none.obs;
  UserData submitData = UserData(crud: Get.find());





  final RxBool isLoading = false.obs;

  final RxString errorMessage = ''.obs;
  final int maxVisible = 4;


  Future<void> getInfo(


      ) async {


    isLoading(true);
    errorMessage('');
    statusRequest.value = StatusRequest.loading;
    await userData.getData(

    ).then((value) async {


      print("___________getData in controller____________");

      if (value.statusCode == 200||(value.statusCode <300 &&value.statusCode >199) ){
        user= User.fromJson(value.data);

        print("___________after get data ___________");

        statusRequest.value = StatusRequest.success;

        isLoading(false);
        Get.snackbar("نجاح", "نجح في جلب بيانات الطبيب");


        update();

      } else {
        Get.snackbar("خطأ", "فشل في جلب بيانات الطبيب");
        isLoading(false);
        statusRequest.value = StatusRequest.failure;

        update();

      }
      isLoading(false);



      update();

    }).catchError((error) {
      isLoading(false);
      Get.snackbar("خطأ", error.toString());
      statusRequest.value = StatusRequest.serverFailure;


      update();

    });



  }



  Future<void> putUser({

  required String email,
    required File photo,

}



      ) async {


    isLoading(true);
    errorMessage('');
    statusRequest.value = StatusRequest.loading;
    await userData.putData(
photo:photo ,
      email: email,
    ).then((value) async {


      print("___________getData in controller____________");

      if (value.statusCode == 200||(value.statusCode <300 &&value.statusCode >199) ){
        user= User.fromJson(value.data);

        print("___________after get data ___________");

        statusRequest.value = StatusRequest.success;

        isLoading(false);
        Get.snackbar("نجاح", "نجح في تعديل بيانات الطبيب");


        update();

      } else {
        Get.snackbar("خطأ", "فشل في تعديل بيانات الطبيب");
        statusRequest.value = StatusRequest.failure;

        isLoading(false);
        update();

      }
      isLoading(false);



      update();

    }).catchError((error) {
      isLoading(false);
      Get.snackbar("خطأ", error.toString());
      statusRequest.value = StatusRequest.serverFailure;


      update();

    });



  }
















  void updateProfile(String newName, String newAge, String newDate) {

    certificateDate.value = newDate;
  }

  Future<void> pickImageUnified(ImageSource source) async {
    try {
      var permission = source == ImageSource.camera
          ? await Permission.camera.request()
          : await Permission.photos.request();

      if (!permission.isGranted) {
        Get.snackbar('رفض الإذن', 'يجب منح الإذن لاختيار الصورة');
        return;
      }

      final pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        doctorImage.value = File(pickedFile.path);
      }
    } catch (e) {
      Get.snackbar('خطأ', 'حدث خطأ أثناء اختيار الصورة: $e');
    }
  }




  void showEditEmailDialog() {
    final TextEditingController emailController =
    TextEditingController(text: user.email ?? "");

    Get.dialog(

      AlertDialog(
        backgroundColor: Colors.white,
        title: const Text("تعديل البريد الإلكتروني"),
        content: TextField(
          controller: emailController,
          decoration: const InputDecoration(

            labelText: "البريد الإلكتروني الجديد",
            prefixIcon: Icon(Icons.email),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text("إلغاء"),
          ),
          ElevatedButton(
            onPressed: () {
              if (emailController.text.trim().isEmpty) {
                Get.snackbar("خطأ", "الرجاء إدخال بريد إلكتروني صالح");
                return;
              }

              if (doctorImage.value == null) {
                Get.snackbar("تنبيه", "الرجاء اختيار صورة أولاً");
                return;
              }

              putUser(
                email: emailController.text.trim(),
                photo: doctorImage.value!,
              );
              Get.back();
            },
            child: const Text("حفظ"),
          ),
        ],
      ),
    );
  }



  void showImagePickerDialog() {
    Get.dialog(
      AlertDialog(
        backgroundColor: Colors.white,
        title: Text('Add Photo'.tr),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: Text('Gallery'.tr),
              onTap: () {
                pickImageUnified(ImageSource.gallery);
                Get.back();
              },
            ),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: Text('Camera'.tr),
              onTap: () {
                pickImageUnified(ImageSource.camera);
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> selectCertificateDate() async {
    final selectedDate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.tryParse(certificateDate.value) ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (selectedDate != null) {
      certificateDate.value = selectedDate.toString().split(' ')[0];
    }
  }






}
