
class Radiograph {
  final String? path;
  final DateTime? date;

  Radiograph({
    this.path,
    this.date,
  });

  Map<String, dynamic> toMap() {
    return {
      'path': path,
      'date': date?.toIso8601String(),
    };
  }

  factory Radiograph.fromMap(Map<String, dynamic> map) {
    return Radiograph(
      path: map['path'],
      date: map['date'] != null ? DateTime.parse(map['date']) : null,
    );
  }
}
