


// {
// "id": 6,
// "analysis_reports": [],
// "doctor": "abd saleh",
// "allergies": [],
// "name": "abdalrhman",
// "phone": "0930888872",
// "gender": "male",
// "dental_history": null,
// "image": null,
// "age": 22
// },


import 'package:dentist/model/Patient/AllergiesModel.dart';
import 'package:dentist/model/Patient/AnalysisReport.dart';
import 'package:dentist/model/Patient/ConditionModel.dart';
import 'package:dentist/model/Patient/MedicationModel.dart';
import 'package:dentist/model/Patient/RadiographModel.dart';
import 'package:dentist/model/Patient/ToothTreatmentModel.dart';

class PatientModel {
  final int id;
  final String name;
  final int age;
  final String? phone;
  final String? dentalHistory;
  final String? image;
  final String? gender;
  final String doctor;

  final List<Medication>? medications;
  final List<AllergiesModel>? allergies;
  final List<ToothTreatmentModel>? treatments;
  // final List<RadiographModel>? radiographs;
   List<RadiographModel>? radiographs;
  final List<ConditionModel>? conditions;
   List<AnalysisReport>? analysisReports;
  // final List<AnalysisReport>? analysisReports;

  PatientModel({
    required this.id,
    required this.name,
    required this.age,
    required this.doctor,
    this.phone,
    this.gender,
    this.allergies,
    this.dentalHistory,
    this.image,
     this.medications,
     this.treatments,
     this.radiographs,
     this.conditions,
     this.analysisReports,
  });

  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return PatientModel(
      id: json['id'],
      name: json['name'],
      age: json['age'],
      phone: json['phone'],
      dentalHistory: json['dental_history'],
      // image: (json['image']=="" ||json['image']==null)?"assets/images/person4.jpg": json['image'],
      image: (json['image']=="" ||json['image']==null)?"assets/images/logo/logoTooth.png": json['image'],
      doctor: json['doctor'],
      gender: json['gender'],

      medications: (json['medications'] as List)
          .map((e) => Medication.fromJson(e))
          .toList(),

      allergies: (json['allergies'] as List)
          .map((e) => AllergiesModel.fromJson(e))
          .toList(),


      treatments: (json['treatments'] as List)
          .map((e) => ToothTreatmentModel.fromJson(e))
          .toList(),
      radiographs: (json['radiographs'] as List)
          .map((e) => RadiographModel.fromJson(e))
          .toList(),
      conditions: (json['conditions'] as List)
          .map((e) => ConditionModel.fromJson(e))
          .toList(),
      analysisReports: (json['analysis_reports'] as List)
          .map((e) => AnalysisReport.fromJson(e))
          .toList(),
    );
  }


  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "age": age,
      "phone": phone,
      "gender": gender,
      "doctor": doctor,
      "allergies": allergies,
      "dental_history": dentalHistory,
      "image": image,
      "medications": medications?.map((e) => e.toJson()).toList(),
      "treatments": treatments?.map((e) => e.toJson()).toList(),
      "radiographs": radiographs?.map((e) => e.toJson()).toList(),
      "conditions": conditions?.map((e) => e.toJson()).toList(),
      "analysis_reports": analysisReports?.map((e) => e.toJson()).toList(),
    };
  }


  static List<PatientModel> fromJsonList(List<dynamic> data) {
    return data.map((item) => PatientModel.fromJson(item)).toList();
  }
}
