
import 'package:dentist/controller/get_started_controller.dart';
import 'package:dentist/core/mycore/extentions.dart';
import 'package:dentist/view/screen/auth/started_r/widget.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class GetStarted extends GetView<GetStartedController>  {
  GetStarted({super.key}) {
    // Get.put(GetStartedController());
  }

  @override
  Widget build(BuildContext context) {
    // final controller = Get.find<GetStartedController>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80.0, bottom: 20),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/tooth3.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.only(top: 28.0, bottom: 20),
            child: SizedBox(
              child: Text(
                "Let's Started",
                maxLines: 1,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          const WidgetGetStart(
            text: "Sign in with google",
            icon: FontAwesomeIcons.google,
            iconRed: Color(0xFFDB4437),
          ),
          const WidgetGetStart(
            text: "Sign in with Facebook",
            icon: FontAwesomeIcons.facebook,
            iconRed: Colors.blue,
          ),
          const WidgetGetStart(
            text: "Sign in with Apple",
            icon: FontAwesomeIcons.apple,
            iconRed: Colors.black,
          ),

          Container(
            height: 40,
            child: Row(
              children: [
                Expanded(
                  child: DottedLine(
                    direction: Axis.horizontal,
                    lineLength: double.infinity,
                    dashLength: 4,
                    dashColor: Colors.black,
                    dashRadius: 10,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text("OR"),
                ),
                Expanded(
                  child: DottedLine(
                    direction: Axis.horizontal,
                    lineLength: double.infinity,
                    dashLength: 4,
                    dashColor: Colors.black,
                    dashRadius: 10,
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child: Container(
              height: 40,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: Colors.white, width: 1),
              ),
              child: const Text(
                "Get Started",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ).center(),
            ).center(),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Don\'t have an account ',
                      style: TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                      text: 'sign up',
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                      // recognizer: TapGestureRecognizer()
                      //   ..onTap = controller.handleSignUp, // استخدام الدالة من الكونترولر
                    ),
                  ],
                ),
              ).onTap(() => controller.handleSignUp(),),
            ],
          )
        ],
      ),
    );
  }
}