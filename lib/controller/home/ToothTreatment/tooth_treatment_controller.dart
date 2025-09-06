
import 'package:dentist/my_import.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ToothTreatmentController extends GetxController {

  final Rx<StatusRequest> statusRequest = StatusRequest.none.obs;

  ToothTreatmentPatientsData submitData = ToothTreatmentPatientsData(crud: Get.find());
  final RxString errorMessage = ''.obs;
  final RxBool isLoading = false.obs;
  final RxBool isLoadingAnalyze = false.obs;
  final RxList<bool> isAnalyzingList = <bool>[].obs;

  final conditions = ['سكري', 'ضغط', 'ربو', 'أمراض قلب', 'أخرى'];
  final List<String> treatmentTypes = [
    'معالجة',
    'قلع',
    'معالجة لبية',
    'تنظيف',
    'حشو',
    'تقويم',
    'زراعة',
    'جسر',
    'تاج',
    'خلع جراحي',
    'تصوير شعاعي',
    'استشارة',
    'أخرى',
  ];








  // TextEditingControllers
  final TextEditingController conditionController = TextEditingController();
  final TextEditingController toothNumberController = TextEditingController();
  final TextEditingController treatmentTypeController = TextEditingController();
  final TextEditingController conditionTreatmentController = TextEditingController();


  final List<Map<String, String>> conditionChoices = [
    {"key": "healthy", "label": "سليم"},
    {"key": "cavity", "label": "نخر"},
    {"key": "filled", "label": "حشوة"},
    {"key": "crowned", "label": "تاج"},
    {"key": "root_canal", "label": "معالجة لب"},
    {"key": "extracted", "label": "مقلوع"},
    {"key": "gum_disease", "label": "مرض اللثة"},
    {"key": "fractured", "label": "مكسر"},
  ];

  final List<Map<String, String>> treatmentChoices = [
    {"key": "filling", "label": "حشو"},
    {"key": "extraction", "label": "قلع"},
    {"key": "cleaning", "label": "تنظيف"},
    {"key": "crown", "label": "تاج"},
    {"key": "root_canal", "label": "معالجة لب"},
    {"key": "whitening", "label": "تبييض"},
    {"key": "implant", "label": "زرع"},
  ];



  Color getConditionColor(String? condition) {
    switch (condition) {
      case "healthy":
        return Colors.green;
      case "cavity":
        return Colors.brown;
      case "filled":
        return Colors.orange;
      case "crowned":
        return Colors.amber;
      case "root_canal":
        return Colors.blue;
      case "extracted":
        return Colors.grey;
      case "gum_disease":
        return Colors.red;
      case "fractured":
        return Colors.black;
      default:
        return Colors.teal;
    }
  }


  void showAddTreatmentDialog(String patientId) {
    String? selectedCondition;
    String? selectedTreatment;
    Color selectedColor = Colors.blue;

    Get.dialog(
      StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text("إضافة علاج سنّي"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: toothNumberController,
                  decoration: const InputDecoration(labelText: "رقم السن"),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 12),

                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: "الحالة"),
                  value: selectedCondition,
                  items: conditionChoices.map((c) {
                    return DropdownMenuItem(
                      value: c["key"],
                      child: Text(c["label"]!),
                    );
                  }).toList(),
                  onChanged: (val) {
                    setState(() {
                      selectedCondition = val;
                    });
                  },
                ),

                const SizedBox(height: 12),

                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: "نوع العلاج"),
                  value: selectedTreatment,
                  items: treatmentChoices.map((t) {
                    return DropdownMenuItem(
                      value: t["key"],
                      child: Text(t["label"]!),
                    );
                  }).toList(),
                  onChanged: (val) {
                    setState(() {
                      selectedTreatment = val;
                    });
                  },
                ),

                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text("اختر لون العلاج:", style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 8),

                Wrap(
                  spacing: 8,
                  children: [
                    _colorCircle(Colors.red, selectedColor, () {
                      setState(() => selectedColor = Colors.red);
                    }),
                    _colorCircle(Colors.green, selectedColor, () {
                      setState(() => selectedColor = Colors.green);
                    }),
                    _colorCircle(Colors.blue, selectedColor, () {
                      setState(() => selectedColor = Colors.blue);
                    }),
                    _colorCircle(Colors.orange, selectedColor, () {
                      setState(() => selectedColor = Colors.orange);
                    }),
                    _colorCircle(Colors.purple, selectedColor, () {
                      setState(() => selectedColor = Colors.purple);
                    }),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: const Text("إلغاء"),
            ),
            ElevatedButton(
              onPressed: () {
                final toothNum = toothNumberController.text.trim();

                if (toothNum.isNotEmpty && selectedCondition != null && selectedTreatment != null) {


                  final hexColor = colorToHex(selectedColor);                  addTreatment(
                    patientId,
                    selectedCondition!,
                    toothNum,
                    selectedTreatment!,

                      hexColor
                  );
                  Get.back();
                }
              },
              child: const Text("إضافة"),
            ),
          ],
        ),
      ),
    );
  }


  String colorToHex(Color color) {
    return '#${color.value.toRadixString(16).substring(2).toUpperCase()}';
  }

  Future<void> addTreatment(
      String patientId,
      String condition,
      String toothNumber,
      String treatmentType,
      String colorHex,
      ) async {
    isLoading(true);
    errorMessage('');
    statusRequest.value = StatusRequest.loading;

    await submitData.postData(
      patientId: patientId,
      condition: condition,
      tooth_number: toothNumber,
      colorHex: colorHex,
      treatmentType:treatmentType ,

    ).then((value) async {
      if (value.statusCode >= 200 && value.statusCode < 300) {
        statusRequest.value = StatusRequest.success;
        isLoading(false);

        final patientController = Get.find<PatientController>();
        await patientController.getPatients();
        update();

        Get.snackbar("نجاح", "تمت إضافة الحالة بنجاح");
      } else {
        Get.snackbar("فشل", "فشل إضافة الحالة");
      }
      isLoading(false);
    }).catchError((error) {
      Get.snackbar("فشل", error.toString());
      isLoading(false);
      update();
    });
  }



  Color getColorFromString(String colorString) {
    switch (colorString.toLowerCase()) {
      case 'red':
        return Colors.red;
      case 'green':
        return Colors.green;
      case 'blue':
        return Colors.blue;
      case 'yellow':
        return Colors.yellow;
      case 'white':
        return Colors.white;
      case 'black':
        return Colors.black;
      case 'orange':
        return Colors.orange;
      case 'pink':
        return Colors.pink;
      case 'purple':
        return Colors.purple;
      case 'brown':
        return Colors.brown;
      case 'grey':
      case 'gray':
        return Colors.grey;
      default:
        return Colors.grey;
    }
  }




  Future<void> deleteTreatment( String toothTreatmentId,String patientId) async {
    isLoading(true);
    errorMessage('');
    statusRequest.value = StatusRequest.loading;


    await submitData.deleteData(
      patientId: patientId,
      toothTreatmentId:toothTreatmentId ,

    ).then((value) async {

      if (value.statusCode <= 300 && value.statusCode >= 199) {
        statusRequest.value = handlingDataController(value.data);
        statusRequest.value = StatusRequest.success;
        isLoading(false);


        final patientController = Get.find<PatientController>();
        await patientController.getPatients();
        update();


        Get.snackbar("نجاح", "تمت حذف  الحالة  بنجاح");




      }
      else{
      Get.snackbar("فشل", "!!!!!!فشل  حذف  الحالة!!!!!!!! ");}

      isLoading(false);
    }).catchError((error) {
      Get.snackbar("فشل",error.toString(),);

      isLoading(false);
      update();
    });
  }




  Widget _colorCircle(Color color, Color selectedColor, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
            color: color == selectedColor ? Colors.black : Colors.transparent,
            width: 2,
          ),
        ),
      ),
    );
  }



}
