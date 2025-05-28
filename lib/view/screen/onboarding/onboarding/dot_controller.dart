import 'package:dentist/controller/on_boarding_controller.dart';
import 'package:dentist/core/constant/my_color.dart';
import 'package:dentist/data/data_sources/static/static.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';


import 'package:dentist/my_import.dart';

class DotControllerOnBoarding extends StatelessWidget {
  const DotControllerOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
      builder: (controller) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              onBoardingModel.length,
              (index) => AnimatedContainer(
                margin: const EdgeInsets.only(right: 5),
                width: controller.currentPage == index ? 40 : 15,
                height: controller.currentPage == index ? 24 : 15,
                decoration: BoxDecoration(
                    color: controller.currentPage ==index ?AppMyColor.blue2:Colors.grey,
                    borderRadius: BorderRadius.circular(20)),
                duration: const Duration(milliseconds: 900),
              ),
            ),
          ],
        );
      },
    );
  }
}
