// // ignore: file_names
//
// import 'package:animate_do/animate_do.dart';
// import 'package:animated_splash_screen/animated_splash_screen.dart';
// import 'package:dentist/core/mycore/extentions.dart';
// import 'package:dentist/my_import.dart';
// import 'package:dentist/view/screen/splash/splash.dart';
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
//
// class SplashView extends StatefulWidget {
//   const SplashView({super.key});
//
//   @override
//   State<SplashView> createState() => _SplashViewState();
// }
// class _SplashViewState extends State<SplashView>
//     with SingleTickerProviderStateMixin {
//   late AnimationController animationController;
//   late Animation<double> animationOpacity;
//   bool b = true;
//
//   void allAnimation() {
//     animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 5),
//       reverseDuration: const Duration(seconds: 5),
//     );
//
//     animationOpacity = Tween<double>(end: 0.2, begin: 1.0).animate(
//         CurvedAnimation(curve: Curves.linear, parent: animationController));
//
//     animationController.repeat(reverse: true);
//     animationController.repeat();
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     //animationController.dispose();
//     animationController.stop();
//     super.dispose();
//   }
//
//   get splash => null;
//   @override
//   void initState() {
//     super.initState();
//     allAnimation();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedSplashScreen
//       (
//       splash: Column(children: [
//         // FadeInUp
//         //
//         //   (
//         //   curve: Curves.bounceIn,
//         //   duration: const Duration(seconds: 2),
//         //   delay: const Duration(milliseconds: 500),
//         //   child: Padding(
//         //     padding: const EdgeInsets.all(8.0),
//         //     child: FadeTransition(
//         //       opacity: animationOpacity,
//         //       child:  const Text("Your Tooth",
//         //           style: TextStyle(                  color: AppMyColor.blue2
//         //               , fontSize: 30))
//         //           .center(),
//         //     ),
//         //   ),
//         // ),
//         FadeInLeft(
//           curve: Curves.bounceIn,
//           duration: const Duration(seconds: 2),
//           delay: const Duration(milliseconds: 1000),
//           child:
//           Container(
//             //alignment: Alignment.center,
//             padding: const EdgeInsets.all(10),
//             height: 100,
//             width: 100,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(70),
//               // color: c,
//             ),
//
//           ).center(),
//         ),
//
//         // const SizedBox(height: 20),
//         // FadeInRight(
//         //   curve: Curves.bounceIn,
//         //   duration: const Duration(seconds: 2),
//         //   delay: const Duration(milliseconds: 1500),
//         //   child: Center(
//         //       child: myText(
//         //           text: 'YOUR TOOTH',
//         //           color: AppMyColor.blue2
//         //           // color: Color(0xFF3CB371 ).withOpacity(0.7)Color(0xFF70EE90).withOpacity(0.9)
//         //
//         //       )),
//         // ),
//
//         ///to
//         SizedBox(
//           height: 300,
//           width: double.infinity,
//           child: Center(
//             // D:\project\Delivery_app\assets\Lottie\border.json
//             child: LottieBuilder.asset("assets/Lottie/tooth4.json",
//                 repeat: true),
//           ),
//         ),
//
//         // FadeInUp(
//         //   curve: Curves.bounceIn,
//         //   duration: const Duration(seconds: 2),
//         //   delay: const Duration(milliseconds: 2000),
//         //   child: const Padding(
//         //     padding: EdgeInsets.all(8.0),
//         //     child: CircularProgressIndicator(
//         //         color: AppMyColor.blue2
//         //     ),
//         //   ),
//         // ),
//       ]),
//       nextScreen: const Splash(),
//       splashIconSize: 600,
//       curve: Curves.bounceIn,
//       duration: 6000,
//       backgroundColor: Colors.white,
//     );
//   }
// }
