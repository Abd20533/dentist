
//
// Future<void> getImageFromGallery() async {
//   final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//   if (pickedFile != null) {
//     image = File(pickedFile.path);
//     userProfileImage=false;
//
//   }
// }
//
// Future<void> getImageFromCamera() async {
//   final pickedFile = await _picker.pickImage(source: ImageSource.camera);
//   if (pickedFile != null) {
//     image = File(pickedFile.path);
//     userProfileImage=false;
//
//   }
// }


// Future<void> getImageFromGallery() async {
//   final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
//   if (pickedFile != null) {
//     image = File(pickedFile.path);
//     doctorImage.value = image; // ✅ لتحديث واجهة العرض
//     userProfileImage = false;
//   }
// }
//
// Future<void> getImageFromCamera() async {
//   final pickedFile = await _picker.pickImage(source: ImageSource.camera);
//   if (pickedFile != null) {
//     image = File(pickedFile.path);
//     doctorImage.value = image; // ✅ لتحديث واجهة العرض
//     userProfileImage = false;
//   }
// }
//

// Future<void> pickImage(ImageSource source) async {
//   try {
//     // طلب الأذونات أولاً
//     if (source == ImageSource.camera) {
//       final status = await Permission.camera.request();
//       if (!status.isGranted) return;
//     } else {
//       final status = await Permission.photos.request();
//       if (!status.isGranted) return;
//     }
//
//     final pickedFile = await ImagePicker().pickImage(
//       source: source,
//       imageQuality: 80,
//       maxWidth: 800,
//     );
//
//     if (pickedFile != null) {
//       doctorImage.value = File(pickedFile.path);
//     }
//   } catch (e) {
//     Get.snackbar(
//       'خطأ'.tr,
//       'فشل في تحميل الصورة: ${e.toString()}'.tr,
//       snackPosition: SnackPosition.BOTTOM,
//     );
//   }
// }
// تحديث البيانات
