import 'package:dentist/view/screen/home/Medication/HelpMedical.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dentist/my_import.dart';

class ViewMedical extends StatelessWidget {
  final String patientId;

  const ViewMedical({super.key, required this.patientId});

  @override
  Widget build(BuildContext context) {
    final PatientController patientController = Get.find<PatientController>();
    final MedicationsController medController =
    Get.put(MedicationsController(
        ));

    return Scaffold(
      


      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.white,
        onPressed: () {
          medController.addMedication(context, patientId: patientId);

        },
        icon: Icon(Icons.medical_information, color: Colors.teal.shade300),
        label: const Text(
          "إضافة دواء",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),


backgroundColor: Colors.white,

      body: Obx(() {
        final patient = patientController.patientsPostMan
            .firstWhere((p) => p.id.toString() == patientId);

        final medications = patient.medications ?? [];


        if (medications.isEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              BuildSectionHeader(
                title: "أدوية ",

                icon: FontAwesomeIcons.arrowRight,
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
                // title: "Tooth Treatments",
                title: "أدوية ",

                icon: FontAwesomeIcons.arrowRight,
                onAdd: () => Get.back(),
              ),
              ListView.builder(
                shrinkWrap: true, // مهم لإخبار ListView بأخذ حجمها فقط
                physics: const NeverScrollableScrollPhysics(), // منع Scroll داخلي لتجنب التعارض

                itemCount: medications.length,
              itemBuilder: (_, index) {
                final med = medications[index];
                return

                  SizedBox(

                    height: MediaQuery.of(context).size.height/3.5,
                    width: MediaQuery.of(context).size.width-40,

                    child: Card(

                      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(width: 1,color: Colors.grey,style: BorderStyle.solid)),
                      shadowColor: Colors.grey,
                      surfaceTintColor: Colors.white,
                      color: Colors.white,

                      elevation: 3,

                      margin: const EdgeInsets.only(bottom: 12,left: 12,right: 12),

                      child:
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,

                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 5,


                          children: [


                            SizedBox(

                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,


                                children: [
                                  SizedBox(


                                    width: 12* MediaQuery.of(context).size.width/20,


                                    child: Column(children: [



                                      InfoRowViewMedical(icon: Icons.medication, label: "Name", value: med.name),
                                      InfoRowViewMedical(icon: Icons.merge_type, label: "Dosage", value: med.dosage ?? "-"),
                                      InfoRowViewMedical(icon: Icons.timer, label: "Times/Day", value: med.timesPerDay.toString()),
                                      InfoRowViewMedical(icon: Icons.access_time, label: "Time of Day", value: med.timeOfDay ?? "-"),
                                      InfoRowViewMedical(icon: Icons.calendar_today, label: "Duration", value: med.duration ?? "-"),
                                      InfoRowViewMedical(icon: Icons.note, label: "Notes", value: med.notes ?? "-"),
                                      //

                                    ],),

                                  ),
                                  Spacer(),

                                  SizedBox(

                                    width:MediaQuery.of(context).size.width/4,

                                    child: Column(

                                      // spacing: 8,
                                      children: [

                                        CircleAvatar(
                                          radius: 25,
                                          backgroundColor: Colors.blueGrey,



                                          backgroundImage: AssetImage( "assets/images/logo/logoTooth.png"),
                                        ),


                                        IconButton(
                                          onPressed: () {
                                            medController. deleteMedication(
                                                context,
                                                index,
                                                med.id.toString(),
                                            patientId: patientId,

                                            );

                                            // Get.dialog(
                                            //   AlertDialog(
                                            //     title: const Text("تأكيد الحذف"),
                                            //     content: const Text("هل أنت متأكد من حذف هذه المعالجة؟"),
                                            //     actions: [
                                            //       TextButton(
                                            //         onPressed: () => Get.back(),
                                            //         child: const Text("تراجع"),
                                            //       ),
                                            //       TextButton(
                                            //         onPressed: () {
                                            //
                                            //
                                            //           medController .medicationsDelete(
                                            //
                                            //             medicationId:  med.id.toString(),
                                            //           // medController. deleteMedication(
                                            //           //     context,
                                            //           //     index,
                                            //           //     med.id.toString(),
                                            //               patientId: patientId,
                                            //
                                            //           );
                                            //
                                            //           Get.back();
                                            //         },
                                            //         child: const Text(
                                            //           "تأكيد",
                                            //           style: TextStyle(color: Colors.red),
                                            //         ),
                                            //       ),
                                            //     ],
                                            //   ),
                                            // );
                                          },
                                          icon: const Icon(Icons.delete, color: Colors.red),
                                        ),



                                      ],),
                                  ),


                                ],

                              ),

                            ),









                          ],

                        ),
                      )

                      ,
                    ),
                  );
              },
            ),


            SizedBox(height: 100,)]
          ),
        );
      }),
    );
  }
}
