class Medication {
  final int id;
  final String name;
  final String? dosage;
  final dynamic timesPerDay;
  final String? timeOfDay;
  final String? duration;
  final String? notes;
  final int patient;

  Medication({
    required this.id,
    required this.name,
    this.dosage,
    this.timesPerDay,
    this.timeOfDay,
    this.duration,
    this.notes,
    required this.patient,
  });

  factory Medication.fromJson(Map<String, dynamic> json) {
    return Medication(
      id: json['id'],
      name: json['name'],
      dosage: json['dosage'],
      timesPerDay: json['times_per_day'],
      timeOfDay: json['time_of_day'],
      duration: json['duration'],
      notes: json['notes'],
      patient: json['patient'],
    );

  }


  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "dosage": dosage,
      "times_per_day": timesPerDay,
      "time_of_day": timeOfDay,
      "duration": duration,
      "notes": notes,
      "patient": patient,
    };
  }

}
