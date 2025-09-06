import 'package:dentist/core/constant/app_link_api.dart';

class RadiographModel {
  final int id;
  final String photo;
  final String ?date;
  final int patient;

  RadiographModel({
    required this.id,
    required this.photo,
     this.date,
    required this.patient,
  });

  factory RadiographModel.fromJson(Map<String, dynamic> json) {
    return RadiographModel(
      id: json['id'],
      //AppLinkApi.urlServer
      // photo:"http://10.224.142.209:8000${json['photo']}",
      photo:"${AppLinkApi.urlServerImage}${json['photo']}",
      date: json['date'],
      patient: json['patient'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "photo": photo,
      "date": date,
      "patient": patient,
    };
  }

}
