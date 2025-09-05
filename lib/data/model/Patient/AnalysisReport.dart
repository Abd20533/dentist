import 'package:dentist/core/constant/app_link_api.dart';
import 'package:dentist/data/model/Patient/FindingModel.dart';

class AnalysisReport {
  final int id;
  final int patient;
  final String summary;
  final String annotatedImage;
  final int radiograph;
  final String createdAt;
  final List<Finding> findings;

  AnalysisReport({
    required this.id,
    required this.patient,
    required this.summary,
    required this.annotatedImage,
    required this.radiograph,
    required this.createdAt,
    required this.findings,
  });

  factory AnalysisReport.fromJson(Map<String, dynamic> json) {
    return AnalysisReport(
      id: json['id'],
      patient: json['patient'],
      summary: json['summary'],
      // annotatedImage: "http://10.224.142.209:8000${json['annotated_image']}",
      annotatedImage:"${AppLinkApi.urlServerImage}${json['annotated_image']}",

      // annotatedImage: "http://10.224.142.209:8000${json['annotated_image']}",
      radiograph: json['radiograph'],
      createdAt: json['created_at'],
      findings: (json['findings'] as List)
          .map((e) => Finding.fromJson(e))
          .toList(),
    );
  }

  /// 🔹 تحويل الكائن إلى JSON
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "patient": patient,
      "summary": summary,
      "annotated_image": annotatedImage,
      "radiograph": radiograph,
      "created_at": createdAt,
      "findings": findings.map((e) => e.toJson()).toList(),
    };
  }
}
