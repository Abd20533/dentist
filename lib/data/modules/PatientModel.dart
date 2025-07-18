


import 'package:dentist/data/modules/ModelMedication.dart';
import 'package:dentist/data/modules/ModelRadiograph.dart';
import 'package:dentist/data/modules/ModelTreatment.dart';

class PatientModel {
  final String name;
  final String age;
  final String? phone;
  final List<String>? conditions;
  final List<Medication>? medications;

  final String? allergies;
  final String? dentalHistory;
  final List<ToothTreatmentModel>? treatments;
  final List<Radiograph>? radiographs;
  final String image;

  PatientModel({
    required this.name,
    required this.age,
    this.phone,
    this.conditions,
    this.medications,
    this.allergies,
    this.dentalHistory,
    this.treatments,
    this.radiographs,
    String? image,
  }) : image = image ?? "assets/images/person5.jpg";


  PatientModel copyWith({
    String? name,
    String? age,
    String? phone,
    List<String>? conditions,
    List<Medication>? medications,
    String? allergies,
    String? dentalHistory,
    List<ToothTreatmentModel>? treatments,
    List<Radiograph>? radiographs,
  }) {
    return PatientModel(
      name: name ?? this.name,
      age: age ?? this.age,
      phone: phone ?? this.phone,
      conditions: conditions ?? this.conditions,
      medications: medications ?? this.medications,
      allergies: allergies ?? this.allergies,
      dentalHistory: dentalHistory ?? this.dentalHistory,
      treatments: treatments ?? this.treatments,
      radiographs: radiographs ?? this.radiographs,
    );
}
}