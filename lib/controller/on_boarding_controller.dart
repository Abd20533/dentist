import 'dart:async';

import 'package:dentist/view/screen/auth/started_r/get_started.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:dentist/core/constant/routes_name.dart';
import 'package:dentist/core/services/services.dart';
import 'package:dentist/data/data_sources/static/static.dart';

abstract class OnBoardingController extends GetxController {
  next();
  onPageChanged(int indexPage);
  testPageTimer();
}

class OnBoardingControllerImp extends OnBoardingController {
  late PageController pageController;
  int currentPage = 0;
  Timer? timer;
  MyServices myServices = Get.find();
  @override
  next() {
    currentPage++;
    update();

    if (currentPage < onBoardingModel.length) {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    } else {
      // currentPage = 0;
      myServices.mySharedPreferences.setString("initialized", "False");


      Get.to(GetStarted());
      
      // Get.offNamed('getStarted');

      // Get.offAllNamed(AppNameRoutes.getStarted);
    }
  }

  @override
  onPageChanged(int indexPage) {
    currentPage = indexPage;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    testPageTimer();
    super.onInit();
  }

  @override
  testPageTimer() {
    timer = Timer.periodic(
      Duration(seconds: 3),
      (timer) {
        if (currentPage < 4) {
          next();
        }
        else {
          timer.cancel(); // إيقاف المؤقت عندما تصل الصفحة إلى 3 أو أكثر
        }

      },
    );
  }

  @override
  void onClose() {
    timer?.cancel(); // إلغاء التايمر عند تدمير الكنترولر
    super.onClose();
  }

}
