// import 'package:dentist/core/mycore/extentions.dart';
// import 'package:dentist/view/screen/general_widget/custom_text_form_field.dart';
// import 'package:dotted_line/dotted_line.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:get/get.dart';
//
// class Register extends StatelessWidget {
//   const Register({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController email = TextEditingController();
//     TextEditingController password = TextEditingController();
//
//     return Scaffold(
//
//       backgroundColor: Colors.white,
//
//         body: Form(
//
//           child: Padding(
//             padding: const EdgeInsets.only(left: 18, right: 18, top: 50),
//             child:
//
//             ListView(
//               children: [
//
//
//                 Padding(
//                   padding: const EdgeInsets.only(top: 40.0,bottom: 20),
//                   child: Container(
//                     width: MediaQuery.of(context).size.width,
//                     height: MediaQuery.of(context).size.height/4,
//                     decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/tooth3.jpg",), fit: BoxFit.fill, ) ,),
//                   ),
//                 ),
//
//
//
// Text("Create New Account",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),).center()
// ,
//                 Container(
//                   padding: EdgeInsets.all(4),
//                   margin: EdgeInsets.all(10),
//
//                   height: 50,
//                   child: CustomTextFormField(obscureText: false, label:  "Email",controller:email,keyboardType: TextInputType.emailAddress, validationType: "email", ),
//
//                 ),
//                 Container(
//                   padding: EdgeInsets.all(4),
//                   margin: EdgeInsets.all(10),
//
//                   height: 50,
//                   child: CustomTextFormField(showIcon: true,controller:password,keyboardType: TextInputType.emailAddress , label:  "password", validationType:"password",obscureText: true, ),
//
//                 ),
//
//
//
//                 Container(
//                   padding: EdgeInsets.all(1),
//                   margin: EdgeInsets.all(10),
//
//                   height: 40,
//                   width: MediaQuery.of(context).size.width,
//                   decoration: BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.circular(100)),
//
//                 child: Text("Create",style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600,color: Colors.white),).center(),
//                 ).center()
//                 ,
//                 SizedBox(
//                   height: 40,
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: DottedLine(
//                           direction: Axis.horizontal,
//                           lineLength: double.infinity,
//                           dashLength: 4,
//                           dashColor: Colors.black,
//                           dashRadius: 10,
//                         ),
//                       ),
//                       const Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 8),
//                         child: Text("OR Continue with",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w700),),
//                       ),
//                       Expanded(
//                         child: DottedLine(
//                           direction: Axis.horizontal,
//                           lineLength: double.infinity,
//                           dashLength: 4,
//                           dashColor: Colors.black,
//                           dashRadius: 10,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//
//
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//
//                       Container(
//                           margin: EdgeInsets.symmetric(horizontal: 13),
//                           child: Icon( FontAwesomeIcons.facebook,size: 30,color:  Colors.blue,)),
//                       Container(
//                           margin: EdgeInsets.symmetric(horizontal: 0),
//                           child: Icon( FontAwesomeIcons.apple,size: 30,color: Colors.black,)),
//                       Container(
//
//                           margin: EdgeInsets.symmetric(horizontal: 13),
//                           child: Icon( FontAwesomeIcons.google,size: 30,color: Color(0xFFDB4437))),
//
//
//
//
//
//                   ],),
//                 ),
//
//                 Padding(
//                   padding: const EdgeInsets.all(18.0),
//                   child: Row(
//
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text.rich(
//                         TextSpan(
//                           children: [
//                             const TextSpan(
//                               text: 'You Have an account ',
//                               style: TextStyle(color: Colors.black),
//                             ),
//                             TextSpan(
//                               text: 'Go LogIn',
//                               style: const TextStyle(
//                                 color: Colors.blue,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                               recognizer: TapGestureRecognizer()
//                                 ..onTap = (){
//
//                                   Get.offNamed('/login');
//
//
//                                 }
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//
//
//           ),
//         )
//     );
//   }
// }


import 'package:dentist/controller/auth/register_controller.dart';
import 'package:dentist/core/mycore/extentions.dart';
import 'package:dentist/view/screen/general_widget/custom_text_form_field.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Register extends GetView<RegisterController> {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        child: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18, top: 50),
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
        width: Get.width,
        height: Get.height / 4,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/tooth3.jpg"),
            fit: BoxFit.fill,
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

  Widget _buildEmailField() {
    return Container(
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.all(10),
      height: 50,
      child: CustomTextFormField(
        obscureText: false,
        label: "Email",
        controller: controller.emailController,
        keyboardType: TextInputType.emailAddress,
        validationType: "email",
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
        color: Colors.blue,
        borderRadius: BorderRadius.circular(100),
      ),
      child: controller.isLoading.value
          ? const CircularProgressIndicator(color: Colors.white)
          : const Text(
        "Create",
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ).center(),
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
                  color: Colors.blue,
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