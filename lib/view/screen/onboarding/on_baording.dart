import 'package:dentist/controller/on_boarding_controller.dart';
import 'package:dentist/core/mycore/extentions.dart';
import 'package:dentist/view/screen/onboarding/onboarding/custom_onboarding.dart';
import 'package:dentist/view/screen/onboarding/onboarding/custom_slider.dart';
import 'package:dentist/view/screen/onboarding/onboarding/dot_controller.dart';
import 'package:dentist/my_import.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {

    Get.put(OnBoardingControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
        body: SafeArea(

            child: Column(
      children: [
        const Expanded(
          flex: 2,
          child: CustomSliderOnBoarding(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.0),
                      child: CustomButtonOnBoarding(),
                    ),
                    // SizedBox(width: 50,),
Spacer(),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
                        width: 2 * (MediaQuery.of(context).size.width / 5),

                        height: 50,
                        margin: const EdgeInsets.only(bottom: 30),

                        child: DotControllerOnBoarding()).center(),

        // Spacer(
        //   flex: 2,
        // ),

                  ],
                )
      ],
    )));
  }
}
