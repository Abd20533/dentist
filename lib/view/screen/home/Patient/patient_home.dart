
import 'package:dentist/view/screen/home/BuildPanoramicImages.dart';
import 'package:dentist/view/screen/home/Patient/BuildPatientList.dart';
import 'package:dentist/view/screen/home/BuildSectionHeader.dart';
import 'package:dentist/view/screen/home/Patient/AddOnePatient.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PatientDashboard extends StatelessWidget {


  const PatientDashboard({
    super.key,

  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,


        title:  Text('Dental Assistant'.tr),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(

        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            BuildSectionHeader(title: "Patients".tr,onAdd: (){},),

            const SizedBox(height: 12),
            // BuildPatientList(patients: patients),
            BuildPatientList(),

            const Divider(height: 40, thickness: 1.5),

            BuildSectionHeader(title: "Panoramic Images",onAdd: (){},),

            const SizedBox(height: 12),

            BuildPanoramicImages()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(AddOnePatient());


        },
        child: const Icon(Icons.add),
      ),
    );
  }

}




