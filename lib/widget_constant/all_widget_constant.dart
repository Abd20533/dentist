import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:dentist/core/constant/AppColor.dart';
import 'package:dentist/core/mycore/extentions.dart';
import 'package:dentist/core/mycore/validation.dart';
import 'package:dentist/core/shared/my_cash_helper.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

class MyAppBar extends StatelessWidget {
  final String title;
  final bool centerTitle = true ;
  final Color? backgroundColor ;
  final double paddingTop=0.0;
  final List<Widget>? actions;
  final Widget? leading;
  const MyAppBar({super.key, required this.title, this.backgroundColor, this.actions, this.leading,paddingTop});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.only(top:paddingTop ),
      child: AppBar(



        title: Text(
          title,
          style:   const TextStyle(color: AppMyColor.red, fontSize: 40),
        ),
        centerTitle: centerTitle,
        elevation: 0,
        actions: actions,
        leading:leading ,

        backgroundColor:backgroundColor ,
      ),
    );
  }
}


AppBar myAppBar({  required String title, bool centerTitle = true ,Color? backgroundColor , List<Widget>? actions,Widget? leading}){

  return AppBar(

    title: Text(
    title,
    style: const TextStyle(color: Colors.red, fontSize: 17),
  ),
    centerTitle: centerTitle,
    elevation: 0,
    actions: actions,
    leading:leading ,

    backgroundColor:backgroundColor ,
  );

}


Widget sizes({  double height = 20, double width = 0}){
  return SizedBox(height: height,width: width,);

}


 Widget myText({required String text, Color color=Colors.black, double fontSize=25,double padding=8.0,maxLines=1 }){
  return Padding(
    padding:  EdgeInsets.all(padding),
    child: Text(text,maxLines: maxLines,style: TextStyle(color: color,fontSize:fontSize ),),
  );
 }


AppBar myAppBarInAuthorsBody(
    {required GlobalKey<ScaffoldState> scaffoldKey1,
      required String title,
      required Color? color,
      required context}) {
  return AppBar(
    elevation: 0,
    leading: Card(
      elevation: 3,
      surfaceTintColor: Colors.grey,
      child: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: const Color(0xff22C55E), width: 1),
        ),
        child: Center(
          child: IconButton(
            onPressed: () {
              //   Get.back();
              //  Get.off(HomePage());
            },
            icon: const Icon(
              Icons.arrow_back_sharp,
              color: Color(0xff34D399),
              size: 20,
            ),
          ),
        ),
      ),
    ),
    centerTitle: true,
    title: Text(
      title,
      style: const TextStyle(color: Color(0xff34D399), fontSize: 17),
    ),
    actions: [
      IconButton(
        onPressed: () {
        },
        icon: const Icon(
          Icons.search_sharp,
          color: Color(0xff34D399),
          size: 30,
        ),
      ),
      Card(
        elevation: 3,
        surfaceTintColor: Colors.grey,
        child: Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            color: color,
            border: Border.all(color: const Color(0xff22C55E), width: 1),
          ),
          child: Center(
            child: IconButton(
              onPressed: () {
                scaffoldKey1.currentState!
                    .openEndDrawer();
              },
              icon: const Icon(
                Icons.more_horiz_outlined,
                color: Color(0xff34D399),
                size: 20,
              ),
            ).center(),
          ),
        ),
      ),
    ],
    backgroundColor: color,
  );
}




Widget customTextFormField444({
  required TextEditingController controller,
  required TextInputType type,
  required String title,
  Color myColor = Colors.white30,
  IconData icon = Icons.import_export,
  required String validationType,
  required double borderRadiusCircular,
}) {
  return Material(
    child: TextFormField(
      onFieldSubmitted: (value) {},
      onChanged: (value) {},
      validator: (value) {
        return validate(value!, validationType);
      },
      controller: controller,
      keyboardType: type,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(borderRadiusCircular),borderSide: const BorderSide(width: 1,color: Colors.black)),
        disabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 2)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadiusCircular),
            borderSide: const BorderSide(
              color: Colors.black54,
              width: 2,
            )),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadiusCircular),
            borderSide: const BorderSide(
              color: Colors.red,
              style: BorderStyle.solid,
              width: 2,
            )),

        isDense: true,
        suffixIconColor: Colors.black,
        contentPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
        filled: true,
        fillColor: myColor,
        hintStyle: const TextStyle(color: Colors.black54, fontSize: 34),
        labelStyle: const TextStyle(

            color: Colors.black54,
            fontWeight: FontWeight.w700,
            fontSize: 13),
        errorStyle: TextStyle(color: Colors.red.shade300, fontSize: 10),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadiusCircular),
            borderSide: const BorderSide(
              style: BorderStyle.none,
              color: Colors.black45,
              width: 1,
            )),
        errorMaxLines: 1,
        labelText: title,
        hoverColor: Colors.black54,
        focusColor: Colors.black54,

        border: OutlineInputBorder(

          borderSide:
          const BorderSide(style: BorderStyle.solid, color: Colors.black),
          borderRadius: BorderRadius.circular(borderRadiusCircular),
        ),
      ),
    ),
  );
}







Widget textFormFieldApp({
  required bool obscureText,
  required VoidCallback callback
,   double borderRadiusCircular=100,
   TextEditingController? controller,
  required TextInputType type,
  required String title,
  IconData? icon ,
  required String validationType,


} ){

  return
    FadeInLeft(
      duration: const Duration(seconds: 1),
      delay: const Duration(milliseconds: 500),
      child: TextFormField(
        controller: controller ,
        onFieldSubmitted: (value) {},
        onChanged: (value) {},
        validator: (value) {
          return validate(value!, validationType);
        },
        keyboardType: type,

        obscureText:obscureText,


        decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
            disabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 2)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadiusCircular),
                borderSide: const BorderSide(
                  color: Colors.black87,
                  width: 1,
                )),
            border: OutlineInputBorder(

              borderSide:
              const BorderSide(style: BorderStyle.solid, color: Colors.black),
              borderRadius: BorderRadius.circular(borderRadiusCircular),
            ),
            labelStyle: const TextStyle(

                color: Colors.black54,
                fontWeight: FontWeight.w700,
                fontSize: 13),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadiusCircular),

                borderSide: const BorderSide(
                  color: Colors.red,
                  style: BorderStyle.solid,
                  width: 2,
                )),

            suffixIcon: IconButton(onPressed: callback,

                icon:Icon(
                    obscureText ? Icons.visibility : Icons.visibility_off
                )

            ),
            label: Text(title,style: const TextStyle(
              fontWeight: FontWeight.bold,
              color:Color(0xff8B0000),
            ),)
        ),
      ),
    );



}

Widget textFormFieldAppNormal({


   bool? obscureText,
  VoidCallback? callback
  , double borderRadiusCircular=100,
  // required TextEditingController controller,

   TextEditingController? controller,
   TextInputType? type,
  required String title,
  required String validationType,
   IconData? icons,
// =Icons.phone


}) {

  return

    FadeInLeft(
      duration: const Duration(seconds: 1),
      delay: const Duration(milliseconds: 500),
      child: TextFormField(
        controller: controller ,
        onFieldSubmitted: (value) {},
        onChanged: (value) {},
        validator: (value) {
            return validate(value!, validationType);
        },
        keyboardType: type,

        decoration: InputDecoration(


          isDense: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),

          disabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black,width: 2)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadiusCircular),
              borderSide: const BorderSide(
                color: Colors.black87,
                width: 1,
              )),
          labelStyle: const TextStyle(

              color: Colors.black54,
              fontWeight: FontWeight.w700,
              fontSize: 13),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadiusCircular),

              borderSide: const BorderSide(
                color: Colors.red,
                style: BorderStyle.solid,
                width: 2,
              )),

          suffixIcon:

          Icon(icons, color: Colors.grey,),
          label:  Text(title, style: const TextStyle(
            fontWeight: FontWeight.bold,
            color:
            AppMyColor.redApp
          ),),
          border: OutlineInputBorder(

            borderSide:
            const BorderSide(style: BorderStyle.solid, color: Colors.black),
            borderRadius: BorderRadius.circular(borderRadiusCircular),
          ),
        ),
      ),
    )
  ;
}


void myShowPopup(BuildContext context,
    {required String text, required String path, bool? T = false}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: SizedBox(
          height: 100,
          width: double.infinity,
          child: Center(
            child: LottieBuilder.asset(
              path,
              repeat: true,
              reverse: true,
            ),
          ),
        ),
        content: Text(text),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('ok'),
          )
        ],
      );
    },
  );
}





Widget drawerInHomePage(
    {required GlobalKey<ScaffoldState> scaffoldKey, context}) {
  return Drawer(
    width: 220,
    child:  ListView(
      children: <Widget>[
        Row(children: [
          IconButton(
            onPressed: () {


              // scaffoldKey.currentState!.closeEndDrawer();
              scaffoldKey.currentState!.closeDrawer();

            },
            icon: const Icon(Icons.more_horiz_outlined, size: 30),
          ),
          const Spacer(),
          const CircleAvatar(
            radius: 35,
            // AssetsData.imageSplashViewBody
            backgroundImage:
            AssetImage("assets/images/The rabbit.png"),
          )
        ]),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Column(

            children: [
              FadeInRight(
                duration: const Duration(milliseconds: 500),
                delay: const Duration(milliseconds: 50),
                child: ListTile(
                  title: Text(
                    'Profile'.tr,
                    style: const TextStyle(
                        color: AppMyColor.redApp, fontSize: 22),
                  ),
                  leading: const Icon(
                    Icons.person_rounded,
                    color: AppMyColor.redApp,
                  ),
                  onTap: () {

                    // Get.to( ProfilePage()                    );

                    // Get.to( Profile());
                    // Handle item 1 tap
                  },
                ),
              ),
              FadeInRight(
                duration: const Duration(milliseconds: 500),
                delay: const Duration(milliseconds: 100),
                child: ListTile(
                  title: Text(
                    'Cart'.tr,
                    style: const TextStyle(
                        color: AppMyColor.redApp, fontSize: 22),
                  ),
                  leading: const Icon(
                    Icons.add_shopping_cart,
                    color: AppMyColor.redApp,
                  ),
                  onTap: () {
                    // Get.to(MyLibrary(pathImage: ""));

                    // Handle item 1 tap
                  },
                ),
              ),
              FadeInRight(
                duration: const Duration(milliseconds: 500),
                delay: const Duration(milliseconds: 150),
                child: ListTile(
                  title: Text(
                    'Home'.tr,
                    style: const TextStyle(
                        color: AppMyColor.redApp, fontSize: 22),
                  ),
                  leading: const Icon(
                    Icons.home,
                    color: AppMyColor.redApp,
                  ),
                  onTap: () {
                    // Get.to(const HomePage());
                    // Handle item 1 tap
                  },
                ),
              ),

              FadeInRight(
                duration: const Duration(milliseconds: 500),
                delay: const Duration(milliseconds: 250),
                child: ListTile(
                  title: Text(
                    'your account '.tr,
                    style: const TextStyle(
                        color: AppMyColor.redApp, fontSize: 18),
                  ),
                  leading: const Icon(
                    Icons.account_circle,
                    color: AppMyColor.redApp,
                  ),
                  onTap: () {
                    // Get.to(const Authors());
                    // Handle item 1 tap
                  },
                ),
              ),
              FadeInRight(
                duration: const Duration(milliseconds: 500),
                delay: const Duration(milliseconds: 300),
                child: ListTile(
                  title: Text(
                    'Purchases'.tr,
                    style: const TextStyle(
                        color: AppMyColor.redApp, fontSize: 19),
                  ),
                  leading: const Icon(
                    Icons.card_travel_sharp,
                    color: AppMyColor.redApp,
                  ),
                  onTap: () {
                    // Get.to(const Users());
                    // Handle item 2 tap
                  },
                ),
              ),
              FadeInRight(
                duration: const Duration(milliseconds: 500),
                delay: const Duration(milliseconds: 350),
                child: ListTile(
                  title: Text(
                    'LogOut'.tr,
                    style: const TextStyle(
                        color:AppMyColor.redApp, fontSize: 22),
                  ).onTap(() {

                    CashHelper.putUser(userToken: "");


                    // Get.off(LogInScreen());
                    // drawer.logoutBack(context: context);
                    // Get.off(
                  }),
                  leading: const Icon(
                    Icons.login_outlined,
                    color: AppMyColor.redApp,
                  ),
                ),
              ),
              FadeInRight(
                duration: const Duration(milliseconds: 500),
                delay: const Duration(milliseconds: 400),
                child: ListTile(
                  leading: const Icon(
                    Icons.dark_mode,
                    color: AppMyColor.redApp,
                  ),
                  title: Text(
                    'Dark Mode'.tr,
                    style: const TextStyle(
                        color: AppMyColor.redApp, fontSize: 22),
                  ),
                  onTap: () {
                    // Get.to(const SettingsBody());
                  },
                ),
              ),
              FadeInRight(
                duration: const Duration(milliseconds: 500),
                delay: const Duration(milliseconds: 450),
                child: ListTile(
                  leading: const Icon(
                    Icons.access_time_outlined,
                    color: AppMyColor.redApp,
                  ),
                  title: Text(
                    'Pace'.tr,
                    style: const TextStyle(
                        color: AppMyColor.redApp, fontSize: 22),
                  ),
                  onTap: () {
                    // Get.to(const TimeDisplay1());
                    // Handle item 1 tap
                  },
                ),
              ),
              FadeInRight(
                duration: const Duration(milliseconds: 500),
                delay: const Duration(milliseconds: 500),
                child: ListTile(
                  leading: const Icon(
                    Icons.exit_to_app,
                    color:AppMyColor.redApp,
                  ),
                  title: Text(
                    'Exist'.tr,
                    style: const TextStyle(
                        color: AppMyColor.redApp, fontSize: 22),
                  ),
                  onTap: () {
                    exit(0);

                    // Handle item 1 tap
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}