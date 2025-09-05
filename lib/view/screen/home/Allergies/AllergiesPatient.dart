import 'package:dentist/controller/home/Allergies/AllergiesController.dart';
import 'package:dentist/view/screen/home/Medication/HelpMedical.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dentist/my_import.dart';

class ViewAllergies extends StatelessWidget {
  final String patientId;

  const ViewAllergies({super.key, required this.patientId});

  @override
  Widget build(BuildContext context) {
    final PatientController patientController = Get.find<PatientController>();
    final AllergiesController allergyController =
    Get.put(AllergiesController());

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.white,
        onPressed: () {
          allergyController.addAllergy(context, patientId: patientId);
        },
        icon: Icon(Icons.add_alert, color: Colors.teal.shade300),
        label: const Text(
          "إضافة حساسية",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
      backgroundColor: Colors.white,
      body: Obx(() {
        final patient = patientController.patientsPostMan
            .firstWhere((p) => p.id.toString() == patientId);

        final allergies = patient.allergies ?? [];

        if (allergies.isEmpty) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              BuildSectionHeader(
                title: "الحساسيات",
                // icon: Icons.allergy,
                // icon: Icons.sick,        // أيقونة المرض
                icon: Icons.arrow_forward,     // أيقونة التحذير
                // icon: Icons.health_and_safety,  // أيقونة الصحة

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
                title: "الحساسيات",
                icon: Icons.arrow_forward,                  onAdd: () => Get.back(),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: allergies.length,
                itemBuilder: (_, index) {
                  final allergy = allergies[index];
return

  SizedBox(

    height: MediaQuery.of(context).size.height/6,
    // width:2* MediaQuery.of(context).size.width/3-100,

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

                    width:2/3*(2* MediaQuery.of(context).size.width/3),

                    // width: 8* MediaQuery.of(context).size.width/20,


                    child: Column(children: [



                      InfoRowViewMedical(icon: Icons.medication, label: "Name", value: allergy.name),
                      InfoRowViewMedical(icon: Icons.warning, label: "Dosage", value: allergy.description ?? "-"),


                    ],),

                  ),
                  Spacer(),

                  SizedBox(

                    // width:MediaQuery.of(context).size.width/4,
                    width:1/3*(2* MediaQuery.of(context).size.width/3),


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

                            allergyController.deleteAllergy(
context,
index,
allergy.id.toString(),
patientId: patientId,
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
              const SizedBox(height: 100),
            ],
          ),
        );
      }),
    );
  }
}
