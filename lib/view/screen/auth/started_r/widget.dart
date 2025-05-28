import 'package:dentist/core/mycore/extentions.dart';
import 'package:flutter/material.dart';


// "Sign in with Facebook"



class WidgetGetStart extends StatelessWidget {
  const WidgetGetStart ({super.key, required this.text,   this.iconRed = Colors.black, height,  this.color= Colors.black, required this.icon});

  final double   height=45;
  final Color   color;
  final Color   iconRed;
  final String   text ;
  final IconData   icon ;

  @override
  Widget build(BuildContext context) {
    return    Padding(
      padding: const EdgeInsets.only(left: 8.0,right: 8),
      child: Container(


        height: height,
        margin: EdgeInsets.all(4),
        // padding:EdgeInsets.all(8) ,
        decoration: BoxDecoration(
          border: Border.all(color: color,width: 1),
          // color: Colors.red,

          // boxShadow:BoxShadow(color: Colors.black26) ,

          borderRadius: BorderRadius.circular(100),
          // shape:

        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Expanded(

              flex: 5,

              child: Text(text,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                maxLines: 1,
              ).center()
              ,

            ),

            Expanded(


              flex: 1,

              child: Icon(icon,color: iconRed,),

            )


          ],),
      ),
    );
  }


}

