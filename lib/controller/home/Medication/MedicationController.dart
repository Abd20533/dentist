import 'package:dentist/controller/home/PatientController/PatientController.dart';
import 'package:dentist/core/class/status_request.dart';
import 'package:dentist/core/functions/handling_data_controller.dart';
import 'package:dentist/data/data_sources/remote/medications/MedicationsData.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class MedicationsController extends GetxController {

  //
  //
  // @override
  // void onInit() {
  // super.onInit();
  // }



  AddMedicationsData submitData = AddMedicationsData(crud: Get.find());

  final Rx<StatusRequest> statusRequest = StatusRequest.none.obs;
  final RxString errorMessage = ''.obs;


  void addMedication(BuildContext context, {required String patientId}) {
    final nameController = TextEditingController();
    final durationController = TextEditingController();
    final notesController = TextEditingController();

    String? selectedTimeOfDay;
    String? selectedDosage;
    String? selectedTimesPerDay;

    // خيارات الجرعة (مثال: 1-5 حبات)
    final dosageOptions = ['100mg', '200mg', '300mg', '400mg', '500mg'];


    final timesPerDayOptions = ['1', '2', '3', '4'];

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: Colors.white,
        title: Text('إضافة دواء'),
        content: SingleChildScrollView(
          child: Column(
            children: [
              // اسم الدواء
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'اسم الدواء'),
              ),

              // Dropdown للجرعة
              DropdownButtonFormField<String>(
                value: selectedDosage,
                decoration: InputDecoration(labelText: 'الجرعة'),
                items: dosageOptions
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (value) {
                  selectedDosage = value;
                },
              ),

              // Dropdown لعدد المرات يومياً
              DropdownButtonFormField<String>(
                value: selectedTimesPerDay,
                decoration: InputDecoration(labelText: 'عدد المرات يومياً'),
                items: timesPerDayOptions
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (value) {
                  selectedTimesPerDay = value;
                },
              ),

              // Dropdown لوقت اليوم
              DropdownButtonFormField<String>(
                value: selectedTimeOfDay,
                decoration: InputDecoration(labelText: 'وقت اليوم'),
                items: const [
                  DropdownMenuItem(value: 'morning', child: Text('صباحاً')),
                  DropdownMenuItem(value: 'noon', child: Text('ظهراً')),
                  DropdownMenuItem(value: 'evening', child: Text('مساءً')),
                  DropdownMenuItem(value: 'night', child: Text('ليلاً')),
                ],
                onChanged: (value) {
                  selectedTimeOfDay = value;
                },
              ),

              // المدة
              TextField(
                controller: durationController,
                decoration: InputDecoration(labelText: 'المدة'),
              ),

              // الملاحظات
              TextField(
                controller: notesController,
                decoration: InputDecoration(labelText: 'ملاحظات'),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text('إلغاء')),
          ElevatedButton(
            onPressed: () async {
              // التحقق من المدخلات
              if (nameController.text.trim().isEmpty) {
                Get.snackbar(
                  "خطأ",
                  "يجب إدخال اسم الدواء",
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                );
                return;
              }
              if (selectedDosage == null) {
                Get.snackbar("خطأ", "يجب اختيار الجرعة", backgroundColor: Colors.red, colorText: Colors.white);
                return;
              }
              if (selectedTimesPerDay == null) {
                Get.snackbar("خطأ", "يجب اختيار عدد المرات يومياً", backgroundColor: Colors.red, colorText: Colors.white);
                return;
              }
              if (selectedTimeOfDay == null) {
                Get.snackbar("خطأ", "يجب اختيار وقت اليوم", backgroundColor: Colors.red, colorText: Colors.white);
                return;
              }

              await addMedicationToPatients(
                patientId,
                durationController.text,
                selectedDosage!,
                nameController.text,
                notesController.text,
                selectedTimeOfDay!,
                selectedTimesPerDay!,
              );

              Navigator.pop(context);
            },
            child: Text('إضافة'),
          ),
        ],
      ),
    );
  }


  Future<void> addMedicationToPatients(

      String patientId,
      String duration,
      String dosage,
      String name,
      String notes,
      String time_of_day,
      String times_per_day,




      ) async {


    await submitData.postData(
      duration:duration ,

dosage:dosage ,
      name:name ,
      notes:notes ,
      time_of_day: time_of_day,
      times_per_day:times_per_day ,

      patientId: patientId,
    ).then((value) async {

      if (value.statusCode <= 300 && value.statusCode >= 199) {
        statusRequest.value = handlingDataController(value.data);
        statusRequest.value = StatusRequest.success;


        final patientController = Get.find<PatientController>();
        await patientController.getPatients();
        update();

        Get.snackbar("نجاح", "تمت إضافة الدواء بنجاح");




      }
      else{
        Get.snackbar("فشل", "لم تتم إضافة الدواء ");


      }
    }).catchError((error) {
      Get.snackbar("فشل", error.toString());

      print(error.toString());
      update();
    });
  }






  void deleteMedication(BuildContext context, int index,String medId,
      {required String patientId}) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('حذف الدواء'),
        content: Text('هل أنت متأكد من حذف هذا الدواء؟'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('إلغاء'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () async {

              Navigator.pop(context);

              await medicationsDelete(
                patientId: patientId.toString(),
                medicationId:medId,
              );
            },
            child: Text('حذف'),
          ),
        ],
      ),
    );
  }

  Future<void> medicationsDelete({
    required String patientId,
    required String medicationId,
  }) async {
    await submitData.medicationsDelete(
      patientId: patientId,
      medicationId: medicationId,
    ).then((value) async {
      if (value.statusCode <= 300 && value.statusCode >= 199) {
        statusRequest.value = handlingDataController(value.data);
        statusRequest.value = StatusRequest.success;

        final patientController = Get.find<PatientController>();
        await patientController.getPatients();
        update();

        Get.snackbar("نجاح", "تم حذف الدواء بنجاح");
      }
    }).catchError((error) {
      print(error.toString());
      update();
    });
  }

}
