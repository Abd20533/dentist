

import 'package:dentist/controller/auth/ResetPasswordController.dart';
import 'package:dentist/core/constant/app_link_api.dart';
import 'package:dentist/my_import.dart';
import 'package:dentist/widget_constant/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordView extends GetView< ResetPasswordController> {

  final String otp;
  const ResetPasswordView(this.otp, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,


      body: Form(

          key: controller.formStateResetPassword,


          child: Padding(
            padding: const EdgeInsets.only(left: 18, right: 18, top: 35),
            child: ListView(
                children: [


                  buildHeaderImage(),

                  buildTitle( title:
                  " Reset Password",),
                  SizedBox(height: 10,),


                  buildText(title:   "Enter your email address below and we'll"),
                  buildText(title: "send  your instructions to reset your password"),

                  SizedBox(height: 15,),
                  _buildPasswordField(
                    textController: controller.passwordController,
                    label: "Password",
                  ),

                  _buildPasswordField(
                    textController: controller.passwordConController,
                    label: "Confirm Password",
                  ),


                  SizedBox(height: 50,),

                  _buildLoginButton(),
                  SizedBox(height: 50,),





                ]


            ),
          )),
    );
  }




  Widget _buildLoginButton() =>
      Obx(


              () =>
          Container(
            padding: const EdgeInsets.all(1),
            margin: const EdgeInsets.all(10),
            height: 40,
            width: Get.width,
            decoration: BoxDecoration(
              color: Colors.teal.shade300,
              borderRadius: BorderRadius.circular(100),
            ),
            child: controller.statusRequest.value == StatusRequest.loading
            // child: controller.isLoading.value
                ? const CircularProgressIndicator(color: Colors.white)
                .center()

                : const Text(
              "Send",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ).center().onTap(() =>
            controller.sendData(
              // formState:controller.formStateResetPassword ,

                linkUrl: AppLinkApi.resetPassword,
                postData: {"password":controller.passwordController.text
                ,
                  // "code":controller.numberConController.text,
                  "code":otp,
                  "confirm_password":controller.passwordConController.text,


                }



            )
              // :null
            ),
          )
      );


  Widget _buildPasswordField({
    required TextEditingController textController,
    required String label,
  }) => Obx(() => Container(
    padding: const EdgeInsets.all(4),
    margin: const EdgeInsets.all(10),
    height: 50,
    child: CustomTextFormField(
      showIcon: true,
      controller: textController, // ✅ هنا صح
      keyboardType: TextInputType.text,
      label: label,
      validationType: "password",
      obscureText: !controller.isPasswordVisible.value,
      onIconTap: () => controller.isPasswordVisible.toggle(),
    ),
  ));


}
