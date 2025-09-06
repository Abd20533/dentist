class Finding {
  final int id;
  final String detectionClass;
  final double detectionConfidence;
  final String classificationClass;
  final double classificationConfidence;
  final Map<String, double> classificationDetails;
  final List<int> bbox;

  Finding({
    required this.id,
    required this.detectionClass,
    required this.detectionConfidence,
    required this.classificationClass,
    required this.classificationConfidence,
    required this.classificationDetails,
    required this.bbox,
  });

  factory Finding.fromJson(Map<String, dynamic> json) {
    return Finding(
      id: json['id'],
      detectionClass: json['detection_class'],
      detectionConfidence: (json['detection_confidence'] as num).toDouble(),
      classificationClass: json['classification_class'],
      classificationConfidence:
      (json['classification_confidence'] as num).toDouble(),
      classificationDetails: Map<String, double>.from(
        (json['classification_details'] as Map).map(
              (key, value) => MapEntry(key, (value as num).toDouble()),
        ),
      ),
      bbox: List<int>.from(json['bbox']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "detection_class": detectionClass,
      "detection_confidence": detectionConfidence,
      "classification_class": classificationClass,
      "classification_confidence": classificationConfidence,
      "classification_details": classificationDetails,
      "bbox": bbox,
    };
  }
}
