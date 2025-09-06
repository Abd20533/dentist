import 'package:dentist/my_import.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ToothTreatmentPage extends StatelessWidget {
  final String patientId;

  ToothTreatmentPage({super.key, required this.patientId});

  final ToothTreatmentController controller = Get.put(ToothTreatmentController());
  final patientController = Get.find<PatientController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() {
        final patient = patientController.patientsPostMan
            .firstWhere((p) => p.id.toString() == patientId);
        final treatments = patient.treatments ?? [];

        if (treatments.isEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              BuildSectionHeader(
                title: "علاجات الأسنان",

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
                title: "علاجات الأسنان",

                icon: FontAwesomeIcons.arrowRight,
                onAdd: () => Get.back(),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: treatments.length,
                itemBuilder: (context, index) {
                  final treatment = treatments[index];
                  return





                    SizedBox(


                      // height: 100,
                      height: MediaQuery.of(context).size.height/4.2,
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



                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                            child: Row(
                                              spacing: 8,
                                              children: [
                                                Icon(Icons.numbers_outlined,size: 20,color: AppMyColor.teal, ),
                                                Text(
                                                    "Tooth Number: ",
                                                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14,color: AppMyColor.black87),
                                                ),
                                                Text(
                                                 " ${treatment.toothNumber ?? "-"}",
                                                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14,color: AppMyColor.black87),
                                                ),],),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                            child: Row(
                                              spacing: 3,
                                              children: [
                                                Icon(Icons.merge_type,size: 20,color: AppMyColor.teal, ),
                                                Text(
                                                    "treatment Type:",
                                                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14,color: AppMyColor.black87),
                                                ),
                                                Text(
                                                  overflow: TextOverflow.clip,
                                                 " ${treatment.treatmentType ?? "-"}",
                                                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14,color: AppMyColor.black87),
                                                ),],),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
                                          child: SizedBox(
                                            child: Row(
                                              spacing: 8,
                                              children: [
                                                Icon(Icons.ac_unit,size: 20,color: AppMyColor.teal, ),
                                                // Icon(FontAwesomeIcons.transgender,size: 20,color: AppMyColor.black87, ),
                                                Text(
                                                  "Condition : ",
                                                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13,color: AppMyColor.black87),
                                                ),
                                                Text(
                                                    treatment.condition.toString(),
                                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12,color: AppMyColor.black87),
                                                ),],),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
                                          child: SizedBox(
                                            child: Row(

                                              spacing: 8,
                                              children: [
                                                Icon(Icons.color_lens,size: 20,color: AppMyColor.teal),
                                                // Icon(FontAwesomeIcons.color,size: 20,color: AppMyColor.black87),


                                                Text(
                                                  "Color : ",

                                                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13,color: AppMyColor.black87),
                                                ),
                                                                    Container(
                                                                      width: 16,
                                                                      height: 16,
                                                                      decoration: BoxDecoration(
                                                                        shape: BoxShape.circle,

                                                                        color: controller.getConditionColor(treatment.condition),

                                                                      ),
                                                                    ),


                                              ],),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
                                          child: SizedBox(
                                            child: Row
                                              (
                                              spacing: 8,
                                              children: [

                                                Icon(Icons.timer_sharp,size: 20,color: AppMyColor.teal, ),
                                                Text(
                                                  "Date : ",
                                                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13,color: AppMyColor.black87),
                                                ),
                                                Text(
                                                  treatment.treatmentDate.substring(0, 10),
                                                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12,color: AppMyColor.black87),
                                                ),


                                              ],),
                                          ),
                                        ),

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



                                            backgroundImage: AssetImage( treatment.photo!.toString()),
                                          ),


                                          IconButton(
                                            onPressed: () {
                                              Get.dialog(
                                                AlertDialog(
                                                  title: const Text("تأكيد الحذف"),
                                                  content: const Text("هل أنت متأكد من حذف هذه المعالجة؟"),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () => Get.back(),
                                                      child: const Text("تراجع"),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {


                                                       controller. deleteTreatment( treatment.id.toString(),patientId.toString());

                                                        Get.back();
                                                      },
                                                      child: const Text(
                                                        "تأكيد",
                                                        style: TextStyle(color: Colors.red),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
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
            ],
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // _showAddDialog(context);
          controller.showAddTreatmentDialog(patientId);
        },
        child: const Icon(Icons.add),
      ),
    );
  }


}






