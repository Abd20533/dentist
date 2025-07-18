
///    todo no delete controller 3########################################################

// class ViewPatientController1 extends GetxController {
//   final Rx<PatientModel?> patient = Rx<PatientModel?>(null);
//
//   @override
//   void onInit() {
//     super.onInit();
//     patient.value = PatientModel(
//       name: "محمود أحمد",
//       age: "35",
//       phone: "0999999999",
//       conditions: ["سكري", "ضغط دم مرتفع"],
//       medications: [
//         Medication(
//           name: "Metformin",
//           dosage: "500mg",
//           timesPerDay: 2,
//           timeOfDay: "صباحًا ومساءً",
//           duration: "3 أشهر",
//           notes: "يؤخذ بعد الطعام",
//         ),
//       ],
//       allergies: "حساسية من البنسلين",
//       dentalHistory: "تم خلع ضرس العقل العلوي قبل عامين بسبب التسوس",
//       treatments: [
//         ToothTreatmentModel(
//           image: "assets/images/t1.jpg",
//           condition: "تسوس",
//           color: Colors.red,
//           treatmentType: "حشو ضوئي",
//           toothNumber: "14",
//           treatmentDate: DateTime.now().subtract(const Duration(days: 30)),
//         ),
//
//
//         ToothTreatmentModel(
//           image: "assets/images/t1.jpg",
//           condition: "تسوس",
//           color: Colors.red,
//           treatmentType: "حشو ضوئي",
//           toothNumber: "14",
//           treatmentDate: DateTime.now().subtract(const Duration(days: 30)),
//         ),
//         ToothTreatmentModel(
//           image: "assets/images/t2.jpg",
//           condition: "ملتهب",
//           color: Colors.orange,
//           treatmentType: "سحب عصب",
//           toothNumber: "12",
//           treatmentDate: DateTime.now().subtract(const Duration(days: 15)),
//         ),
//         ToothTreatmentModel(
//           image: "assets/images/t2.jpg",
//           condition: "مصاب",
//           color: Colors.grey,
//           treatmentType: "سحب عصب",
//           toothNumber: "7",
//           treatmentDate: DateTime.now().subtract(const Duration(days: 15)),
//         ),
//         ToothTreatmentModel(
//           image: "assets/images/t2.jpg",
//           condition: "تسوس",
//           color: Colors.red,
//           treatmentType: "سحب عصب",
//           toothNumber: "19",
//           treatmentDate: DateTime.now().subtract(const Duration(days: 15)),
//         ),
//       ],
//       radiographs: [
//         Radiograph(
//           path: "assets/images/t2.jpg",
//           date: DateTime.now().subtract(const Duration(days: 60)),
//         ),
//       ],
//     );
//   }
//
//   void updateName(String newName) {
//     final current = patient.value;
//     if (current != null) {
//       patient.value = current.copyWith(name: newName);
//     }
//   }
//
//   void updateAge(String newAge) {
//     final current = patient.value;
//     if (current != null) {
//       patient.value = current.copyWith(age: newAge);
//     }
//   }
//
//   void updatePhone(String newPhone) {
//     final current = patient.value;
//     if (current != null) {
//       patient.value = current.copyWith(phone: newPhone);
//     }
//   }
//
//   void updateConditions(List<String> newConditions) {
//     final current = patient.value;
//     if (current != null) {
//       patient.value = current.copyWith(conditions: newConditions);
//     }
//   }
//
//   void updateMedications(List<Medication> newMedications) {
//     final current = patient.value;
//     if (current != null) {
//       patient.value = current.copyWith(medications: newMedications);
//     }
//   }
//
//   void updateRadiographs(List<Radiograph> newRads) {
//     final current = patient.value;
//     if (current != null) {
//       patient.value = current.copyWith(radiographs: newRads);
//     }
//   }
//
//   void updateTreatments(List<ToothTreatmentModel> newTreatments) {
//     final current = patient.value;
//     if (current != null) {
//       patient.value = current.copyWith(treatments: newTreatments);
//     }
//   }
//
//   void updateDentalHistory(String newHistory) {
//     final current = patient.value;
//     if (current != null) {
//       patient.value = current.copyWith(dentalHistory: newHistory);
//     }
//   }
//
//   void updateAllergies(String newAllergy) {
//     final current = patient.value;
//     if (current != null) {
//       patient.value = current.copyWith(allergies: newAllergy);
//     }
//   }
//
//   Future<void> generateAndSharePdf() async {
//     final current = patient.value;
//     if (current == null) return;
//
//     final arabicFont = await pw.Font.ttf(await rootBundle.load("assets/fonts/Cairo/Cairo-Regular.ttf"));
//     final arabicBoldFont = await pw.Font.ttf(await rootBundle.load("assets/fonts/Cairo/Cairo-Bold.ttf"));
//
//
//     pw.TextStyle headingStyle1 = pw.TextStyle(fontSize: 18, color: PdfColors.blue, font: arabicBoldFont);
//
//     pw.TextStyle headingStyle = pw.TextStyle(fontSize: 18, color: PdfColors.blue, font: arabicFont);
//     pw.TextStyle normalStyle = pw.TextStyle(fontSize: 12, font: arabicFont);
//     pw.TextStyle errorStyle = pw.TextStyle(fontSize: 12, color: PdfColors.red, font: arabicFont);
//
//     pw.Widget buildArabicText(String text, {pw.TextStyle? style}) {
//       return pw.Directionality(
//         textDirection: pw.TextDirection.rtl,
//         child: pw.Align(
//           alignment: pw.Alignment.centerRight,
//           child: pw.Text(
//             text,
//             style: style ?? normalStyle,
//           ),
//         ),
//       );
//     }
//
//     // تجهيز صور الأشعة
//     List<pw.Widget> radiographWidgets = [];
//     if (current.radiographs != null && current.radiographs!.isNotEmpty) {
//       for (final r in current.radiographs!) {
//         try {
//           final imageBytes = await rootBundle.load(r.path!);
//           final image = pw.MemoryImage(imageBytes.buffer.asUint8List());
//
//           radiographWidgets.addAll([
//             buildArabicText(
//                 '- صورة بتاريخ: ${r.date != null ? '${r.date!.day}/${r.date!.month}/${r.date!.year}' : 'تاريخ غير معروف'}'),
//             pw.SizedBox(height: 5),
//             pw.Center(child: pw.Image(image, width: 200)),
//             pw.SizedBox(height: 10),
//           ]);
//         } catch (e) {
//           radiographWidgets.addAll([
//             buildArabicText('- فشل في تحميل الصورة (${r.path})', style: errorStyle),
//             pw.SizedBox(height: 10),
//           ]);
//         }
//       }
//     } else {
//       radiographWidgets.add(buildArabicText("لا يوجد"));
//     }
//
//     // تجهيز صور العلاجات
//     List<pw.Widget> treatmentWidgets = [];
//     if (current.treatments != null && current.treatments!.isNotEmpty) {
//       for (final t in current.treatments!) {
//         try {
//           final imageBytes = await rootBundle.load(t.image);
//           final image = pw.MemoryImage(imageBytes.buffer.asUint8List());
//
//           treatmentWidgets.addAll([
//             buildArabicText(
//                 '- السن رقم ${t.toothNumber}: ${t.condition}، العلاج: ${t.treatmentType} بتاريخ ${t.treatmentDate.format()}'),
//             pw.SizedBox(height: 5),
//             pw.Center(child: pw.Image(image, width: 200)),
//             pw.SizedBox(height: 10),
//           ]);
//         } catch (e) {
//           treatmentWidgets.addAll([
//             buildArabicText(
//                 '- السن رقم ${t.toothNumber}: ${t.condition}، العلاج: ${t.treatmentType}'),
//             buildArabicText('فشل في تحميل الصورة (${t.image})', style: errorStyle),
//             pw.SizedBox(height: 10),
//           ]);
//         }
//       }
//     } else {
//       treatmentWidgets.add(buildArabicText("لا يوجد"));
//     }
//
//     final pdf = pw.Document();
//
//     pdf.addPage(
//       pw.MultiPage(
//         theme: pw.ThemeData.withFont(
//           base: arabicFont,
//           bold: arabicFont,
//           italic: arabicFont,
//           boldItalic: arabicFont,
//         ),
//         textDirection: pw.TextDirection.rtl,
//         build: (context) => [
//           buildArabicText('# تقرير المريض: ${current.name}', style: headingStyle),
//           pw.SizedBox(height: 10),
//
//           buildArabicText('الاسم: ${current.name}'),
//           buildArabicText('العمر: ${current.age}'),
//           buildArabicText('الهاتف: ${current.phone}'),
//           pw.Divider(),
//
//           buildArabicText('التاريخ المرضي للأسنان:', style: headingStyle),
//           buildArabicText(current.dentalHistory ?? "لا يوجد"),
//           pw.SizedBox(height: 10),
//
//           buildArabicText('الحالات المزمنة:', style: headingStyle),
//           if (current.conditions != null && current.conditions!.isNotEmpty)
//             ...current.conditions!.map((c) => buildArabicText('- $c'))
//           else
//             buildArabicText("لا يوجد"),
//           pw.SizedBox(height: 10),
//
//           buildArabicText('الحساسية:', style: headingStyle),
//           buildArabicText(current.allergies ?? "لا يوجد"),
//           pw.SizedBox(height: 10),
//
//           buildArabicText('الأدوية:', style: headingStyle),
//           if (current.medications != null && current.medications!.isNotEmpty)
//             ...current.medications!.map((m) => buildArabicText(
//                 '- ${m.name} (${m.dosage}), ${m.timesPerDay} مرات يوميًا، ${m.timeOfDay}, لمدة ${m.duration}. ملاحظات: ${m.notes ?? "لا يوجد"}'))
//           else
//             buildArabicText("لا يوجد"),
//           pw.SizedBox(height: 10),
//
//           buildArabicText('العلاجات السنية:', style: headingStyle),
//           ...treatmentWidgets,
//
//           buildArabicText('صور الأشعة:', style: headingStyle),
//           ...radiographWidgets,
//
//           pw.Divider(),
//
//           // بيانات الدكتور والمعلومات الإضافية
//           buildArabicText('معلومات الطبيب:', style: headingStyle1),
//           buildArabicText('الاسم: الدكتور مهران مخلوف'),
//           buildArabicText('التخرج من: جامعة دمشق، 2012'),
//           buildArabicText('المكان: درعا'),
//           buildArabicText('رقم التواصل: 0999xxxxxx'), // يمكنك تعديل الرقم أو حذفه
//           buildArabicText('ملاحظات إضافية: هذا التقرير صادر بناءً على الفحص الطبي في العيادة.'),
//           pw.SizedBox(height: 5),
//           buildArabicText('اختصاصي جراحة الفم والوجه والفكين'),
//           buildArabicText('عضو الجمعية السورية لجراحة الوجه والفكين'),
//           buildArabicText('رقم الترخيص: 2012-د-4567'),
//           pw.SizedBox(height: 15),
//         ],
//       ),
//     );
//
//     final bytes = await pdf.save();
//     final tempDir = await getTemporaryDirectory();
//     final fileName = "report${current.name}_${current.name.replaceAll(RegExp(r'[^\w\s]+'), '').replaceAll(' ', '_')}.pdf";
//     final file = File("${tempDir.path}/$fileName");
//     await file.writeAsBytes(bytes);
//
//     await Share.shareXFiles([XFile(file.path)], text: "تقرير المريض ${current.name}");
//   }
//
//
// }






///todo no delete PatientDetailsPage 3########################################################

//
// import 'package:dentist/controller/home/ViewPatientController.dart';
// import 'package:dentist/data/modules/ModelTreatment.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
//
// class PatientDetailsPage extends StatelessWidget {
//   final ViewPatientController controller = Get.put(ViewPatientController());
//
//   PatientDetailsPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//
//         backgroundColor: Colors.white,
//         elevation: 2,
//
//         foregroundColor: Colors.black,
//         // shadowColor: Colors.white,
//         title: const Text(
//           "تفاصيل المريض",
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//       ),
//       body: Obx(() {
//         final patient = controller.patient.value;
//         if (patient == null) {
//           return const Center(child: CircularProgressIndicator());
//         }
//
//         return SingleChildScrollView(
//
//           padding: const EdgeInsets.all(16),
//           child: Column(
//
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               // صورة المريض
//               CircleAvatar(
//                 radius: 60,
//                 backgroundImage: AssetImage(patient.image),
//               ),
//               const SizedBox(height: 16),
//
//               // الاسم والعمر
//               Text(
//                 patient.name,
//                 style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 4),
//               _infoRow("العمر", patient.age),
//               _infoRow("الهاتف", patient.phone ?? "لا يوجد"),
//               const Divider(height: 32),
//
//               // الأمراض المزمنة
//               _sectionTitle("الأمراض المزمنة"),
//               if (patient.conditions != null && patient.conditions!.isNotEmpty)
//                 Column(
//                   children: patient.conditions!
//                       .map((c) => Row(
//                     children: [
//                       const Icon(Icons.circle, size: 6),
//                       const SizedBox(width: 6),
//                       Text(c),
//                     ],
//                   ))
//                       .toList(),
//                 )
//               else
//                 _emptyText(),
//
//               const Divider(height: 32),
//
//               // العلاجات السنية
//               _sectionTitle("العلاجات السنية"),
//               if (patient.treatments != null && patient.treatments!.isNotEmpty)
//                 Wrap(
//                   spacing: 12,
//                   runSpacing: 12,
//                   children: patient.treatments!.map((t) => _buildToothCard(t)).toList(),
//                 )
//               else
//                 _emptyText(),
//
//               const SizedBox(height: 32),
//
//               ElevatedButton(
//                 onPressed: () {
//                   Get.find<ViewPatientController>().generateAndSharePdf();
//                   // Get.find<ViewPatientController>().generateAndSavePdf();
//                 },
//                 child: Text("تحميل تقرير PDF"),
//               )
//
//             ],
//           ),
//         );
//       }),
//     );
//   }
//
//   Widget _infoRow(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             "$label: ",
//             style: const TextStyle(fontWeight: FontWeight.bold),
//           ),
//           Text(value),
//         ],
//       ),
//     );
//   }
//
//   Widget _sectionTitle(String title) {
//     return Align(
//       alignment: Alignment.centerRight,
//       child: Text(
//         title,
//         style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//       ),
//     );
//   }
//
//   Widget _emptyText() {
//     return const Text("لا يوجد", style: TextStyle(color: Colors.grey));
//   }
//
//   Widget _buildToothCard(ToothTreatmentModel treatment) {
//     final formattedDate = DateFormat.yMMMd().format(treatment.treatmentDate);
//
//     return Card(
//       elevation: 3,
//       shadowColor: Colors.grey.shade300,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Container(
//         width: 140,
//         padding: const EdgeInsets.all(8),
//         child: Column(
//           children: [
//             Image.asset(treatment.image, height: 60),
//             const SizedBox(height: 6),
//             _toothInfo("السن", treatment.toothNumber ?? "؟"),
//             _toothInfo("الحالة", treatment.condition),
//             _toothInfo("العلاج", treatment.treatmentType ?? "لا يوجد"),
//             _toothInfo("التاريخ", formattedDate),
//             const SizedBox(height: 4),
//             CircleAvatar(
//               radius: 6,
//               backgroundColor: treatment.color,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _toothInfo(String label, String value) {
//     return Text(
//       "$label: $value",
//       style: const TextStyle(fontSize: 12),
//       textAlign: TextAlign.center,
//     );
//   }
// }
//
//
//



