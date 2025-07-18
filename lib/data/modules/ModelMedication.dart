
class Medication {
  final String name;         // اسم الدواء
  final String? dosage;      // الجرعة
  final int? timesPerDay;    // كم مرة يوميًا
  final String? timeOfDay;   // متى (صباحًا، مساءً...)
  final String? duration;    // مدة العلاج (أسبوع، شهر...)
  final String? notes;       // ملاحظات إضافية

  Medication({
    required this.name,
    this.dosage,
    this.timesPerDay,
    this.timeOfDay,
    this.duration,
    this.notes,
  });
}
