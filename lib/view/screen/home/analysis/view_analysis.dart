
import 'package:dentist/controller/home/analysis_reports/analysis_reports_controller.dart';
import 'package:dentist/model/Patient/AnalysisReport.dart';
import 'package:dentist/my_import.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewAnalysis extends StatelessWidget {
  final String patientId;

  const ViewAnalysis({super.key, required this.patientId});

  @override
  Widget build(BuildContext context) {
    final PatientController patientController = Get.find<PatientController>();
    final AnalysisController analysisController = Get.put(AnalysisController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        final patient = patientController.patientsPostMan
            .firstWhere((p) => p.id.toString() == patientId);

        final radiographs = patient.radiographs ?? [];
        final analysisReports = patient.analysisReports ?? [];

        if (radiographs.isEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              BuildSectionHeader(
                title: "Analysis",
                icon: Icons.arrow_forward,
                onAdd: () => Get.back(),
              ),
              Expanded(
                child: Center(
                  child: SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: LottieBuilder.asset(
                      "assets/Lottie/empty.json",
                      repeat: true,
                    ),
                  ),
                ),
              ),
            ],
          );
        }

        return SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),
              BuildSectionHeader(
                title: "Analysis",
                icon: Icons.arrow_forward,
                onAdd: () => Get.back(),
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                separatorBuilder: (context, index) => const SizedBox(height: 30),
                padding: const EdgeInsets.all(12),
                itemCount: radiographs.length,
                itemBuilder: (_, index) {
                  final r = radiographs[index];
                  final relatedAnalysis = analysisReports
                      .firstWhereOrNull((a) => a.radiograph == r.id);

                  return _buildRadiographCard(
                      r, relatedAnalysis, analysisController, context);
                },
              ),
              const SizedBox(height: 100),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildRadiographCard(
      RadiographModel r,
      AnalysisReport? relatedAnalysis,
      AnalysisController analysisController,
      BuildContext context,
      ) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(width: 2, color: Colors.grey),
      ),
      elevation: 4,
      shadowColor: Colors.teal.shade200,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Text("🦷 صورة بتاريخ ${r.date ?? 'غير معروف'}",
                style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),

            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                r.photo,
                width: MediaQuery.of(context).size.width * 0.8,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 12),

            if (relatedAnalysis != null) ...[
              Text("نتيجة التحليل (${relatedAnalysis.createdAt})",
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w600)),
              const SizedBox(height: 10),

              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  relatedAnalysis.annotatedImage,
                  width: MediaQuery.of(context).size.width * 0.8,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 12),

              Obx(() {
                final isExpanded = analysisController
                    .getExpandedState(relatedAnalysis.id)
                    .value;

                return Column(
                  children: [
                    InkWell(
                      onTap: () => analysisController
                          .toggleExpanded(relatedAnalysis.id),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "عدد الأسنان المصابة: ${relatedAnalysis.findings.length}",
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 14),
                          ),
                          const SizedBox(width: 8),
                          Icon(
                            isExpanded
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            color: Colors.teal,
                          ),
                        ],
                      ),
                    ),

                    if (isExpanded) ...[
                      const SizedBox(height: 10),
                      ...relatedAnalysis.findings.map((f) {
                        final bestEntry = analysisController
                            .getBestClassification(f.classificationDetails);

                        final bestClass = bestEntry.key;
                        final bestConfidence = bestEntry.value;
                        final color =
                        analysisController.getColor(bestClass);

                        return Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: const BorderSide(
                                width: 2, color: Colors.grey),
                          ),
                          elevation: 4,
                          shadowColor: Colors.teal.shade200,
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: color,
                              radius: 15,
                            ),
                            title: Text(
                              "Tooth: $bestClass (${(bestConfidence * 100).toStringAsFixed(1)}%)",
                              style: const TextStyle(fontSize: 14),
                            ),
                            subtitle: Text(
                              "Detection: ${f.detectionClass} "
                                  "(${(f.detectionConfidence * 100).toStringAsFixed(1)}%)",
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.black54),
                            ),
                          ),
                        );
                      }),
                    ]
                  ],
                );
              }),
            ] else
              const Text("❌ لا يوجد تحليل لهذه الأشعة الى الان",
                  style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }
}
