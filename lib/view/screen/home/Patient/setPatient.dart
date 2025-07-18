


import 'package:dentist/controller/home/PatientController.dart';
import 'package:dentist/core/mycore/extentions.dart';
import 'package:dentist/view/screen/home/BuildSectionHeader.dart';
import 'package:dentist/view/screen/home/Patient/PatientDetailsPage.dart';
import 'package:dentist/view/screen/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Patient extends StatelessWidget {
  const Patient({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      floatingActionButton: FloatingActionButton(
        heroTag: 'uniqueTag1',

        backgroundColor: Colors.white,
        onPressed: () {},
        child: const Icon(Icons.add),
      ),

      appBar: AppBar(
        centerTitle: true,
        title: Text("Patients", style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),),

        elevation: 2,
        backgroundColor: Colors.white,

        leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          // Get.offNamed('/patient');
          Get.to(() => Home());

        },
      ),),


      body:  SingleChildScrollView(
        child: Column(
        
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        SizedBox(height: 30,),
            BuildSectionHeader(title: "Patients",onAdd: (){},),
        
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.only(bottom: 38.0),
              child: BuildPatient(),
            ),
            const SizedBox(height: 30),
        
        
        
        
          ],
        ),
      ),

    );
  }
}





class BuildPatient extends StatelessWidget {
  BuildPatient({super.key});

  final controller = Get.find<PatientController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return

          ListView.separated
            (
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),


              itemBuilder:(context, index) {

                return

                  Card(




                    elevation: 2,
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 16,
                      ),
                      leading:  CircleAvatar(
                        radius: 45,
                        backgroundColor: Colors.blueGrey,

                        backgroundImage: AssetImage(

                          controller.patients[index].image,),
                      ),
                      title: Text(
                        controller. patients[index].name,
                        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                      subtitle: Text(
                        controller. patients[index].age,

                        style: const TextStyle(color: Colors.grey),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.arrow_forward_ios, size: 18),
                        onPressed: () {},
                      ),
                    ),
                  ).onTap(() {
                    Get.to(PatientDetailsPage());
                  },);
              }
              // (context, index)
                , separatorBuilder: (context, index) => SizedBox(), itemCount:  controller. patients.length);




    });
  }
}
