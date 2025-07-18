

import 'package:dentist/data/modules/ModelTreatment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildPanoramicImagesController extends GetxController {
  final RxList<ToothTreatmentModel> teeth = <ToothTreatmentModel>[].obs;

  final RxDouble height = 0.0.obs;
  final RxDouble width = 0.0.obs;


  void loadSampleTeeth() {


    teeth.assignAll([
      ToothTreatmentModel(image: "assets/images/t1.jpg", condition: "Healthy", color: Colors.red),
      ToothTreatmentModel(image: "assets/images/t3.jpg", condition: "Healthy", color: Colors.green),
      ToothTreatmentModel(image: "assets/images/t.jpg", condition: "Healthy", color: Colors.orange),
      ToothTreatmentModel(image: "assets/images/t3.jpg", condition: "Cavity", color: Colors.blue),
      ToothTreatmentModel(image: "assets/images/t2.jpg", condition: "Cavity", color: Colors.grey),
    ]);
  }

  @override
  void onInit() {
    loadSampleTeeth();
    super.onInit();
  }
}


