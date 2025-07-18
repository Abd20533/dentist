
import 'package:dentist/controller/home/PatientController.dart';
import 'package:dentist/data/modules/PatientModel.dart';
import 'package:dentist/my_import.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildPatientList extends StatelessWidget {
  BuildPatientList({super.key});

  final controller = Get.find<PatientController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        children: controller.displayedPatients.map((item) {
          if (item is Map && item['isMore'] == true) {
            return Card(
              elevation: 2,
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                leading: const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.more_horiz, color: Colors.white, size: 30),
                ),
                title: const Text(
                  "عرض المزيد",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                onTap: () {

                  controller.navigateToPatient();
                  print("عرض المزيد من المرضى");
                },
              ),
            );
          }

          final patient = item as PatientModel;

          return Card(
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 16,
              ),
              leading:  CircleAvatar(
                radius: 30,
                backgroundColor: Colors.blueGrey,
                // backgroundImage: AssetImage("assets/images/person5.jpg"),
                backgroundImage: AssetImage( patient.image),
              ),
              title: Text(
                patient.name,
                style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              subtitle: Text(
                patient.age,
                style: const TextStyle(color: Colors.grey),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.arrow_forward_ios, size: 18),
                onPressed: () {},
              ),
            ),
          );
        }).toList(),
      );
    });
  }
}



