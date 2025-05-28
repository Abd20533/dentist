// import 'package:dentist/core/constant/my_color.dart';
// import 'package:flutter/material.dart';
//
// class Welcome extends StatelessWidget {
//   const Welcome({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body:  Form(
//           autovalidateMode: AutovalidateMode.always,
//
//           child: Scaffold(
//
//               backgroundColor: Colors.white,
//             body: Padding(
//               padding: const EdgeInsets.all(1.0),
//               child: Container(
//                 width: MediaQuery.of(context).size.width,
//
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage("assets/images/welcome.jpg"),
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//                 padding: EdgeInsets.all(20),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                   Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     SizedBox(
//                       height:120,
//                     ),
//                   Padding(
//                     padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height/2.6),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Text("welcome in",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold,color:AppMyColor.whiteTextApp ),),
//                         Text(" DentaGuard Pro 👋",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold,color:AppMyColor.whiteTextApp),),
//
//                       ],
//                     ),
//                   )
//
//                   ],)
//                   ],
//                 )
//
//
//                       ),
//             )
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
import 'package:dentist/controller/welcome_controller.dart';
import 'package:dentist/core/constant/my_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(WelcomeController()); // تسجيل الكونترولر

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/welcome.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 120),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 2.6),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("welcome in",
                            style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: AppMyColor.whiteTextApp)),
                        Text(" DentaGuard Pro 👋",
                            style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: AppMyColor.whiteTextApp)),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}