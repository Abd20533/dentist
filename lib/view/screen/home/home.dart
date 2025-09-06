
import 'package:dentist/controller/home/PatientController/PatientController.dart';
import 'package:dentist/controller/setting/settingController.dart';
import 'package:dentist/view/screen/home/patients/set_patient.dart';
import 'package:dentist/view/screen/home/patients/AddPatient.dart';
import 'package:dentist/view/screen/setting/settingView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    Patient(),
    AddPatient(),
    DoctorProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    Get.put(PatientController());
    Get.put(DoctorProfileController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(0.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: GNav(
              gap: 8, // المسافة بين الأيقونة والكلمة
              backgroundColor: Colors.white,
              color: Colors.grey,
              activeColor: Colors.teal,
              tabBackgroundColor: Colors.blue.withOpacity(0.1),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              tabs: [
                GButton(
                  icon: Icons.dashboard,
                  text: "Home".tr,
                ),
                GButton(
                  icon: Icons.add_box_outlined,
                  text: "Add".tr,
                ),
                GButton(
                  icon: Icons.settings,
                  text: "Setting".tr,
                ),
              ],
              selectedIndex: _currentIndex,
              onTabChange: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
