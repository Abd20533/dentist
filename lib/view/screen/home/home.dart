
import 'package:dentist/controller/home/PatientController.dart';
import 'package:dentist/controller/home/build_panoramic_images_controller.dart';
import 'package:dentist/view/screen/home/Patient/patient_home.dart';
import 'package:dentist/view/screen/home/Patient/setPatient.dart';
import 'package:dentist/view/screen/setting/settingView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final PersistentTabController _controller =
  PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      PatientDashboard(),
      Patient(),
      DoctorProfilePage(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.dashboard),
        title: ("Home".tr),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        title: ("Patient".tr),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.settings),
        title: ("setting".tr),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    Get.put(BuildPanoramicImagesController());
    Get.put(PatientController());

    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      backgroundColor: Colors.white,
      navBarStyle: NavBarStyle.style6, // يمكنك تغييره حسب التصميم
    );
  }
}



