import 'package:dentist/core/constant/app_link_api.dart';

class ToothTreatmentModel {
  final int id;
  final String? image;
  final String condition;
  final String color;
  final String? treatmentType;
  final String? toothNumber;
  final String? photo;
  final String treatmentDate;
  final int patient;

  ToothTreatmentModel({
    required this.id,
    this.image,
    required this.condition,
    required this.color,
    this.treatmentType,
     this.toothNumber,
    this.photo,
    required this.treatmentDate,
    required this.patient,
  });

  factory ToothTreatmentModel.fromJson(Map<String, dynamic> json) {
    return ToothTreatmentModel(
      id: json['id'],
      image: json['image'],
      condition: json['condition'],
      color: json['color'],
      treatmentType: json['treatment_type'],
      toothNumber: json['tooth_number'],
      // photo: json['photo'],
      // photo:"${AppLinkApi.urlServerImage}${json['photo']}",
      photo: (json['photo']=="" ||json['photo']==null)?"assets/images/logo/logoTooth.png": json['photo'],

      // photo: (json['photo']=="" ||json['photo']==null)?"D:/FlutterProject/dentist/assets/images/logo/logoTooth.png":"${AppLinkApi.urlServerImage}${json['photo']}",

      // photo: (json['photo']=="" ||json['photo']==null)?"${AppLinkApi.urlServerImage}assets/images/logo/logoTooth.png": json['photo'],

      treatmentDate: json['treatment_date'],
      patient: json['patient'],
    );
  }


  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "image": image,
      "condition": condition,
      "color": color,
      "treatment_type": treatmentType,
      "tooth_number": toothNumber,
      "photo": photo,
      "treatment_date": treatmentDate,
      "patient": patient,
    };
  }
}
