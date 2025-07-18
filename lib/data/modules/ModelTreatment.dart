
import 'package:flutter/material.dart';

class ToothTreatmentModel {
  final String image;            // صورة السن
  final String condition;        // حالة السن (مثل نخر، سليم...)
  final Color color;             // لون يدل على الحالة (أخضر، أحمر...)
  final String? treatmentType;   // نوع العلاج (قلع، حشو، معالجة...)
  final String? toothNumber;     // رقم السن المعالج
  final DateTime treatmentDate;  // تاريخ المعالجة (إجباري بعد التعديل)

  ToothTreatmentModel({
    required this.image,
    required this.condition,
    required this.color,
    this.treatmentType,
    this.toothNumber,
    DateTime? treatmentDate, // يستقبل قيمة اختيارية
  }) : treatmentDate = treatmentDate ?? DateTime.now(); // إذا لم تُرسل، استخدم التاريخ الحالي

  factory ToothTreatmentModel.fromMap(Map<String, dynamic> map) {
    return ToothTreatmentModel(
      image: map['image'] ?? '',
      condition: map['condition'] ?? '',
      color: map['color'] ?? Colors.grey,
      treatmentType: map['treatmentType'],
      toothNumber: map['toothNumber'],
      treatmentDate: map['treatmentDate'] != null
          ? DateTime.parse(map['treatmentDate'])
          : null, // سيتم استبداله تلقائيًا في الـ constructor
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'condition': condition,
      'color': color,
      'treatmentType': treatmentType,
      'toothNumber': toothNumber,
      'treatmentDate': treatmentDate.toIso8601String(),
    };
  }
  ToothTreatmentModel copyWith({
    String? image,
    String? condition,
    Color? color,
    String? treatmentType,
    String? toothNumber,
    DateTime? treatmentDate,
  }) {
    return ToothTreatmentModel(
      image: image ?? this.image,
      condition: condition ?? this.condition,
      color: color ?? this.color,
      treatmentType: treatmentType ?? this.treatmentType,
      toothNumber: toothNumber ?? this.toothNumber,
      treatmentDate: treatmentDate ?? this.treatmentDate,
    );
  }
}
