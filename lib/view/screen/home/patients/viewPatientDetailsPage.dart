
import 'package:dentist/view/screen/home/Allergies/AllergiesPatient.dart';
import 'package:dentist/view/screen/home/Condition/condition_view.dart';
import 'package:dentist/view/screen/home/ToothTreatment/toothTreatmentPage.dart';
import 'package:dentist/view/screen/home/Medication/ViewMedical.dart';
import 'package:dentist/view/screen/home/Radiograph/ViewPanoramaRays.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dentist/my_import.dart';



class ViewPatientDetailsPage extends StatelessWidget {
  ViewPatientDetailsPage({super.key, required this.patient});

  final PatientModel patient;
  final controller = Get.find<PatientController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 38.0, left: 12, right: 12),
          child: Column(
            children: [
              BuildSectionHeader(
                title: "تفاصيل المريض",
                onAdd: () => Get.back(),
                icon: Icons.arrow_forward,
                // icon: Icons.arrow_back,
              ),
              CircleAvatar(
                radius: 50,
                // radius: 55,
                backgroundColor: Colors.teal,
                // backgroundImage: AssetImage("assets/images/tooth6.jpg" )

                // ,
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                      image: AssetImage("assets/images/tooth6.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
                ,
                // child: Icon(FontAwesomeIcons.tooth,
                //     color: Colors.white, size: 55),
              ),

              const SizedBox(height: 12),
              Text(
                patient.name,
                style: const TextStyle(
                    fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 18),



              buildInfoGroupCard(context, patient),

              const SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Row(children: [

                  screenView(imageUrl: "assets/images/Radiograph/tooth3.jpg",title: "Panorama rays "

                      ,width: MediaQuery.of(context).size.width/2.5
                      , height:MediaQuery.of(context).size.width/3,
                    onPressed: () {

                    Get.to(()=>ViewPanoramaRays(patientId: patient.id));
                    // Get.to(()=>ViewPanoramaRays(patient: patient));
                    },

                  ),
                  screenView(imageUrl: "assets/images/tooth6.jpg",title: " Tooth Treatment "

                      ,width: MediaQuery.of(context).size.width/2.4
                      , height:MediaQuery.of(context).size.width/3,
                    onPressed: () {

                      // Get.to(()=>ViewToothTreatment(patient: patient));
                      Get.to(()=>ToothTreatmentPage(patientId: patient.id.toString()));
                    },


                  ),


                ],)
                ,
                Row(children: [




                  screenView(
                    imageUrl: "assets/images/core/medical1.png",

                    icon: FontAwesomeIcons.briefcaseMedical,title: "Medical"

                      ,width: MediaQuery.of(context).size.width/2.5
                      , height:MediaQuery.of(context).size.width/3,
                    onPressed: () {

                      Get.to(()=>ViewMedical(patientId: patient.id.toString(),));
                    },

                  )
                  ,



                  screenView(
                      imageUrl: "assets/images/core/allergies5.png",


                      icon: FontAwesomeIcons.syringe,title: "Allergies"

                      ,width: MediaQuery.of(context).size.width/2.4
                      , height:MediaQuery.of(context).size.width/3,
                    onPressed:() {
                      Get.to(()=>ViewAllergies(patientId: patient.id.toString(),));

                    },



                  ),

                ],),
                Row(
                  children: [


                    screenView(
                        imageUrl: "assets/images/core/analysis1.png",

                        icon: FontAwesomeIcons.clipboardList,title: "Analysis Reports"

                        ,width: MediaQuery.of(context).size.width/2.5
                        , height:MediaQuery.of(context).size.width/3


                    ),

                    screenView(icon: FontAwesomeIcons.disease,title: "conditions"

                        ,width: MediaQuery.of(context).size.width/2.4
                        , height:MediaQuery.of(context).size.width/3,


                        onPressed: () {


                          Get.to(()=>ConditionView(patientId: patient.id.toString(),));
                        },




                    ),
                  ],

                ),


                screenView(
                  imageUrl: "assets/images/core/pdfSend.png",
                  icon: FontAwesomeIcons.solidFilePdf,title: "send Pdf",

                    width: MediaQuery.of(context).size.width/2.5,
          height: MediaQuery.of(context).size.width/2.8,


                  onPressed: () async{
                    await controller.generateAndSharePdf(patient.id);


                  },




                ),


              ],),





            ],
          ),
        ),
      ),
    );
  }







  Widget buildInfoGroupCard(BuildContext context, PatientModel patient) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      color: Colors.white,
      shadowColor: Colors.grey.shade300,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.teal,
                  child: Icon(Icons.person, color: Colors.white, size: 30),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(patient.name,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Text("العمر: ${patient.age}",
                        style: TextStyle(
                            fontSize: 15, color: Colors.grey.shade600)),
                  ],
                )
              ],
            ),
            const Divider(height: 30, thickness: 1.2),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Icon(Icons.male, color: Colors.teal),
                    const SizedBox(height: 6),
                    Text(patient.gender.toString(),
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500)),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.phone, color: Colors.teal),
                    const SizedBox(height: 6),
                    Text(patient.phone.toString(),
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500)),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }




Widget screenView({

  String? imageUrl,
   VoidCallback? onPressed,
  IconData? icon,
 required String title,
  required double width,
  required double height,
}
    ){


  return InkWell(
    onTap: onPressed,
    child: Card(
      margin: EdgeInsets.all(10),

      elevation: 3,
      shadowColor: Colors.grey.shade300,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        width: width,
        height:height ,
        color: Colors.white,

        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            imageUrl != null
                ? Image.asset(imageUrl, width: 120, height: 80, fit: BoxFit.cover)
                :  Icon(icon, size: 60, color: Colors.teal),
                // :  Icon(icon, size: 60, color: Colors.teal),
            Center(child: Text(title,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),))


          ],
        ),
      ),
    ),
  );


}




}


