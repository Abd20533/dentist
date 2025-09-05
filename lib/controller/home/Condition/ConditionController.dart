import 'package:dentist/data/data_sources/remote/Condition/ConditionData.dart';
import 'package:dentist/my_import.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConditionController extends GetxController {
  ConditionData submitData = ConditionData(crud: Get.find());

  final Rx<StatusRequest> statusRequest = StatusRequest.none.obs;
  final RxString errorMessage = ''.obs;

  void addCondition(BuildContext context, {required String patientId}) {
    final nameController = TextEditingController();
    final notesController = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.white,
        title: const Text('إضافة حالة'),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'اسم الحالة'),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: notesController,
                decoration: const InputDecoration(labelText: 'ملاحظات'),
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
                  "يجب إدخال اسم الحالة",
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                );
                return;
              }

              await addConditionToPatient(


                patientId,

                nameController.text.trim(),
                notesController.text.trim().isEmpty
                    ? "-" // افتراضي لو ما كتب ملاحظات
                    : notesController.text.trim(),
              );

              Navigator.pop(context);
            },
            child: const Text('إضافة'),
          ),
        ],
      ),
    );
  }

  Future<void> addConditionToPatient(
      String patientId,
      String name,
      String notes,
      ) async {
    await submitData.postData(
      dataMap:


      {

        "patient_id":patientId,
        "name": name,
        "notes": notes},


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
  void deleteCondition(BuildContext context, int index, String patientId,
      {required String allergyId }) {
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

              await conditionDelete(
                // patientId: patientId,
                allergyId: allergyId,
              );
            },
            child: const Text('حذف'),
          ),
        ],
      ),
    );
  }

  Future<void> conditionDelete({
    // required String patientId,
    required String allergyId,
  }) async {
    await submitData.deleteData(
      condition_id: allergyId,


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
