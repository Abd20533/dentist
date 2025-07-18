
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class DoctorProfileController extends GetxController {
  var name = 'د. أحمد محمد'.obs;
  var age = '35'.obs;
  var certificateDate = '2015-06-20'.obs;
  Rx<File?> doctorImage = Rx<File?>(null);

  final ImagePicker _picker = ImagePicker();

  void updateProfile(String newName, String newAge, String newDate) {
    name.value = newName;
    age.value = newAge;
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

  // عرض حوار اختيار الصورة
  void showImagePickerDialog() {
    Get.dialog(
      AlertDialog(
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

  // اختيار التاريخ
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

  // حفظ وعرض إشعار
  void saveProfileWithSnackBar() {
    updateProfile(name.value, age.value, certificateDate.value);
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(content: Text('Profile Saved'.tr)),
    );
  }
}
