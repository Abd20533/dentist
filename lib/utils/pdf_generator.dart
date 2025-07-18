// import 'dart:io';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:permission_handler/permission_handler.dart';
// import '../data/modules/PatientModel.dart';
//
// class PDFGenerator {
//   static Future<File> generatePatientPdf(PatientModel patient) async {
//     final pdf = pw.Document();
//
//     // 1. طلب الصلاحيات
//     if (!await Permission.storage.request().isGranted) {
//       throw Exception('لم يتم منح صلاحية الوصول للتخزين');
//     }
//
//     // 2. توليد المحتوى
//
//
//
//     pdf.addPage(
//       pw.MultiPage(
//         build: (context) => [
//           pw.Text("معلومات المريض", style: pw.TextStyle(fontSize: 20)),
//           pw.SizedBox(height: 10),
//           pw.Text("الاسم: ${patient.name}"),
//           pw.Text("العمر: ${patient.age}"),
//           pw.Text("الهاتف: ${patient.phone}"),
//           pw.Text("الأمراض المزمنة: ${patient.conditions?.join(', ') ?? 'لا يوجد'}"),
//           pw.Text("الحساسية: ${patient.allergies}"),
//           pw.Text("التاريخ السني: ${patient.dentalHistory}"),
//           pw.SizedBox(height: 10),
//
//           pw.Text("الأدوية:", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//           ...patient.medications.map(
//                 (med) => pw.Bullet(
//                 text: "${med.name} - ${med.dosage} - ${med.timesPerDay} مرات يوميًا - ${med.timeOfDay} - لمدة ${med.duration} - ملاحظات: ${med.notes}"
//             ),
//           ).toList(),
//
//           pw.SizedBox(height: 10),
//           pw.Text("العلاجات:", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//           ...patient.treatments.map(
//                 (t) => pw.Bullet(
//                 text: "سن رقم ${t.toothNumber} - ${t.condition} - علاج: ${t.treatmentType} - التاريخ: ${t.treatmentDate.toLocal()}"
//             ),
//           ).toList(),
//
//           pw.SizedBox(height: 10),
//           pw.Text("صور الأشعة:", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//           ...patient.radiographs.map(
//                 (r) => pw.Bullet(
//                 text: "صورة بتاريخ: ${r.date.toLocal()}"
//             ),
//           ).toList(),
//         ],
//       ),
//     );
//
//
//
//
//     // 3. تخزين الملف في مجلد التنزيلات
//     final downloadDir = Directory('/storage/emulated/0/Download');
//     final fileName = '${patient.name.replaceAll(" ", "_")}_report.pdf';
//     final file = File('${downloadDir.path}/$fileName');
//     await file.writeAsBytes(await pdf.save());
//     return file;
//   }
// }
