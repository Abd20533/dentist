class ConditionModel {
  final int id;
  final String name;
  final String? notes;
  final String dateAdded;
  final int patient;

  ConditionModel({
    required this.id,
    required this.name,
    this.notes,
    required this.dateAdded,
    required this.patient,
  });

  factory ConditionModel.fromJson(Map<String, dynamic> json) {
    return ConditionModel(
      id: json['id'],
      name: json['name'],
      notes: json['notes'],
      dateAdded: json['date_added'],
      patient: json['patient'],
    );
  }

  /// 🔹 لتحويل الكائن إلى JSON
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "notes": notes,
      "date_added": dateAdded,
      "patient": patient,
    };
  }
}
