import 'package:dentist/core/constant/AppColor.dart';
import 'package:dentist/core/mycore/extentions.dart';
import 'package:dentist/my_import.dart';
import 'package:dentist/widget_constant/all_widget_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home2 extends StatelessWidget {

  final String title;
  const Home2({super.key,  this.title="STORES"});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(

      body: SizedBox(


        child: Column(children: [
          SizedBox(
              height: MediaQuery.of(context).size.height/10,


              child: myText(text: title,color: AppMyColor.redApp).center()),
          const SizedBox  (height: 16,),
          const Expanded(child: SizedBox(child: ImageStoreAndName()))




        ],),


      ),

    );
  }
}


class ImageStoreAndName extends StatelessWidget {
  const ImageStoreAndName({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      clipBehavior: Clip.none,
      itemBuilder: (context, index) =>
          Container(
            decoration: BoxDecoration(
                color: AppMyColor.redApp.withOpacity(0.8),
                border: const BorderDirectional(),
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            width: 140,
            height: 50,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                 Positioned(
                  top: -35,
                  left: 25,
                  child: CircleAvatar(
                    radius: 45,


                    backgroundImage:
                    AssetImage("assets/images/imageFood${(index+1).toString()}.png"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0,left: 4,right: 4),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(10)),
                          height: 20,
                          child: const Text(
                            "The Name Store:",
                            style: TextStyle(color: AppMyColor.blackTextApp),
                          ).center(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 12),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(1)),
                          height: 20,
                          child: const Text(
                            "MTN", style: TextStyle(
                              color: AppMyColor.blackTextApp),
                          ).center(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ).onTap(() {

            // Get.to(Stores());

          }),
      scrollDirection: Axis.horizontal,
      separatorBuilder: (context, index) =>
      const SizedBox(
        width: 15,
      ),
      itemCount: 10,
    );
  }

}
