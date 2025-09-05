
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:dentist/controller/auth/verification_controller.dart';
import 'package:dentist/my_import.dart';
import 'package:dentist/widget_constant/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class VerificationView extends GetView<VerificationController> {
  const VerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: controller.formStateVerification,
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: ListView(
            children: [
              buildHeaderImage(),
              buildTitle(title: "OTP Verification"),
              const SizedBox(height: 10),
              buildText(title: "Enter the 5-digit code sent to your email/phone"),

              const SizedBox(height: 20),

              // حقل إدخال OTP
              PinCodeTextField(
                appContext: context,
                length: 5,
                controller: controller.otpController,
                keyboardType: TextInputType.number,

                onChanged: (value) {},
                onCompleted: (value) {
                  controller.verifyOtp(value);
                },

                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,        // ⬅️ شكل مربع
                  borderRadius: BorderRadius.circular(8), // زوايا دائرية خفيفة
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: Colors.white,       // لون المربع بعد ما يكتب فيه
                  inactiveFillColor: Colors.white,     // لون المربع وهو فاضي
                  selectedFillColor: Colors.white,     // لون المربع وهو محدد

                  activeColor: Colors.teal,            // لون البوردر بعد الإدخال
                  inactiveColor: Colors.teal.shade200, // لون البوردر العادي
                  selectedColor: Colors.green,         // لون البوردر لما المربع محدد

                  borderWidth: 2,                      // سماكة البوردر
                ),
                enableActiveFill: true, // ⬅️ عشان يعبّي الخلفية
              )
,
              const SizedBox(height: 30),

              _buildVerifyButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVerifyButton() => Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(vertical: 28.0,horizontal: 40),
          child: ElevatedButton(
                style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal.shade300,
          foregroundColor: Colors.white,
          shadowColor: Colors.teal.shade50,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
                ),
                onPressed: controller.statusRequestOtp.value == StatusRequest.loading
            ? null
            : () => controller.verifyOtp(controller.otpController.text),
                child: controller.statusRequestOtp.value == StatusRequest.loading
            ? CircularProgressIndicator(color: Colors.teal.shade200)
            : const Text(
          "Verify",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
                ),
              ),
        ),
  );

}
