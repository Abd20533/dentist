import 'package:dentist/data/modules/PatientModel.dart';
import 'package:dentist/my_import.dart';
import 'package:get/get.dart';

class PatientController extends GetxController {
  final RxList<PatientModel> patients = <PatientModel>[].obs;
  final int maxVisible = 4;

  List<dynamic> get displayedPatients {
    final hasMore = patients.length > maxVisible;
    final visible = hasMore
        ? patients.take(maxVisible - 1).toList()
        : patients.toList();

    final result = List<dynamic>.from(visible);
    if (hasMore) {
      result.add({'isMore': true});
    }

    return result;
  }

  void loadSamplePatients() {
    patients.assignAll([
      PatientModel(name: 'Ethan Carter', age: '23 years old',image: "assets/images/person1.jpg"),
      PatientModel(name: 'Ethan Carter', age: '23 years old',image: "assets/images/person2.jpg"),
      PatientModel(name: 'Sophia Bennett', age: '35 years old',image: "assets/images/person3.jpg"),
      PatientModel(name: 'Sophia Bennett', age: '35 years old',image: "assets/images/person4.jpg"),
      PatientModel(name: 'Sophia Bennett', age: '35 years old',image: "assets/images/person6.jpg"),
      PatientModel(name: 'Sophia Bennett', age: '35 years old',image: "assets/images/person7.jpg"),
      PatientModel(name: 'Liam', age: '42 years old'),
      PatientModel(name: 'Liam', age: '42 years old'),
      PatientModel(name: 'Liam', age: '42 years old'),
      PatientModel(name: 'Liam', age: '42 years old'),
    ]);
  }
  void navigateToPatient() => Get.offNamed('/patient');

  @override
  void onInit() {
    loadSamplePatients();
    super.onInit();
  }
}








class AddPatientController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final phoneController = TextEditingController();
  final medicationsController = TextEditingController();
  final allergyController = TextEditingController();
  final dentalHistoryController = TextEditingController();
  final otherDiseaseController = TextEditingController();

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



  var selectedConditions = <String>{}.obs;
  var additionalDiseases = <String>[].obs;

  var showOtherDiseaseField = false.obs;

  var treatments = <Map<String, dynamic>>[].obs;
  var radiographs = <Map<String, dynamic>>[].obs;

  void toggleCondition(String cond, bool value) {
    if (value) {
      selectedConditions.add(cond);
      if (cond == 'أخرى') showOtherDiseaseField.value = true;
    } else {
      selectedConditions.remove(cond);
      if (cond == 'أخرى') showOtherDiseaseField.value = false;
    }
  }

  void addAdditionalDisease() {
    if (otherDiseaseController.text.isNotEmpty) {
      additionalDiseases.add(otherDiseaseController.text);
      otherDiseaseController.clear();
    }
  }

  void addTreatment() {
    treatments.add({'type': '', 'tooth': '', 'date': DateTime.now()});
  }

  void removeTreatment(int index) {
    treatments.removeAt(index);
  }

  void addRadiograph() {
    radiographs.add({'path': 'path/to/image.jpg', 'date': DateTime.now()});
  }

  void removeRadiograph(int index) {
    radiographs.removeAt(index);
  }

  void savePatientData() {
    if (formKey.currentState!.validate()) {
      final patientData = {
        'name': nameController.text,
        'age': ageController.text,
        'phone': phoneController.text,
        'conditions': [
          ...selectedConditions.where((c) => c != 'أخرى'),
          ...additionalDiseases
        ],
        'medications': medicationsController.text,
        'allergies': allergyController.text,
        'treatments': treatments,
        'radiographs': radiographs,
        'dentalHistory': dentalHistoryController.text,
      };
      print(patientData);
      Get.snackbar('تم الحفظ', 'تم حفظ بيانات المريض بنجاح');
    }
  }
}

