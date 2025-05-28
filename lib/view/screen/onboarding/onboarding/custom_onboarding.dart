import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dentist/controller/on_boarding_controller.dart';
import 'package:dentist/core/constant/my_color.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
      width: 2 * (MediaQuery.of(context).size.width / 5),
      height: 50,
      child: MaterialButton(
        padding: EdgeInsets.symmetric(
            vertical: 0, horizontal: MediaQuery.of(context).size.width / 10),
        onPressed: () {
          controller.next();
        },
        textColor: Colors.white,
        color: AppMyColor.blue2,
        child: const Text(
          "NEXT",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
