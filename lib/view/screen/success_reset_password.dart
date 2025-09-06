

import 'package:dentist/my_import.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SuccessResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor:   Colors.white,
        centerTitle: true,

        title: Text(
          'ReSet Success'.tr,
          // style: Theme.of(context).textTheme.displayLarge!.copyWith(
          //       color: Colors.white,
          //     ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Center(
              child: Icon(
                Icons.check_circle_outline,
                size: 200,
                color: AppMyColor.teal200,
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: CustomButtonAuth(
                text: 'Go To Login'.tr,
                onPressed: () {
                  controller.goToLogin();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class CustomButtonAuth extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const CustomButtonAuth({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(vertical: 13),
      onPressed: onPressed,
      color: AppMyColor.teal200,
      textColor: Colors.white,
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}

abstract class SuccessResetPasswordController extends GetxController {
  void goToLogin();
}

class SuccessResetPasswordControllerImp extends SuccessResetPasswordController {
  @override
  void goToLogin() {
    Get.offAllNamed(AppNameRoutes.login);
  }
}


