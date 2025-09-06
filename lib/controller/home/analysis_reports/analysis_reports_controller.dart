
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnalysisController extends GetxController {
  final Map<String, Color> classificationColors = {
    'Cavity': Colors.red,
    'Fillings': Colors.green,
    'Implant': Colors.blue,
    'Impacted Tooth': Colors.orange,
    'Healthy': Colors.teal,
  };

  var selectedClassification = ''.obs;

  final Map<int, RxBool> _expandedMap = {};

  void selectClassification(String classification) {
    selectedClassification.value = classification;
  }

  Color getColor(String classification) {
    return classificationColors[classification] ?? Colors.grey;
  }

  MapEntry<String, double> getBestClassification(Map<String, double> details) {
    if (details.isEmpty) {
      return const MapEntry("Unknown", 0.0);
    }
    return details.entries.reduce(
          (curr, next) => curr.value > next.value ? curr : next,
    );
  }

  RxBool getExpandedState(int analysisId) {
    return _expandedMap.putIfAbsent(analysisId, () => false.obs);
  }


  void toggleExpanded(int analysisId) {
    final state = getExpandedState(analysisId);
    state.value = !state.value;
  }
}
