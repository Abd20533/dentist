import 'package:animate_do/animate_do.dart';
import 'package:dentist/core/constant/my_color.dart';
import 'package:dentist/my_import.dart';
import 'package:flutter/material.dart';

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