// Future<void> generateAndSharePdf1() async {
//   final current = patient.value;
//
//   if (current == null) return;
//
//   final arabicFont = await pw.Font.ttf(await rootBundle.load("assets/fonts/Cairo/Cairo-Regular.ttf"));
//
//   pw.Widget buildArabicText(String text, {pw.TextStyle? style}) {
//     return pw.Directionality(
//       textDirection: pw.TextDirection.rtl,
//       child: pw.Text(
//         text,
//         style: style ?? const pw.TextStyle(),
//       ),
//     );
//   }
//
//   final pdf = pw.Document();
//
//   pdf.addPage(
//     pw.MultiPage(
//       theme: pw.ThemeData.withFont(
//         base: arabicFont,
//         bold: arabicFont,
//         italic: arabicFont,
//         boldItalic: arabicFont,
//       ),
//       build: (context) => [
//         buildArabicText('# تقرير المريض: ${current.name}', style: pw.TextStyle(fontSize: 22)),
//         pw.SizedBox(height: 10),
//         buildArabicText('# الاسم: ${current.name}'),
//         buildArabicText('# العمر: ${current.age}'),
//         buildArabicText('# الهاتف: ${current.phone}'),
//         pw.Divider(),
//
//         buildArabicText('# التاريخ المرضي للأسنان:'),
//         buildArabicText(current.dentalHistory ?? "لا يوجد"),
//         pw.SizedBox(height: 10),
//
//         buildArabicText('# الحالات المزمنة:'),
//         if (current.conditions != null && current.conditions!.isNotEmpty)
//           ...current.conditions!.map((c) => buildArabicText('- $c'))
//         else
//           buildArabicText("لا يوجد"),
//         pw.SizedBox(height: 10),
//
//         buildArabicText('# الحساسية:'),
//         buildArabicText(current.allergies ?? "لا يوجد"),
//         pw.SizedBox(height: 10),
//
//         buildArabicText('# الأدوية:'),
//         if (current.medications != null && current.medications!.isNotEmpty)
//           ...current.medications!.map((m) => buildArabicText(
//               '- ${m.name} (${m.dosage}), ${m.timesPerDay} مرات يوميًا، ${m.timeOfDay}, لمدة ${m.duration}. ملاحظات: ${m.notes ?? "لا يوجد"}'
//           ))
//         else
//           buildArabicText("لا يوجد"),
//         pw.SizedBox(height: 10),
//
//         buildArabicText('# العلاجات السنية:'),
//         if (current.treatments != null && current.treatments!.isNotEmpty)
//           ...current.treatments!.map((t) => buildArabicText(
//               '- السن رقم ${t.toothNumber}: ${t.condition}، العلاج: ${t.treatmentType} بتاريخ ${t.treatmentDate.format()}'
//           ))
//         else
//           buildArabicText("لا يوجد"),
//         pw.SizedBox(height: 10),
//
//         buildArabicText('# صور الأشعة:'),
//         if (current.radiographs != null && current.radiographs!.isNotEmpty)
//
//           ...current.radiographs!.map((r) => buildArabicText(
//               '- صورة بتاريخ: ${r.date != null ? '${r.date!.day}/${r.date!.month}/${r.date!.year}' : 'تاريخ غير معروف'}, المسار: ${r.path ?? 'غير متوفر'}'
//           ))
//
//
//         else
//           buildArabicText("لا يوجد"),
//       ],
//     ),
//   );
//
//   final bytes = await pdf.save();
//   final tempDir = await getTemporaryDirectory();
//   final fileName = "report_${current.name.replaceAll(RegExp(r'[^\w\s]+'), '').replaceAll(' ', '_')}.pdf";
//   final file = File("${tempDir.path}/$fileName");
//   await file.writeAsBytes(bytes);
//
//   await Share.shareXFiles([XFile(file.path)], text: "تقرير المريض ${current.name}");
// }
///yes
//yes
///todo yes
// Future<void> generateAndSharePdf1() async {
//   final current = patient.value;
//   if (current == null) return;
//
//   final arabicFont = await pw.Font.ttf(await rootBundle.load("assets/fonts/Cairo/Cairo-Regular.ttf"));
//
//   pw.Widget buildArabicText(String text, {pw.TextStyle? style}) {
//     return pw.Directionality(
//       textDirection: pw.TextDirection.rtl,
//       child: pw.Text(
//         text,
//         style: style ?? const pw.TextStyle(),
//       ),
//     );
//   }
//
//   // نحضّر صور الأشعة
//   List<pw.Widget> radiographWidgets = [];
//
//   if (current.radiographs != null && current.radiographs!.isNotEmpty) {
//     for (final r in current.radiographs!) {
//       try {
//         final imageBytes = await rootBundle.load(r.path!);
//         final image = pw.MemoryImage(imageBytes.buffer.asUint8List());
//
//         radiographWidgets.addAll([
//           buildArabicText(
//               '- صورة بتاريخ: ${r.date != null ? '${r.date!.day}/${r.date!.month}/${r.date!.year}' : 'تاريخ غير معروف'}'),
//           pw.SizedBox(height: 5),
//           pw.Center(child: pw.Image(image, width: 200)),
//           pw.SizedBox(height: 10),
//         ]);
//       } catch (e) {
//         radiographWidgets.addAll([
//           buildArabicText('- فشل في تحميل الصورة (${r.path})'),
//           pw.SizedBox(height: 10),
//         ]);
//       }
//     }
//   } else {
//     radiographWidgets.add(buildArabicText("لا يوجد"));
//   }
//
//   final pdf = pw.Document();
//
//   pdf.addPage(
//     pw.MultiPage(
//       theme: pw.ThemeData.withFont(
//         base: arabicFont,
//         bold: arabicFont,
//         italic: arabicFont,
//         boldItalic: arabicFont,
//       ),
//       build: (context) => [
//         buildArabicText('# تقرير المريض: ${current.name}', style: pw.TextStyle(fontSize: 22)),
//         pw.SizedBox(height: 10),
//         buildArabicText('# الاسم: ${current.name}'),
//         buildArabicText('# العمر: ${current.age}'),
//         buildArabicText('# الهاتف: ${current.phone}'),
//         pw.Divider(),
//
//         buildArabicText('# التاريخ المرضي للأسنان:'),
//         buildArabicText(current.dentalHistory ?? "لا يوجد"),
//         pw.SizedBox(height: 10),
//
//         buildArabicText('# الحالات المزمنة:'),
//         if (current.conditions != null && current.conditions!.isNotEmpty)
//           ...current.conditions!.map((c) => buildArabicText('- $c'))
//         else
//           buildArabicText("لا يوجد"),
//         pw.SizedBox(height: 10),
//
//         buildArabicText('# الحساسية:'),
//         buildArabicText(current.allergies ?? "لا يوجد"),
//         pw.SizedBox(height: 10),
//
//         buildArabicText('# الأدوية:'),
//         if (current.medications != null && current.medications!.isNotEmpty)
//           ...current.medications!.map((m) => buildArabicText(
//               '- ${m.name} (${m.dosage}), ${m.timesPerDay} مرات يوميًا، ${m.timeOfDay}, لمدة ${m.duration}. ملاحظات: ${m.notes ?? "لا يوجد"}'
//           ))
//         else
//           buildArabicText("لا يوجد"),
//         pw.SizedBox(height: 10),
//
//         buildArabicText('# العلاجات السنية:'),
//         if (current.treatments != null && current.treatments!.isNotEmpty)
//           ...current.treatments!.map((t) => buildArabicText(
//               '- السن رقم ${t.toothNumber}: ${t.condition}، العلاج: ${t.treatmentType} بتاريخ ${t.treatmentDate.format()}'
//           ))
//         else
//           buildArabicText("لا يوجد"),
//         pw.SizedBox(height: 10),
//
//         buildArabicText('# صور الأشعة:'),
//         ...radiographWidgets,
//       ],
//     ),
//   );
//
//   final bytes = await pdf.save();
//   final tempDir = await getTemporaryDirectory();
//   final fileName = "report_${current.name.replaceAll(RegExp(r'[^\w\s]+'), '').replaceAll(' ', '_')}.pdf";
//   final file = File("${tempDir.path}/$fileName");
//   await file.writeAsBytes(bytes);
//
//   await Share.shareXFiles([XFile(file.path)], text: "تقرير المريض ${current.name}");
// }
///todo  yes1
//
// Future<void> generateAndSharePdf1() async {
//   final current = patient.value;
//   if (current == null) return;
//
//   final arabicFont = await pw.Font.ttf(await rootBundle.load("assets/fonts/Cairo/Cairo-Regular.ttf"));
//
//   pw.Widget buildArabicText(String text, {pw.TextStyle? style}) {
//     return pw.Directionality(
//       textDirection: pw.TextDirection.rtl,
//       child: pw.Text(
//         text,
//         style: style ?? const pw.TextStyle(),
//       ),
//     );
//   }
//
//   // تجهيز صور الأشعة
//   List<pw.Widget> radiographWidgets = [];
//   if (current.radiographs != null && current.radiographs!.isNotEmpty) {
//     for (final r in current.radiographs!) {
//       try {
//         final imageBytes = await rootBundle.load(r.path!);
//         final image = pw.MemoryImage(imageBytes.buffer.asUint8List());
//
//         radiographWidgets.addAll([
//           buildArabicText('- صورة بتاريخ: ${r.date != null ? '${r.date!.day}/${r.date!.month}/${r.date!.year}' : 'تاريخ غير معروف'}'),
//           pw.SizedBox(height: 5),
//           pw.Center(child: pw.Image(image, width: 200)),
//           pw.SizedBox(height: 10),
//         ]);
//       } catch (e) {
//         radiographWidgets.addAll([
//           buildArabicText('- فشل في تحميل الصورة (${r.path})'),
//           pw.SizedBox(height: 10),
//         ]);
//       }
//     }
//   } else {
//     radiographWidgets.add(buildArabicText("لا يوجد"));
//   }
//
//   // تجهيز صور العلاجات
//   List<pw.Widget> treatmentWidgets = [];
//   if (current.treatments != null && current.treatments!.isNotEmpty) {
//     for (final t in current.treatments!) {
//       try {
//         final imageBytes = await rootBundle.load(t.image);
//         final image = pw.MemoryImage(imageBytes.buffer.asUint8List());
//
//         treatmentWidgets.addAll([
//           buildArabicText(
//               '- السن رقم ${t.toothNumber}: ${t.condition}، العلاج: ${t.treatmentType} بتاريخ ${t.treatmentDate.format()}'),
//           pw.SizedBox(height: 5),
//           pw.Center(child: pw.Image(image, width: 200)),
//           pw.SizedBox(height: 10),
//         ]);
//       } catch (e) {
//         treatmentWidgets.addAll([
//           buildArabicText(
//               '- السن رقم ${t.toothNumber}: ${t.condition}، العلاج: ${t.treatmentType}'),
//           buildArabicText('فشل في تحميل الصورة (${t.image})'),
//           pw.SizedBox(height: 10),
//         ]);
//       }
//     }
//   } else {
//     treatmentWidgets.add(buildArabicText("لا يوجد"));
//   }
//
//   final pdf = pw.Document();
//
//   pdf.addPage(
//     pw.MultiPage(
//       theme: pw.ThemeData.withFont(
//         base: arabicFont,
//         bold: arabicFont,
//         italic: arabicFont,
//         boldItalic: arabicFont,
//       ),
//       build: (context) => [
//         buildArabicText('# تقرير المريض: ${current.name}', style: pw.TextStyle(fontSize: 22)),
//         pw.SizedBox(height: 10),
//         buildArabicText('# الاسم: ${current.name}'),
//         buildArabicText('# العمر: ${current.age}'),
//         buildArabicText('# الهاتف: ${current.phone}'),
//         pw.Divider(),
//
//         buildArabicText('# التاريخ المرضي للأسنان:'),
//         buildArabicText(current.dentalHistory ?? "لا يوجد"),
//         pw.SizedBox(height: 10),
//
//         buildArabicText('# الحالات المزمنة:'),
//         if (current.conditions != null && current.conditions!.isNotEmpty)
//           ...current.conditions!.map((c) => buildArabicText('- $c'))
//         else
//           buildArabicText("لا يوجد"),
//         pw.SizedBox(height: 10),
//
//         buildArabicText('# الحساسية:'),
//         buildArabicText(current.allergies ?? "لا يوجد"),
//         pw.SizedBox(height: 10),
//
//         buildArabicText('# الأدوية:'),
//         if (current.medications != null && current.medications!.isNotEmpty)
//           ...current.medications!.map((m) => buildArabicText(
//               '- ${m.name} (${m.dosage}), ${m.timesPerDay} مرات يوميًا، ${m.timeOfDay}, لمدة ${m.duration}. ملاحظات: ${m.notes ?? "لا يوجد"}'
//           ))
//         else
//           buildArabicText("لا يوجد"),
//         pw.SizedBox(height: 10),
//
//         buildArabicText('# العلاجات السنية:'),
//         ...treatmentWidgets,
//
//         buildArabicText('# صور الأشعة:'),
//         ...radiographWidgets,
//       ],
//     ),
//   );
//
//   final bytes = await pdf.save();
//   final tempDir = await getTemporaryDirectory();
//   final fileName = "report_${current.name.replaceAll(RegExp(r'[^\w\s]+'), '').replaceAll(' ', '_')}.pdf";
//   final file = File("${tempDir.path}/$fileName");
//   await file.writeAsBytes(bytes);
//
//   await Share.shareXFiles([XFile(file.path)], text: "تقرير المريض ${current.name}");
// }

///todo importatn
//
// Future<void> generateAndSharePdf1() async {
//   final current = patient.value;
//   if (current == null) return;
//
//   final arabicFont = await pw.Font.ttf(await rootBundle.load("assets/fonts/Cairo/Cairo-Regular.ttf"));
//
//   pw.TextStyle headingStyle = pw.TextStyle(fontSize: 18, color: PdfColors.blue, font: arabicFont);
//   pw.TextStyle normalStyle = pw.TextStyle(fontSize: 12, font: arabicFont);
//   pw.TextStyle errorStyle = pw.TextStyle(fontSize: 12, color: PdfColors.red, font: arabicFont);
//
//   pw.Widget buildArabicText(String text, {pw.TextStyle? style}) {
//     return pw.Directionality(
//       textDirection: pw.TextDirection.rtl,
//       child: pw.Align(
//         alignment: pw.Alignment.centerRight,
//         child: pw.Text(
//           text,
//           style: style ?? normalStyle,
//         ),
//       ),
//     );
//   }
//
//   // تجهيز صور الأشعة
//   List<pw.Widget> radiographWidgets = [];
//   if (current.radiographs != null && current.radiographs!.isNotEmpty) {
//     for (final r in current.radiographs!) {
//       try {
//         final imageBytes = await rootBundle.load(r.path!);
//         final image = pw.MemoryImage(imageBytes.buffer.asUint8List());
//
//         radiographWidgets.addAll([
//           buildArabicText(
//               '- صورة بتاريخ: ${r.date != null ? '${r.date!.day}/${r.date!.month}/${r.date!.year}' : 'تاريخ غير معروف'}'),
//           pw.SizedBox(height: 5),
//           pw.Center(child: pw.Image(image, width: 200)),
//           pw.SizedBox(height: 10),
//         ]);
//       } catch (e) {
//         radiographWidgets.addAll([
//           buildArabicText('- فشل في تحميل الصورة (${r.path})', style: errorStyle),
//           pw.SizedBox(height: 10),
//         ]);
//       }
//     }
//   } else {
//     radiographWidgets.add(buildArabicText("لا يوجد"));
//   }
//
//   // تجهيز صور العلاجات
//   List<pw.Widget> treatmentWidgets = [];
//   if (current.treatments != null && current.treatments!.isNotEmpty) {
//     for (final t in current.treatments!) {
//       try {
//         final imageBytes = await rootBundle.load(t.image);
//         final image = pw.MemoryImage(imageBytes.buffer.asUint8List());
//
//         treatmentWidgets.addAll([
//           buildArabicText(
//               '- السن رقم ${t.toothNumber}: ${t.condition}، العلاج: ${t.treatmentType} بتاريخ ${t.treatmentDate.format()}'),
//           pw.SizedBox(height: 5),
//           pw.Center(child: pw.Image(image, width: 200)),
//           pw.SizedBox(height: 10),
//         ]);
//       } catch (e) {
//         treatmentWidgets.addAll([
//           buildArabicText(
//               '- السن رقم ${t.toothNumber}: ${t.condition}، العلاج: ${t.treatmentType}'),
//           buildArabicText('فشل في تحميل الصورة (${t.image})', style: errorStyle),
//           pw.SizedBox(height: 10),
//         ]);
//       }
//     }
//   } else {
//     treatmentWidgets.add(buildArabicText("لا يوجد"));
//   }
//
//   final pdf = pw.Document();
//
//   pdf.addPage(
//     pw.MultiPage(
//       theme: pw.ThemeData.withFont(
//         base: arabicFont,
//         bold: arabicFont,
//         italic: arabicFont,
//         boldItalic: arabicFont,
//       ),
//       textDirection: pw.TextDirection.rtl,
//       build: (context) => [
//         buildArabicText('# تقرير المريض: ${current.name}', style: headingStyle),
//         pw.SizedBox(height: 10),
//
//         buildArabicText('الاسم: ${current.name}'),
//         buildArabicText('العمر: ${current.age}'),
//         buildArabicText('الهاتف: ${current.phone}'),
//         pw.Divider(),
//
//         buildArabicText('التاريخ المرضي للأسنان:', style: headingStyle),
//         buildArabicText(current.dentalHistory ?? "لا يوجد"),
//         pw.SizedBox(height: 10),
//
//         buildArabicText('الحالات المزمنة:', style: headingStyle),
//         if (current.conditions != null && current.conditions!.isNotEmpty)
//           ...current.conditions!.map((c) => buildArabicText('- $c'))
//         else
//           buildArabicText("لا يوجد"),
//         pw.SizedBox(height: 10),
//
//         buildArabicText('الحساسية:', style: headingStyle),
//         buildArabicText(current.allergies ?? "لا يوجد"),
//         pw.SizedBox(height: 10),
//
//         buildArabicText('الأدوية:', style: headingStyle),
//         if (current.medications != null && current.medications!.isNotEmpty)
//           ...current.medications!.map((m) => buildArabicText(
//               '- ${m.name} (${m.dosage}), ${m.timesPerDay} مرات يوميًا، ${m.timeOfDay}, لمدة ${m.duration}. ملاحظات: ${m.notes ?? "لا يوجد"}'))
//         else
//           buildArabicText("لا يوجد"),
//         pw.SizedBox(height: 10),
//
//         buildArabicText('العلاجات السنية:', style: headingStyle),
//         ...treatmentWidgets,
//
//         buildArabicText('صور الأشعة:', style: headingStyle),
//         ...radiographWidgets,
//       ],
//     ),
//   );
//
//   final bytes = await pdf.save();
//   final tempDir = await getTemporaryDirectory();
//   final fileName = "report_${current.name.replaceAll(RegExp(r'[^\w\s]+'), '').replaceAll(' ', '_')}.pdf";
//   final file = File("${tempDir.path}/$fileName");
//   await file.writeAsBytes(bytes);
//
//   await Share.shareXFiles([XFile(file.path)], text: "تقرير المريض ${current.name}");
// }
//

