import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:dentist/my_import.dart';

class LogIn extends GetView<LoginController> {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: controller.formState,
        child: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18, top: 35),
          child: ListView(
            children: [
              _buildHeaderImage(),
              _buildTitle(),
              _buildEmailField(),
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

              _buildLoginButton(),
              _buildForgotPassword(),
              _buildDivider(),
              _buildSocialLogin(),
              _buildRegisterLink(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderImage() => Padding(
    padding: const EdgeInsets.only(top: 20.0, bottom: 20),
    child: Container(
      width: Get.width/2,
      height: Get.height / 4,
      decoration: const BoxDecoration(
        image: DecorationImage(
          // image: AssetImage( "assets/images/logo/logoTooth1.png"),
          image: AssetImage( "assets/images/logo/logoTooth.png"),

          // image: AssetImage("assets/images/tooth3.jpg"),
          fit: BoxFit.contain,
          // fit: BoxFit.fill,
        ),
      ),
    ),
  );

  Widget _buildTitle() => const Text(
    "LogIn To Your Account",
    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
  ).center();

  Widget _buildEmailField() => Container(
    padding: const EdgeInsets.all(4),
    margin: const EdgeInsets.all(10),
    height: 50,
    child: CustomTextFormField(
      obscureText: false,
      label: "Email",
      controller: controller.emailController,
      keyboardType: TextInputType.emailAddress,
      validationType: "email",
      // validationType: "password",
    ),
  );

  Widget _buildPasswordField() =>  Obx(() => Container(
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
    ),),
  );

  Widget _buildLoginButton() => Obx(() => Container(
    padding: const EdgeInsets.all(1),
    margin: const EdgeInsets.all(10),
    height: 40,
    width: Get.width,
    decoration: BoxDecoration(
      color: Colors.teal,
      borderRadius: BorderRadius.circular(100),
    ),
      // statusRequest = StatusRequest.loading
    child: controller.statusRequest.value== StatusRequest.loading
    // child: controller.isLoading.value
        ? const CircularProgressIndicator(color: Colors.white).center()

        : const Text(
      "LogIn",
      style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: Colors.white),
    ).center().onTap(() =>
    // controller.formState.currentState!.validate()?
        controller.login(

          password: controller.passwordController.text,
          username: controller.emailController.text

        )
            // :null
    ),
  )
  );

  Widget _buildForgotPassword() => Padding(
    padding: const EdgeInsets.all(18.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'forget your password?',
                style: const TextStyle(
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = controller.forgotPassword,
              ),
            ],
          ),
        ),
      ],
    ),
  );

  Widget _buildDivider() => SizedBox(
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

  Widget _buildSocialLogin() => Padding(
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

  Widget _buildSocialIcon(IconData icon, Color color, String provider) => Container(
    margin: const EdgeInsets.symmetric(horizontal: 13),
    child: IconButton(
      icon: Icon(icon, size: 30, color: color),
      onPressed: () => controller.socialLogin(provider),
    ),
  );






  Widget _buildRegisterLink() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text.rich(
            TextSpan(
                children: [
                  TextSpan(
                    text: 'Don\'t have an account? ',
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'Register',
                        style: const TextStyle(

                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = controller.navigateToRegister,
                      ),
                    ],)
                ]  ),
          ),
        ],
      ),
    );
  }

}