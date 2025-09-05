import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:dentist/my_import.dart';

class Register extends GetView<RegisterController> {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        autovalidateMode: AutovalidateMode.onUnfocus,

        key: controller.formState,
        child: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18, top: 50),
          child: ListView(
            children: [
              _buildHeaderImage(),
              _buildTitle(),


              _buildTextField(label: "enter First Name",controller:controller.firstNameController ,keyboardType: TextInputType.name,obscureText: false,validationType:"name", ),
              _buildTextField(label: "enter Last Name",controller:controller.lastNameController ,keyboardType: TextInputType.name,obscureText: false,validationType:"name", ),
              _buildTextField(label: "Email",controller:controller.emailController ,keyboardType: TextInputType.emailAddress,obscureText: false,validationType:"email", ),

              _buildPasswordField(),

              Obx(() =>    Row(
                children: [

                  Checkbox(
                    value: controller.rememberMe.value,
                    onChanged: controller.rememberMeChanging,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    visualDensity: VisualDensity.compact,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    side: BorderSide(color: Colors.grey.shade400),
                    activeColor: Colors.blue.shade700,
                  ),
                  const Text("Remember me later"),
                ],
              ),),

              _buildRegisterButton(),
              _buildDivider(),
              _buildSocialLogin(),
              _buildLoginLink(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderImage() {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0, bottom: 20),
      child: Container(
        width: Get.width/4 ,
        height: Get.height / 4,
        decoration: const BoxDecoration(
          image: DecorationImage(

            // image: AssetImage("assets/images/tooth3.jpg",),
            image: AssetImage( "assets/images/logo/logoTooth.png"),

            fit: BoxFit.contain,
            // fit: BoxFit.fill,

          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return const Text(
      "Create New Account",
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    ).center();
  }

  Widget _buildTextField({

  required String label,
  required bool obscureText,
  required TextEditingController controller,
  required TextInputType keyboardType,
    required String validationType

}) {


    return Container(
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.all(10),
      height: 50,
      child: CustomTextFormField(
        obscureText: obscureText,
        label: label,
        controller: controller,

        validationType: validationType,
        keyboardType: keyboardType,
        // label: "Email",
        // obscureText: false,
        // validationType: "email",

        // controller: controller.emailController,
        // keyboardType: TextInputType.emailAddress,
      ),
    );
  }

  Widget _buildPasswordField() {
    return Obx(
      () =>
      Container(
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.all(10),
        height: 50,
        child: CustomTextFormField(
          showIcon: true,
          controller: controller.passwordController,
          keyboardType: TextInputType.text,
          label: "password",
          validationType: "password",
          // obscureText: true,
          obscureText: !controller.isPasswordVisible.value, // عدل هنا
          onIconTap: () => controller.isPasswordVisible.toggle(),
        ),
      ),
    );
  }

  Widget _buildRegisterButton() {
    return Obx(() => Container(
      padding: const EdgeInsets.all(1),
      margin: const EdgeInsets.all(10),
      height: 40,
      width: Get.width,
      decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.circular(100),
      ),
      child: controller.isLoading.value
          ? const CircularProgressIndicator(color: Colors.white).center()
          : const Text(
        "Create",
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ).center().onTap(() => controller.signUp(),),
    ));
            // .onTap(controller.isLoading.value ? null : controller.register))
  }

  Widget _buildDivider() {
    return SizedBox(
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
            child: Text(
              "OR Continue with",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
            ),
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
    );
  }

  Widget _buildSocialLogin() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildSocialIcon(FontAwesomeIcons.facebook, Colors.blue, 'facebook'),
          _buildSocialIcon(FontAwesomeIcons.apple, Colors.black, 'apple'),
          _buildSocialIcon(FontAwesomeIcons.google, const Color(0xFFDB4437), 'google'),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, Color color, String provider) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 13),
      child: IconButton(
        icon: Icon(icon, size: 30, color: color),
        onPressed: () => controller.socialLogin(provider),
      ),
    );
  }

  Widget _buildLoginLink() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text.rich(
            TextSpan(
              children: [
               TextSpan(
              text: 'You Have an account ',
              style: TextStyle(color: Colors.black),
              children: [
              TextSpan(
                text: 'Go LogIn',
                style: const TextStyle(
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = controller.navigateToLogin,
              ),
          ],)
          ]  ),
          ),
        ],
      ),
    );
  }
}