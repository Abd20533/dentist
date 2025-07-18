
import 'package:dentist/controller/home/ViewPatientController.dart';
import 'package:dentist/data/modules/ModelTreatment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
class PatientDetailsPage extends StatelessWidget {
  final ViewPatientController controller = Get.put(ViewPatientController());

  PatientDetailsPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        foregroundColor: Colors.black,
        title: const Text(
          "تفاصيل المريض",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        final patient = controller.patient.value;
        if (patient == null) {
          return const Center(child: CircularProgressIndicator());
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(patient.image),
              ),
              const SizedBox(height: 16),
              Text(
                patient.name,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              _infoRow("العمر", patient.age),
              _infoRow("الهاتف", patient.phone ?? "لا يوجد"),
              const Divider(height: 32),

              // قسم الأمراض المزمنة مع زر إضافة
              _sectionTitle("الأمراض المزمنة"),
              if (patient.conditions != null && patient.conditions!.isNotEmpty)
                Column(
                  children: patient.conditions!
                      .map((c) => Row(
                    children: [
                      const Icon(Icons.circle, size: 6),
                      const SizedBox(width: 6),
                      Text(c),
                    ],
                  ))
                      .toList(),
                )
              else
                _emptyText(),
              const SizedBox(height: 8),
              ElevatedButton.icon(
                onPressed: () => controller.showAddConditionDialog(),
                icon: const Icon(Icons.add),
                label: const Text("إضافة مرض مزمن"),
              ),

              const Divider(height: 32),

              // قسم العلاجات السنية مع زر إضافة
              _sectionTitle("العلاجات السنية"),
              if (patient.treatments != null && patient.treatments!.isNotEmpty)
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: patient.treatments!.map((t) => _buildToothCard(t)).toList(),
                )
              else
                _emptyText(),
              const SizedBox(height: 8),
              ElevatedButton.icon(
                onPressed: () => controller.showAddTreatmentDialog(),
                icon: const Icon(Icons.add),
                label: const Text("إضافة علاج سنّي"),
              ),

              const SizedBox(height: 32),
              Obx(() {
                final meds = controller.patient.value?.medications ?? [];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "الأدوية:",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade800,
                      ),
                    ),
                    SizedBox(height: 8),
                    if (meds.isEmpty)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Text(
                          "لا يوجد أدوية حالياً",
                          style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                        ),
                      ),
                      ...meds.map((m) => Card(
                      margin: EdgeInsets.symmetric(vertical: 6),
                      elevation: 2,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${m.name} (${m.dosage})",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.blue.shade700,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              "${m.timesPerDay} مرات يوميًا، ${m.timeOfDay}, لمدة ${m.duration}",
                              style: TextStyle(fontSize: 14, color: Colors.grey.shade800),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "ملاحظات: ${m.notes?.isNotEmpty == true ? m.notes : '-'}",
                              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.grey.shade600),
                            ),
                          ],
                        ),
                      ),
                    )),
                    SizedBox(height: 20),
                    Center(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          controller.showAddMedicationDialog();
                        },
                        icon: Icon(Icons.add),
                        label: Text("إضافة دواء جديد"),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          // backgroundColor: Colors.blue.shade600,
                          elevation: 5,
                        ),
                      ),
                    ),
                  ],
                );
              }),

              const SizedBox(height: 32),

              ElevatedButton(
                onPressed: () {
                  controller.generateAndSharePdf();
                },
                child: const Text("تحميل تقرير PDF"),
              )
            ],
          ),
        );
      }),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$label: ",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _emptyText() {
    return const Text("لا يوجد", style: TextStyle(color: Colors.grey));
  }

  Widget _buildToothCard(ToothTreatmentModel treatment) {
    final formattedDate = DateFormat.yMMMd().format(treatment.treatmentDate);

    return Card(
      elevation: 3,
      shadowColor: Colors.grey.shade300,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        width: 140,
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Image.asset(treatment.image, width: 120, height: 80, fit: BoxFit.cover),
            const SizedBox(height: 8),
            Text("سن رقم: ${treatment.toothNumber}"),
            Text("الحالة: ${treatment.condition}"),
            Text("العلاج: ${treatment.treatmentType}"),
            Text("التاريخ: $formattedDate"),
                        CircleAvatar(
              radius: 6,
              backgroundColor: treatment.color,
            ),
          ],
        ),
      ),
    );
  }

}
