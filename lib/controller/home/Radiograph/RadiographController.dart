import 'dart:io';
import 'package:dentist/my_import.dart';
import 'package:file_picker/file_picker.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;



class AddRadiographToPatientsController extends GetxController {

  final Rx<StatusRequest> statusRequest = StatusRequest.none.obs;

  AddRadiographToPatientsData submitData = AddRadiographToPatientsData(crud: Get.find());
  final RxString errorMessage = ''.obs;
  final RxBool isLoading = false.obs;
  final RxBool isLoadingAnalyze = false.obs;
  final RxList<bool> isAnalyzingList = <bool>[].obs;
  final RxBool isAddImage = false.obs;


  final ImagePicker picker = ImagePicker();


  final Map<String, Color> classificationColors = {
    'Cavity': Colors.red,
    'Fillings': Colors.green,
    'Implant': Colors.blue,
    'Impacted Tooth': Colors.yellow,
  };


  final RxList<bool> isExpandedList = <bool>[].obs;

  void initExpansionStates(int length) {
    isExpandedList.assignAll(List.generate(length, (_) => false));
  }

  void toggleExpansion(int index) {
    if (index < isExpandedList.length) {
      isExpandedList[index] = !isExpandedList[index];
      isExpandedList.refresh();
    }
  }

  void addExpansionState() {
    isExpandedList.add(false);
  }

  void removeExpansionState(int index) {
    if (index < isExpandedList.length) {
      isExpandedList.removeAt(index);
    }
  }








  Future<void> pickAndSubmit(String patientId,PatientModel patient) async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      File compressedPhoto = await compressImage(File(image.path));
      await addRadiographToPatients(compressedPhoto, patientId, patient);

      // await addRadiographToPatients(File(image.path), patientId, patient);
    }
  }

  Future<File> compressImage(File file) async {
    final dir = await getTemporaryDirectory();
    final targetPath = path.join(dir.path, "temp_${DateTime.now().millisecondsSinceEpoch}.jpg");

    var result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      minWidth: 200,   // تقليل العرض
      minHeight: 200,
      quality: 60,
      format: CompressFormat.jpeg,
    );

    if (result is File) {
      return result as File;
    } else {
      return file;
    }

  }
  Future<void> pickImageAndSubmit(String patientId, PatientModel patient) async {
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  if (image != null) {
    // final compressed = await compressImage(File(image.path));
    File compressedPhoto = await compressImage(File(image.path));
    await addRadiographToPatients(compressedPhoto, patientId, patient);
    // await addRadiographToPatients(File(image.path), patientId, patient);
  addExpansionState();
  addAnalyzingState();
  }
  }

  Future<void> pickFileAndSubmit(String patientId, PatientModel patient) async {
  final result = await FilePicker.platform.pickFiles(
  type: FileType.any,
  );
  if (result != null && result.files.single.path != null) {
  final file = File(result.files.single.path!);


  File compressedPhoto = await compressImage(File(file.path));
  await addRadiographToPatients(compressedPhoto, patientId, patient);
  // await addRadiographToPatients(file, patientId, patient);
  addExpansionState();
  addAnalyzingState();
  }
  }




  void clear(){

  }



  void initExpansion(int length) {
    isExpandedList.assignAll(List.generate(length, (_) => false));
  }





  void initAnalyzingStates(int length) {
    isAnalyzingList.assignAll(List.generate(length, (_) => false));
  }

  void setAnalyzingState(int index, bool isAnalyzing) {
    if (index < isAnalyzingList.length) {
      isAnalyzingList[index] = isAnalyzing;
      isAnalyzingList.refresh();

      update();
    }
  }

  void addAnalyzingState() {
    isAnalyzingList.add(false);
  }

  void removeAnalyzingState(int index) {
    if (index < isAnalyzingList.length) {
      isAnalyzingList.removeAt(index);
    }
  }
  Future<void> analyzeRadiograph({
    required String patientId,
    required String radiographId,
    required int index,
  }) async {
    setAnalyzingState(index, true);
    update();

    await submitData.analyzeRadiograph(
      patient_id: patientId,
      radiograph_id: radiographId,
    ).then((value) async {
      if (value.statusCode <= 300 && value.statusCode >= 199) {
        statusRequest.value = handlingDataController(value.data);
        statusRequest.value = StatusRequest.success;

        final patientController = Get.find<PatientController>();
        await patientController.getPatients();

        Get.snackbar("نجاح", "تمت تحليل الصورة الأشعة بنجاح");
        clear();
      }
      setAnalyzingState(index, false);
    }).catchError((error) {
      setAnalyzingState(index, false);
    });
  }


  void deleteRadiograph({
    required String patientId,
    required String radiographId,
    required int index,
  }) async {
    setAnalyzingState(index, true);

    update();

    await submitData.deleteRadiograph(
      radiograph_id: radiographId,
    ).then((value) async {
      if (value.statusCode <= 300 && value.statusCode >= 199) {
        statusRequest.value = handlingDataController(value.data);
        statusRequest.value = StatusRequest.success;

        final patientController = Get.find<PatientController>();
        await patientController.getPatients();

        removeAnalyzingState(index);
        removeExpansionState(index);
        Get.snackbar("نجاح", "تمت حذف الصورة الأشعة بنجاح");
        clear();
      }
      setAnalyzingState(index, false);
    }).catchError((error) {
      setAnalyzingState(index, false);
    });
  }



  Future<void> addRadiographToPatients(File photo, String patientId, PatientModel patient) async {
    isLoading(true);
    errorMessage('');
    statusRequest.value = StatusRequest.loading;
    isAddImage (true);

    await submitData.postData(
      patientId: patientId,
      photo: photo,
    ).then((value) async {

      if (value.statusCode <= 300 && value.statusCode >= 199) {
        statusRequest.value = handlingDataController(value.data);
        statusRequest.value = StatusRequest.success;
        isLoading(false);


        final patientController = Get.find<PatientController>();
        await patientController.getPatients();
        isAddImage (false);

        update();

        addExpansionState();
      addAnalyzingState();

        Get.snackbar("نجاح", "تمت إضافة صورة الأشعة بنجاح");


        clear();


      }
      else{
        isAddImage (false);

        Get.snackbar("فشل", "!!!!!!فشل إضافة صورة الأشعة!!!!!!!! ");}

      isLoading(false);
    }).catchError((error) {
      isAddImage (false);

      print("____error_______________$error");
      Get.snackbar("فشل",error.toString(),);

      isLoading(false);
      update();
    });
  }
}
