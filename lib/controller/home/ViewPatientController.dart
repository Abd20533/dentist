
import 'package:pdf/pdf.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/widgets.dart' as pw;

import 'package:dentist/data/modules/ModelMedication.dart';
import 'package:dentist/data/modules/ModelRadiograph.dart';
import 'package:dentist/data/modules/ModelTreatment.dart';
import 'package:dentist/data/modules/PatientModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
extension DateFormatHelper on DateTime {
  String format() => "${day}/${month}/${year}";
}


class ViewPatientController extends GetxController {
  final Rx<PatientModel?> patient = Rx<PatientModel?>(null);

  // TextEditingControllers
  final TextEditingController conditionController = TextEditingController();
  final TextEditingController toothNumberController = TextEditingController();
  final TextEditingController treatmentTypeController = TextEditingController();
  final TextEditingController conditionTreatmentController = TextEditingController();



  final TextEditingController medNameController = TextEditingController();
  final TextEditingController medDosageController = TextEditingController();
  final TextEditingController medTimesPerDayController = TextEditingController();
  final TextEditingController medTimeOfDayController = TextEditingController();
  final TextEditingController medDurationController = TextEditingController();
  final TextEditingController medNotesController = TextEditingController();

  void showAddMedicationDialog() {
    medNameController.clear();
    medDosageController.clear();
    medTimesPerDayController.clear();
    medTimeOfDayController.clear();
    medDurationController.clear();
    medNotesController.clear();

    Get.dialog(
      AlertDialog(
        title: const Text("إضافة دواء جديد"),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: medNameController,
                decoration: const InputDecoration(labelText: "اسم الدواء"),
              ),
              TextField(
                controller: medDosageController,
                decoration: const InputDecoration(labelText: "الجرعة (مثلاً: 500mg)"),
              ),
              TextField(
                controller: medTimesPerDayController,
                decoration: const InputDecoration(labelText: "عدد مرات الاستخدام يوميًا"),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: medTimeOfDayController,
                decoration: const InputDecoration(labelText: "وقت الاستخدام (مثلاً: صباحًا ومساءً)"),
              ),
              TextField(
                controller: medDurationController,
                decoration: const InputDecoration(labelText: "مدة الاستخدام (مثلاً: 3 أشهر)"),
              ),
              TextField(
                controller: medNotesController,
                decoration: const InputDecoration(labelText: "ملاحظات إضافية (اختياري)"),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text("إلغاء"),
          ),
          ElevatedButton(
            onPressed: () {
              final name = medNameController.text.trim();
              final dosage = medDosageController.text.trim();
              final timesPerDayText = medTimesPerDayController.text.trim();
              final timeOfDay = medTimeOfDayController.text.trim();
              final duration = medDurationController.text.trim();
              final notes = medNotesController.text.trim();

              if (name.isNotEmpty &&
                  dosage.isNotEmpty &&
                  timesPerDayText.isNotEmpty &&
                  timeOfDay.isNotEmpty &&
                  duration.isNotEmpty) {
                final timesPerDay = int.tryParse(timesPerDayText) ?? 1;
                final newMed = Medication(
                  name: name,
                  dosage: dosage,
                  timesPerDay: timesPerDay,
                  timeOfDay: timeOfDay,
                  duration: duration,
                  notes: notes.isEmpty ? null : notes,
                );
                final currentMeds = patient.value?.medications ?? [];
                patient.value = patient.value?.copyWith(
                  medications: [...currentMeds, newMed],
                );
                patient.refresh();
                Get.back();
              }
            },
            child: const Text("إضافة"),
          ),
        ],
      ),
    );
  }



  @override
  void onInit() {
    super.onInit();
    patient.value = PatientModel(
      name: "محمود أحمد",
      age: "35",
      phone: "0999999999",
      conditions: ["سكري", "ضغط دم مرتفع"],
      medications: [
        Medication(
          name: "Metformin",
          dosage: "500mg",
          timesPerDay: 2,
          timeOfDay: "صباحًا ومساءً",
          duration: "3 أشهر",
          notes: "يؤخذ بعد الطعام",
        ),
      ],
      allergies: "حساسية من البنسلين",
      dentalHistory: "تم خلع ضرس العقل العلوي قبل عامين بسبب التسوس",
      treatments: [
        ToothTreatmentModel(
          image: "assets/images/t1.jpg",
          condition: "تسوس",
          color: Colors.red,
          treatmentType: "حشو ضوئي",
          toothNumber: "14",
          treatmentDate: DateTime.now().subtract(const Duration(days: 30)),
        ),
        ToothTreatmentModel(
          image: "assets/images/t1.jpg",
          condition: "تسوس",
          color: Colors.red,
          treatmentType: "حشو ضوئي",
          toothNumber: "14",
          treatmentDate: DateTime.now().subtract(const Duration(days: 30)),
        ),
        ToothTreatmentModel(
          image: "assets/images/t2.jpg",
          condition: "ملتهب",
          color: Colors.orange,
          treatmentType: "سحب عصب",
          toothNumber: "12",
          treatmentDate: DateTime.now().subtract(const Duration(days: 15)),
        ),
        ToothTreatmentModel(
          image: "assets/images/t2.jpg",
          condition: "مصاب",
          color: Colors.grey,
          treatmentType: "سحب عصب",
          toothNumber: "7",
          treatmentDate: DateTime.now().subtract(const Duration(days: 15)),
        ),
        ToothTreatmentModel(
          image: "assets/images/t2.jpg",
          condition: "تسوس",
          color: Colors.red,
          treatmentType: "سحب عصب",
          toothNumber: "19",
          treatmentDate: DateTime.now().subtract(const Duration(days: 15)),
        ),
      ],
      radiographs: [
        Radiograph(
          path: "assets/images/t2.jpg",
          date: DateTime.now().subtract(const Duration(days: 60)),
        ),
      ],
    );
  }

  // دالة لتحديث الحالات المزمنة
  void updateConditions(List<String> updatedConditions) {
    final current = patient.value;
    if (current != null) {
      patient.value = current.copyWith(conditions: updatedConditions);
      patient.refresh(); // ضروري لإخبار الواجهة بالتغيير
    }
  }

  Future<void> generateAndSharePdf() async {
    final current = patient.value;
    if (current == null) return;

    final arabicFont = await pw.Font.ttf(await rootBundle.load("assets/fonts/Cairo/Cairo-Regular.ttf"));
    final arabicBoldFont = await pw.Font.ttf(await rootBundle.load("assets/fonts/Cairo/Cairo-Bold.ttf"));


    pw.TextStyle headingStyle1 = pw.TextStyle(fontSize: 18, color: PdfColors.blue, font: arabicBoldFont);

    pw.TextStyle headingStyle = pw.TextStyle(fontSize: 18, color: PdfColors.blue, font: arabicFont);
    pw.TextStyle normalStyle = pw.TextStyle(fontSize: 12, font: arabicFont);
    pw.TextStyle errorStyle = pw.TextStyle(fontSize: 12, color: PdfColors.red, font: arabicFont);

    pw.Widget buildArabicText(String text, {pw.TextStyle? style}) {
      return pw.Directionality(
        textDirection: pw.TextDirection.rtl,
        child: pw.Align(
          alignment: pw.Alignment.centerRight,
          child: pw.Text(
            text,
            style: style ?? normalStyle,
          ),
        ),
      );
    }

    // تجهيز صور الأشعة
    List<pw.Widget> radiographWidgets = [];
    if (current.radiographs != null && current.radiographs!.isNotEmpty) {
      for (final r in current.radiographs!) {
        try {
          final imageBytes = await rootBundle.load(r.path!);
          final image = pw.MemoryImage(imageBytes.buffer.asUint8List());

          radiographWidgets.addAll([
            buildArabicText(
                '- صورة بتاريخ: ${r.date != null ? '${r.date!.day}/${r.date!.month}/${r.date!.year}' : 'تاريخ غير معروف'}'),
            pw.SizedBox(height: 5),
            pw.Center(child: pw.Image(image, width: 200)),
            pw.SizedBox(height: 10),
          ]);
        } catch (e) {
          radiographWidgets.addAll([
            buildArabicText('- فشل في تحميل الصورة (${r.path})', style: errorStyle),
            pw.SizedBox(height: 10),
          ]);
        }
      }
    } else {
      radiographWidgets.add(buildArabicText("لا يوجد"));
    }

    // تجهيز صور العلاجات
    List<pw.Widget> treatmentWidgets = [];
    if (current.treatments != null && current.treatments!.isNotEmpty) {
      for (final t in current.treatments!) {
        try {
          final imageBytes = await rootBundle.load(t.image);
          final image = pw.MemoryImage(imageBytes.buffer.asUint8List());

          treatmentWidgets.addAll([
            buildArabicText(
                '- السن رقم ${t.toothNumber}: ${t.condition}، العلاج: ${t.treatmentType} بتاريخ ${t.treatmentDate.format()}'),
            pw.SizedBox(height: 5),
            pw.Center(child: pw.Image(image, width: 200)),
            pw.SizedBox(height: 10),
          ]);
        } catch (e) {
          treatmentWidgets.addAll([
            buildArabicText(
                '- السن رقم ${t.toothNumber}: ${t.condition}، العلاج: ${t.treatmentType}'),
            buildArabicText('فشل في تحميل الصورة (${t.image})', style: errorStyle),
            pw.SizedBox(height: 10),
          ]);
        }
      }
    } else {
      treatmentWidgets.add(buildArabicText("لا يوجد"));
    }

    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        theme: pw.ThemeData.withFont(
          base: arabicFont,
          bold: arabicFont,
          italic: arabicFont,
          boldItalic: arabicFont,
        ),
        textDirection: pw.TextDirection.rtl,
        build: (context) => [
          buildArabicText('# تقرير المريض: ${current.name}', style: headingStyle),
          pw.SizedBox(height: 10),

          buildArabicText('الاسم: ${current.name}'),
          buildArabicText('العمر: ${current.age}'),
          buildArabicText('الهاتف: ${current.phone}'),
          pw.Divider(),

          buildArabicText('التاريخ المرضي للأسنان:', style: headingStyle),
          buildArabicText(current.dentalHistory ?? "لا يوجد"),
          pw.SizedBox(height: 10),

          buildArabicText('الحالات المزمنة:', style: headingStyle),
          if (current.conditions != null && current.conditions!.isNotEmpty)
            ...current.conditions!.map((c) => buildArabicText('- $c'))
          else
            buildArabicText("لا يوجد"),
          pw.SizedBox(height: 10),

          buildArabicText('الحساسية:', style: headingStyle),
          buildArabicText(current.allergies ?? "لا يوجد"),
          pw.SizedBox(height: 10),

          buildArabicText('الأدوية:', style: headingStyle),
          if (current.medications != null && current.medications!.isNotEmpty)
            ...current.medications!.map((m) => buildArabicText(
                '- ${m.name} (${m.dosage}), ${m.timesPerDay} مرات يوميًا، ${m.timeOfDay}, لمدة ${m.duration}. ملاحظات: ${m.notes ?? "لا يوجد"}'))
          else
            buildArabicText("لا يوجد"),
          pw.SizedBox(height: 10),

          buildArabicText('العلاجات السنية:', style: headingStyle),
          ...treatmentWidgets,

          buildArabicText('صور الأشعة:', style: headingStyle),
          ...radiographWidgets,

          pw.Divider(),

          // بيانات الدكتور والمعلومات الإضافية
          buildArabicText('معلومات الطبيب:', style: headingStyle1),
          buildArabicText('الاسم: الدكتور مهران مخلوف'),
          buildArabicText('التخرج من: جامعة دمشق، 2012'),
          buildArabicText('المكان: درعا'),
          buildArabicText('رقم التواصل: 0999xxxxxx'), // يمكنك تعديل الرقم أو حذفه
          buildArabicText('ملاحظات إضافية: هذا التقرير صادر بناءً على الفحص الطبي في العيادة.'),
          pw.SizedBox(height: 5),
          buildArabicText('اختصاصي جراحة الفم والوجه والفكين'),
          buildArabicText('عضو الجمعية السورية لجراحة الوجه والفكين'),
          buildArabicText('رقم الترخيص: 2012-د-4567'),
          pw.SizedBox(height: 15),
        ],
      ),
    );

    final bytes = await pdf.save();
    final tempDir = await getTemporaryDirectory();
    final fileName = "report${current.name}_${current.name.replaceAll(RegExp(r'[^\w\s]+'), '').replaceAll(' ', '_')}.pdf";
    final file = File("${tempDir.path}/$fileName");
    await file.writeAsBytes(bytes);

    await Share.shareXFiles([XFile(file.path)], text: "تقرير المريض ${current.name}");
  }


  // دالة لتحديث العلاجات السنية
  void updateTreatments(List<ToothTreatmentModel> updatedTreatments) {
    final current = patient.value;
    if (current != null) {
      patient.value = current.copyWith(treatments: updatedTreatments);
      patient.refresh();
    }
  }

  void showAddConditionDialog() {
    conditionController.clear();

    Get.dialog(
      AlertDialog(
        title: const Text("إضافة مرض مزمن"),
        content: TextField(
          controller: conditionController,
          decoration: const InputDecoration(
            labelText: "اسم المرض",
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text("إلغاء"),
          ),
          ElevatedButton(
            onPressed: () {
              final newCondition = conditionController.text.trim();
              if (newCondition.isNotEmpty) {
                final currentConditions = patient.value?.conditions ?? [];
                final updatedConditions = List<String>.from(currentConditions)..add(newCondition);
                updateConditions(updatedConditions);
                Get.back();
              }
            },
            child: const Text("إضافة"),
          ),
        ],
      ),
    );
  }






  void showAddTreatmentDialog() {
    toothNumberController.clear();
    treatmentTypeController.clear();
    conditionTreatmentController.clear();

    Color selectedColor = Colors.blue;

    Get.dialog(
      StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          title: const Text("إضافة علاج سنّي"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: toothNumberController,
                  decoration: const InputDecoration(labelText: "رقم السن"),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: conditionTreatmentController,
                  decoration: const InputDecoration(labelText: "الحالة (مثلاً: تسوس، ملتهب)"),
                ),
                TextField(
                  controller: treatmentTypeController,
                  decoration: const InputDecoration(labelText: "نوع العلاج (مثلاً: حشو ضوئي)"),
                ),
                const SizedBox(height: 12),

                // عرض اختيار اللون
                Align(
                  alignment: Alignment.centerRight,
                  child: Text("اختر لون العلاج:", style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 8),

                Wrap(
                  spacing: 8,
                  children: [
                    _colorCircle(Colors.red, selectedColor, () {
                      setState(() => selectedColor = Colors.red);
                    }),
                    _colorCircle(Colors.orange, selectedColor, () {
                      setState(() => selectedColor = Colors.orange);
                    }),
                    _colorCircle(Colors.yellow, selectedColor, () {
                      setState(() => selectedColor = Colors.yellow);
                    }),
                    _colorCircle(Colors.green, selectedColor, () {
                      setState(() => selectedColor = Colors.green);
                    }),
                    _colorCircle(Colors.blue, selectedColor, () {
                      setState(() => selectedColor = Colors.blue);
                    }),
                    _colorCircle(Colors.purple, selectedColor, () {
                      setState(() => selectedColor = Colors.purple);
                    }),
                    _colorCircle(Colors.grey, selectedColor, () {
                      setState(() => selectedColor = Colors.grey);
                    }),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: const Text("إلغاء"),
            ),
            ElevatedButton(
              onPressed: () {
                final toothNum = toothNumberController.text.trim();
                final condition = conditionTreatmentController.text.trim();
                final treatmentType = treatmentTypeController.text.trim();

                if (toothNum.isNotEmpty && condition.isNotEmpty && treatmentType.isNotEmpty) {
                  final currentTreatments = patient.value?.treatments ?? [];

                  final newTreatment = ToothTreatmentModel(
                    image: "assets/images/t2.jpg",
                    condition: condition,
                    color: selectedColor,  // هنا نحفظ اللون المختار
                    treatmentType: treatmentType,
                    toothNumber: toothNum,
                    treatmentDate: DateTime.now(),
                  );

                  final updatedTreatments = List<ToothTreatmentModel>.from(currentTreatments)
                    ..add(newTreatment);

                  updateTreatments(updatedTreatments);
                  Get.back();
                }
              },
              child: const Text("إضافة"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _colorCircle(Color color, Color selectedColor, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
            color: color == selectedColor ? Colors.black : Colors.transparent,
            width: 2,
          ),
        ),
      ),
    );
  }






  @override
  void onClose() {
    conditionController.dispose();
    toothNumberController.dispose();
    treatmentTypeController.dispose();
    conditionTreatmentController.dispose();

    medNameController.dispose();
    medDosageController.dispose();
    medTimesPerDayController.dispose();
    medTimeOfDayController.dispose();
    medDurationController.dispose();
    medNotesController.dispose();
    // باقي dispose الموجودين مسبقاً
    super.onClose();
  }
}



