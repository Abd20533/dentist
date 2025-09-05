import 'package:animate_do/animate_do.dart';
import 'package:dentist/core/constant/AppColor.dart';
import 'package:dentist/my_import.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget myContainer(

{

required context,
  required String title,
  double width=300,
  double height=55,
  double borderRadius=30
  , VoidCallback? callback


}
    ){

  return
    Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        gradient: const LinearGradient(
            colors: [
              AppMyColor.redApp
,
              AppMyColor.blackApp

            ]
        ),
      ),
      child:MaterialButton(onPressed:
      callback,
        child:  Center(child: Text(title,style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white
        ),),),),
    );



}


Widget myTextLogin({required String title}){


  return

    FadeInLeft(
      duration: const Duration(seconds: 1),
      child: Padding(
        padding:const EdgeInsets.all(8.0),
        child: Text(title,style: const TextStyle(fontSize:20 ,color: AppMyColor.blackApp,fontWeight:FontWeight. w600 ),),
      ),
    );

}




Widget buildTitle({required String title}) =>
     Text(
      title

      ,

      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    ).center();

Widget buildHeaderImage() =>
    Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 20),
      child: Container(
        width: Get.width / 2,
        height: Get.height / 4,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/logo/logoTooth.png"),

            fit: BoxFit.contain,
            // fit: BoxFit.fill,
          ),
        ),
      ),
    );




Widget buildText({required String title}) =>
    Center(
      child:  Text(

        title             ,
        style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal,
          color: Colors.teal.shade300,

          // color: Colors.grey
        ),
      ),
    );




Widget buildRegisterLink({required  String text1,required String text2,
  required VoidCallback onIconTap


}) {
  return Padding(
    padding: const EdgeInsets.all(18.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text.rich(
          TextSpan(
              children: [
                TextSpan(

                  text:text1,

                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text:text2 ,
                      style: const TextStyle(

                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = onIconTap
                        // ..onTap = controller.navigateToRegister,
                    ),
                  ],)
              ]  ),
        ),
      ],
    ),
  );
}
