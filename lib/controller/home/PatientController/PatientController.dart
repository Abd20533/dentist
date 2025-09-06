import 'dart:io';
import 'package:dentist/model/Patient/PatientModel.dart';
import 'package:dentist/my_import.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:printing/printing.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:pdf/pdf.dart';
import 'package:share_plus/share_plus.dart';

import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/widgets.dart' as pw;
class PatientController extends GetxController {


  late RxList<PatientModel> patientsPostMan = <PatientModel>[].obs;

  final Rx<StatusRequest> statusRequest = StatusRequest.none.obs;
  GetPatientsData submitData = GetPatientsData(crud: Get.find());
  int i=0;




  final RxBool isLoading = false.obs;

  final RxString errorMessage = ''.obs;
  final int maxVisible = 4;

  final Map<String, PdfColor> classificationColors = {
    'Cavity': PdfColors.red,
    'Fillings': PdfColors.green,
    'Implant': PdfColors.blue,
    'Impacted Tooth': PdfColors.yellow,
  };


  Future<void> getPatients(


      ) async {
    // await CashHelper.putUser(userToken: "");


      isLoading(true);
      errorMessage('');
      statusRequest.value = StatusRequest.loading;
      await submitData.getData(

      ).then((value) async {



        if (value.statusCode == 200) {
          patientsPostMan.assignAll(PatientModel.fromJsonList(value.data));

          statusRequest.value = StatusRequest.success;

          print("_________________________patientsPostMan length: ${patientsPostMan.length}");
          print("statusRequest: ${statusRequest.value}");
        } else {
          statusRequest.value = StatusRequest.serverFailure;
        }
        isLoading(false);


        print("patientsPostMan length: ${patientsPostMan.length}");
        print("statusRequest: ${statusRequest.value}");

        update();

      }).catchError((error) {
        isLoading(false);

        print(error.toString());
        print("_______________________statusRequest____________________: ${statusRequest.value}");
        statusRequest.value = StatusRequest.serverFailure;


        update();

      });



  }





  void deletePatient({
    required String patientId,
  }) async {


    await submitData.deletePatient(
      patient_id: patientId,
    ).then((value) async {
      if (value.statusCode <= 300 && value.statusCode >= 199) {
        statusRequest.value = handlingDataController(value.data);
        statusRequest.value = StatusRequest.success;

        await getPatients();


        Get.snackbar("نجاح", "تمت حذف المريض  بنجاح");
      }
      else{
      Get.snackbar("فشل", "لم تتم حذف المريض  بنجاح");}

    }).catchError((error) {

      isLoading(false);
      statusRequest.value = StatusRequest.serverFailure;
      Get.snackbar("فشل", error.toString());



      update();

    });
  }



  Future<void> callDirect(String phoneNumber) async {
    var status = await Permission.phone.request();

    if (status.isGranted) {
      final Uri uri = Uri(scheme: "tel", path: phoneNumber);

      try {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } catch (e) {
        Get.snackbar("خطأ", "فشل الاتصال: $e");
      }
    } else {
      Get.snackbar("رفض الصلاحية", "يجب منح صلاحية الاتصال لإجراء مكالمات مباشرة");
    }
  }


  Future<void> callPatient(String phoneNumber) async {
    final Uri uri = Uri.parse("tel:$phoneNumber");

    try {
      bool launched = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication, // يفتح تطبيق الاتصال
      );

      if (!launched) {
        Get.snackbar("خطأ", "تعذر فتح شاشة الاتصال");
      }
    } catch (e) {
      Get.snackbar("خطأ", "لا يمكن فتح شاشة الاتصال: $e");
    }
  }


  @override
  void onInit() {
    getPatients();


    super.onInit();
  }

  Future<void> generateAndSharePdf(int patientId) async {
    // 🔹 جلب المريض من الكنترول
    final current = patientsPostMan.firstWhereOrNull((p) => p.id == patientId);
    if (current == null) {
      Get.snackbar("خطأ", "لم يتم العثور على المريض بالرقم $patientId");
      return;
    }

    final arabicFont = await pw.Font.ttf(await rootBundle.load("assets/fonts/Cairo/Cairo-Regular.ttf"));
    final arabicBoldFont = await pw.Font.ttf(await rootBundle.load("assets/fonts/Cairo/Cairo-Bold.ttf"));

    pw.TextStyle headingStyle = pw.TextStyle(fontSize: 16, color: PdfColors.teal, font: arabicBoldFont);
    pw.TextStyle normalStyle = pw.TextStyle(fontSize: 12, font: arabicFont);
    pw.TextStyle errorStyle = pw.TextStyle(fontSize: 12, color: PdfColors.red, font: arabicFont);




    pw.Widget buildArabic(String text, {pw.TextStyle? style}) {
      return pw.Directionality(
        textDirection: pw.TextDirection.rtl,
        child: pw.Align(
          alignment: pw.Alignment.centerRight,
          child: pw.Text(text, style: style ?? normalStyle),
        ),
      );
    }

    final medicationWidgets = <pw.Widget>[];
    if (current.medications != null && current.medications!.isNotEmpty) {
      for (var m in current.medications!) {
        medicationWidgets.add(buildArabic(
            "- ${m.name} (${m.dosage ?? ''}), ${m.timesPerDay ?? ''} مرات/يوم، ${m.duration ?? ''}, ملاحظات: ${m.notes ?? 'لا يوجد'}"));
      }
    } else {
      medicationWidgets.add(buildArabic("لا يوجد"));
    }

    final allergyWidgets = <pw.Widget>[];
    if (current.allergies != null && current.allergies!.isNotEmpty) {
      for (var a in current.allergies!) {
        allergyWidgets.add(buildArabic("- ${a.name} ${a.description ?? ''}"));
      }
    } else {
      allergyWidgets.add(buildArabic("لا يوجد"));
    }

    final conditionWidgets = <pw.Widget>[];
    if (current.conditions != null && current.conditions!.isNotEmpty) {
      for (var c in current.conditions!) {
        conditionWidgets.add(buildArabic("- ${c.name} (${c.dateAdded}) ${c.notes ?? ''}"));
      }
    } else {
      conditionWidgets.add(buildArabic("لا يوجد"));
    }

    final treatmentWidgets = <pw.Widget>[];
    if (current.treatments != null && current.treatments!.isNotEmpty) {
      for (var t in current.treatments!) {
        try {
          treatmentWidgets.addAll([
            buildArabic("- السن: ${t.toothNumber ?? 'غير محدد'}  "),
            buildArabic(" نوع العلاج  |  ${t.treatmentType ?? ''}"),
            buildArabic("-  بتاريخ ${t.treatmentDate})"),
            pw.SizedBox(height: 5),
            pw.SizedBox(height: 10),
          ]);
        } catch (e) {
          treatmentWidgets.add(buildArabic("- ${t.condition} (${t.treatmentDate}) [فشل تحميل الصورة]", style: errorStyle));
        }
      }
    } else {
      treatmentWidgets.add(buildArabic("لا يوجد"));
    }

    // ✅ الأشعة + التحليل مع بعض
    final radiographWithAnalysisWidgets = <pw.Widget>[];
    if (current.radiographs != null && current.radiographs!.isNotEmpty) {
      for (var r in current.radiographs!) {
        try {
          final imageBytes = await networkImage(r.photo);

          // صورة الأشعة
          radiographWithAnalysisWidgets.addAll([
            buildArabic(" <<<-  صورة أشعة بتاريخ ${r.date ?? 'غير معروف'}"),
            pw.SizedBox(height: 5),
            pw.Center(child: pw.Image(imageBytes, width: 200)),
            pw.SizedBox(height: 10),
          ]);

          // 🔹 ربط مع تقرير التحليل
          final relatedAnalysis = current.analysisReports
              ?.firstWhereOrNull((a) => a.radiograph == r.id);

          if (relatedAnalysis != null) {
            try {
              final annotatedBytes = await networkImage(relatedAnalysis.annotatedImage);

              radiographWithAnalysisWidgets.addAll([


                buildArabic(" نتيجة التحليل (${relatedAnalysis.createdAt})", style: headingStyle),



    buildArabic("- تقرير بتاريخ ${relatedAnalysis.createdAt}"),
    buildArabic(" عدد الاكتشافات الاسنان  المصابة و نتائجها: ${relatedAnalysis.findings.length}"),



                pw.SizedBox(height: 5),
                pw.Center(child: pw.Image(annotatedBytes, width: 200)),
                pw.SizedBox(height: 10),
                buildArabic("الأسنان المصابة:", style: headingStyle),
              ]);

              int i = 0;
              for (var f in relatedAnalysis.findings) {
                i++;
                if (f.classificationDetails.isNotEmpty) {
                  final bestEntry = f.classificationDetails.entries.reduce(
                        (curr, next) => curr.value > next.value ? curr : next,
                  );

                  final bestClass = bestEntry.key;
                  final bestConfidence = bestEntry.value;
                  final classColor = classificationColors[bestClass] ?? PdfColors.grey;

                  radiographWithAnalysisWidgets.add(
                    pw.Row(
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children: [
                        pw.Container(
                          width: 20,
                          height: 20,
                          decoration: pw.BoxDecoration(
                            color: classColor,
                            shape: pw.BoxShape.circle,
                          ),
                        ),
                        pw.SizedBox(width: 8),

                        buildArabic(
                          " السن :$i",
                          style: normalStyle,
                        ),


                        buildArabic( "classification is:   $bestClass (${(bestConfidence * 100).toStringAsFixed(1)}%) ", style: normalStyle,),
                        // classification


                        buildArabic(
                          "---------------------- ",
                          style: normalStyle,
                        ),
                        buildArabic(
                          "  detectionClass is : ${f.detectionClass} ",
                          style: normalStyle,
                        ),




                      ],
                    ),
                  );
                  radiographWithAnalysisWidgets.add(pw.SizedBox(height: 6));
                }
              }
            } catch (e) {
              radiographWithAnalysisWidgets.add(buildArabic(
                "- فشل تحميل صورة التحليل (${relatedAnalysis.annotatedImage})",
                style: errorStyle,
              ));
            }
          } else {
            radiographWithAnalysisWidgets.add(buildArabic("❌ لا يوجد تحليل لهذه الأشعة"));
          }

          radiographWithAnalysisWidgets.add(pw.Divider());
        } catch (e) {
          radiographWithAnalysisWidgets.add(buildArabic("- فشل تحميل صورة (${r.photo})", style: errorStyle));
        }
      }
    } else {
      radiographWithAnalysisWidgets.add(buildArabic("لا يوجد"));
    }




    final logoBytes = await rootBundle.load("assets/images/logo/it.png",);
    final logoImage = pw.MemoryImage(logoBytes.buffer.asUint8List());
    final logoBytes1 = await rootBundle.load("assets/images/logo/ite.png",);
    final logoImage1 = pw.MemoryImage(logoBytes1.buffer.asUint8List());


    // إنشاء PDF
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        theme: pw.ThemeData.withFont(base: arabicFont, bold: arabicBoldFont),
        textDirection: pw.TextDirection.rtl,
        build: (context) => [
          buildArabic("# تقرير المريض: ${current.name}", style: headingStyle),
          pw.SizedBox(height: 10),
          buildArabic("الاسم: ${current.name}"),
          buildArabic("العمر: ${current.age}"),
          buildArabic("الهاتف: ${current.phone ?? '---'}"),
          buildArabic("الطبيب: ${current.doctor}"),
          buildArabic("الجنس: ${current.gender ?? '---'}"),
          pw.Divider(),

          buildArabic("التاريخ المرضي:", style: headingStyle),
          buildArabic(current.dentalHistory ?? "لا يوجد"),
          pw.SizedBox(height: 10),

          buildArabic("الأدوية:", style: headingStyle),
          ...medicationWidgets,
          pw.SizedBox(height: 10),

          buildArabic("الحساسية:", style: headingStyle),
          ...allergyWidgets,
          pw.SizedBox(height: 10),

          buildArabic("الحالات المزمنة:", style: headingStyle),
          ...conditionWidgets,
          pw.SizedBox(height: 10),

          buildArabic("العلاجات:", style: headingStyle),
          ...treatmentWidgets,
          pw.SizedBox(height: 10),

          buildArabic("الأشعة + التحليل:", style: headingStyle),
          ...radiographWithAnalysisWidgets,
          pw.SizedBox(height: 10),

          pw.Divider(thickness: 2, color: PdfColors.teal),
          // pw.SizedBox(height: 15),
          pw.SizedBox(height: 300),
          pw.Center(
            child: pw.Column(
              children: [


                buildArabic("جامعة دمشق",
                    style: pw.TextStyle(
                        font: arabicBoldFont, fontSize: 12, color: PdfColors.grey800)),
                buildArabic("اختصاص: ذكاء اصطناعي",
                    style: pw.TextStyle(
                        font: arabicBoldFont, fontSize: 12, color: PdfColors.teal700)),

                buildArabic("المهندس: عبدالرحمن صالح",
                    style: pw.TextStyle(
                        font: arabicBoldFont, fontSize: 13, color: PdfColors.black)),
                pw.SizedBox(height: 20),
                pw.Text("هذا الملف خاص ",
                    style: pw.TextStyle(
                        font: arabicBoldFont, fontSize: 14, color: PdfColors.teal)),

                pw.SizedBox(height: 10),

                // توقيع/شعار بسيط
                pw.Container(
                  width: 100,
                  height: 40,
                  decoration: pw.BoxDecoration(
                    border: pw.Border.all(color: PdfColors.teal, width: 2),
                    borderRadius: pw.BorderRadius.circular(8),
                  ),
                  child: pw.Center(
                    child: pw.Text("AS",
                        style: pw.TextStyle(
                            fontSize: 20,
                            font: arabicBoldFont,
                            color: PdfColors.teal)),
                  ),


                ),
                pw.SizedBox(height: 100),

                pw.Center(
                  child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.center, // لتوسيط الصور في الصفحة
                    children: [
                      pw.Image(logoImage, width: 120),
                      pw.SizedBox(width: 100), // المسافة بين الصورتين
                      pw.Image(logoImage1, width: 120),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );

    // حفظ ومشاركة
    final bytes = await pdf.save();
    final tempDir = await getTemporaryDirectory();
    final file = File("${tempDir.path}/report_${current.name}_${current.id}.pdf");
    await file.writeAsBytes(bytes);

    await Share.shareXFiles([XFile(file.path)], text: "تقرير المريض ${current.name}");
  }


}













