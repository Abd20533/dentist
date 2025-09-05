import 'package:dentist/controller/auth/SendEmailControoler.dart';
import 'package:dentist/core/constant/app_link_api.dart';
import 'package:dentist/my_import.dart';
import 'package:dentist/widget_constant/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

  class SendEmail extends GetView<SendEmailController> {

    const SendEmail({super.key});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.white,


        body: Form(

            key: controller.formStateSendEmail,


            child: Padding(
              padding: const EdgeInsets.only(left: 18, right: 18, top: 35),
              child: ListView(
                  children: [


                    buildHeaderImage(),

                    buildTitle( title:
                      "Forgot Password ",),
                    SizedBox(height: 10,),


                    buildText(title:   "Enter your email address below and we'll"),
                    buildText(title: "send  your instructions to reset your password"),

                    SizedBox(height: 15,),

                    _buildEmailField(),
                    SizedBox(height: 50,),

                    _buildLoginButton(),
                    SizedBox(height: 50,),





                  ]


              ),
            )),
      );
    }


    Widget _buildEmailField() =>
        Container(
          padding: const EdgeInsets.all(4),
          margin: const EdgeInsets.all(10),
          height: 60,
          child: CustomTextFormField(
            obscureText: false,
            label: "Enter your email",
            controller: controller.emailController,
            keyboardType: TextInputType.emailAddress,
            validationType: "email",
            // validationType: "password",
          ),
        );




    Widget _buildLoginButton() =>
        Obx(() =>
            Container(
              padding: const EdgeInsets.all(1),
              margin: const EdgeInsets.all(10),
              height: 40,
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.teal.shade300,
                borderRadius: BorderRadius.circular(100),
              ),
              // statusRequest = StatusRequest.loading
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
              // controller.formState.currentState!.validate()?
              controller.send(
                formState: controller.formStateSendEmail,
                linkUrl: AppLinkApi.forgetPassword,
                  postData: {"email":controller.emailController.text}



              )
                // :null
              ),
            )
        );


  }