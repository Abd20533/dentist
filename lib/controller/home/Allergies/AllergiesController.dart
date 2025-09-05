
import 'package:dentist/data/data_sources/remote/Allergies/AllergiesData.dart';
import 'package:dentist/my_import.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllergiesController extends GetxController {
  AllergiesData submitData = AllergiesData(crud: Get.find());

  final Rx<StatusRequest> statusRequest = StatusRequest.none.obs;
  final RxString errorMessage = ''.obs;

  void addAllergy(BuildContext context, {required String patientId}) {
    final nameController = TextEditingController();
    final descriptionController = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(

        backgroundColor: Colors.white,
        title: const Text('إضافة حساسية'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'اسم الحساسية'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: descriptionController,
                decoration: const InputDecoration(labelText: 'الوصف'),
                maxLines: 2,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('إلغاء')),
          ElevatedButton(
            onPressed: () async {
              if (nameController.text.trim().isEmpty) {
                Get.snackbar(
                  "خطأ",
                  "يجب إدخال اسم الحساسية",
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                );
                return;
              }

              await addAllergiesToPatients(
                patientId,
                nameController.text.trim(),
                descriptionController.text.trim().isEmpty
                    ? "-" // افتراضي لو ما كتب وصف
                    : descriptionController.text.trim(),
              );

              Navigator.pop(context);
            },
            child: const Text('إضافة'),
          ),
        ],
      ),
    );
  }

  Future<void> addAllergiesToPatients(
      String patientId,
      String name,
      String description,
      ) async {
    await submitData.postData(
      dataMap:

      {
        "name": name,
        "description": description},


      patientId: patientId,
    ).then((value) async {
      if (value.statusCode <= 300 && value.statusCode >= 199) {
        statusRequest.value = handlingDataController(value.data);
        statusRequest.value = StatusRequest.success;

        final patientController = Get.find<PatientController>();
        await patientController.getPatients();

        Get.snackbar("نجاح", "تمت إضافة الحساسية بنجاح");
        update();

      } else {
        Get.snackbar("فشل", "لم تتم إضافة الحساسية");
      }
    }).catchError((error) {
      Get.snackbar("فشل", error.toString());
      print(error.toString());
      update();
    });
  }

  /// 🔹 حذف حساسية
  void deleteAllergy(BuildContext context, int index, String allergyId,
      {required String patientId}) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('حذف الحساسية'),
        content: const Text('هل أنت متأكد من حذف هذه الحساسية؟'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('إلغاء'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () async {
              Navigator.pop(context);

              await allergiesDelete(
                patientId: patientId,
                allergyId: allergyId,
              );
            },
            child: const Text('حذف'),
          ),
        ],
      ),
    );
  }

  Future<void> allergiesDelete({
    required String patientId,
    required String allergyId,
  }) async {
    await submitData.deleteData(
      patientId:patientId ,
      allergyId:allergyId ,

      //
      // allergyId:allergyId,
      // patientId: patientId,
    ).then((value) async {
      if (value.statusCode <= 300 && value.statusCode >= 199) {
        statusRequest.value = handlingDataController(value.data);
        statusRequest.value = StatusRequest.success;

        final patientController = Get.find<PatientController>();
        await patientController.getPatients();
        update();

        Get.snackbar("نجاح", "تم حذف الحساسية بنجاح");
      }
    }).catchError((error) {
      print(error.toString());
      update();
    });
  }
}
