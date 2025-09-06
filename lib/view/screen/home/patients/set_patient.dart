
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dentist/my_import.dart';

class Patient extends StatelessWidget {
  const Patient({super.key});

  @override
  Widget build(BuildContext context) {

    return


          Scaffold(


            appBar: AppBar(
              centerTitle: true,
              shadowColor: Colors.white,

              title: Text("Patients".tr, style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),),

              elevation: 2,

              backgroundColor: Colors.white,



            ),

backgroundColor: Colors.white,



            body:  SingleChildScrollView(

              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28.0),
                    child: SizedBox(
                      height: 46,
                      child: Container(


                        decoration:BoxDecoration(

                            color:Colors.white ,borderRadius: BorderRadius.circular(14)

                            ,border:
                        Border.all(style: BorderStyle.none,   color: Colors.grey.shade400,width: 1.5, )


                        ) ,
                        child: Card(

                          color: Colors.white,
                          elevation: 3,

                          shape:
                          OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide:    BorderSide(

                                color: Colors.grey.shade400,
                                width: 1.5,
                                style: BorderStyle.solid
                            ),),
                          shadowColor: AppMyColor.grey,
                          child: TextFormField(
                            keyboardType:TextInputType.text,

                            onTap: () {


                            },

                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 30,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: const BorderSide(
                                  color: Colors.blue,
                                  width: 2.0,
                                ),
                              ),

                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade400,
                                  width: 1.5,
                                ),
                              ),

                              prefixIcon: Icon(Icons.search,color: Colors.grey[600],),
                              hintText: "search by name",
                              border: OutlineInputBorder(


                                  borderRadius: BorderRadius.circular(20),

                                  borderSide: BorderSide(color: AppMyColor.grey,style: BorderStyle.solid,width: 1)


                              ),
                              filled: true,
                              hintStyle: TextStyle(color: Colors.black,fontSize: 14),
                              fillColor: Colors.white70,

                            ),
                            onChanged: (value) {
                              final controller = Get.find<PatientController>();
                              controller.searchPatients(value);
                            },


                          ),
                        ),
                      ),
                    ),
                  ),




                  SizedBox(height: 20,),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 38.0),
                    child: SizedBox(

                        width: MediaQuery.of(context).size.width,



                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 28.0),
                          child: BuildPatient(),
                        )),
                  ),
                  const SizedBox(height: 30),




                ],
              ),
            ),

          );





  }
}





class BuildPatient extends StatelessWidget {
  BuildPatient({super.key});

  final controller = Get.find<PatientController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.isLoading.value?
          Center(child: SizedBox(

            height: 300,
            width: 300,
            child: SizedBox(
              width: 60,
              height: 60,
              child: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,

                  color: Colors.teal,
                ),
              ),
            ),
          ))



          :
      controller.patientsPostMan.isNotEmpty?
          ListView.separated
            (
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),


              itemBuilder:(context, index) {

                return



                  SizedBox(


                    // height: 100,
                    height: MediaQuery.of(context).size.height/4.4,
                    child: Card(

                      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(width: 1,color: Colors.grey,style: BorderStyle.solid)),
shadowColor: Colors.grey,
                      surfaceTintColor: Colors.white,
                      color: Colors.white,
                      // color: Colors.teal.shade50,

                      elevation: 3,

                      margin: const EdgeInsets.only(bottom: 12),

                      child:
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,

                          crossAxisAlignment: CrossAxisAlignment.center,
                          spacing: 5,


                          children: [


                            SizedBox(

                              child: Row(


                                children: [
                                  SizedBox(


                                      width: 11* MediaQuery.of(context).size.width/20,


                                      child: Column(children: [



                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        child: Row(
                                          spacing: 14,
                                          children: [
                                          Icon(FontAwesomeIcons.person,size: 20,color: AppMyColor.black87, ),

                                            Text(
                                              "name : ",
                                              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14,color: AppMyColor.black54),
                                            ),
                                            Text(
                                              controller. patientsPostMan[index].name,
                                              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14,color: AppMyColor.black54),
                                            ),],),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
                                      child: SizedBox(
                                        child: Row(
                                          spacing: 14,
                                          children: [
                                          Icon(FontAwesomeIcons.transgender,size: 20,color: AppMyColor.black87, ),

                                          Text(
                                          "gender : ",
                                          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13,color: AppMyColor.black54),
                                        ),
                                          Text(
                                            controller. patientsPostMan[index].gender.toString(),
                                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12,color: AppMyColor.black54),
                                          ),],),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
                                      child: SizedBox(
                                        child: Row(

                                          spacing: 14,
                                          children: [
                                            Icon(FontAwesomeIcons.phone,size: 20,color: AppMyColor.black87).onTap(()
                                            {
                                              controller.callPatient(controller. patientsPostMan[index].phone.toString());
                                            },),


                                            Text(
                                            "phone : ",
                                            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13,color: AppMyColor.black54),
                                          ),
                                          Text(
                                            controller. patientsPostMan[index].phone.toString(),
                                            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12,color: AppMyColor.black54),
                                          ),


                                        ],),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
                                      child: SizedBox(
                                        child: Row
                                          (
                                          spacing: 14,
                                          children: [

                                          Icon(FontAwesomeIcons.cakeCandles,size: 20,color: AppMyColor.black87, ),

                                          Text(
                                            "age : ",
                                            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13,color: AppMyColor.black54),
                                          ),
                                          Text(
                                            controller. patientsPostMan[index].age.toString(),
                                            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12,color: AppMyColor.black54),
                                          ),


                                        ],),
                                      ),
                                    ),

                                      ],),

                                  ),
              Spacer(),

              SizedBox(

                width:MediaQuery.of(context).size.width/4,

                child: Column(

                  // spacing: 8,
                  children: [

                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.blueGrey,
                    backgroundImage: AssetImage( controller.patientsPostMan[index].image.toString()),
                  ),



                    IconButton(onPressed: (){

                      Get.dialog(
                        AlertDialog(
                          title:
                          const Text("تأكيد الحذف"),
                          content: const Text(
                              "هل أنت متأكد من حذف هذه الصورة؟"),
                          actions: [
                            TextButton(
                              onPressed: () =>
                                  Get.back(),
                              child: const Text("تراجع"),
                            ),
                            TextButton(
                              onPressed: () {
                                controller
                                    .deletePatient(

                                  patientId:
                                  controller.patientsPostMan[index].id.toString(),

                                );

                                Get.back();
                              },
                              child: const Text("تأكيد",
                                  style: TextStyle(
                                      color: Colors.red)),
                            ),
                          ],
                        ),
                      );


                    }, icon:    Icon(Icons.delete,color: Colors.red,),),


               IconButton(onPressed: () {

                 Get.to(() => ViewPatientDetailsPage(patient:   controller.patientsPostMan[index],),);


               }, icon:  Icon(Icons.camera,color: AppMyColor.teal300,), )

                ,




                ],),
              ),


                              ],

                              ),

                            ),









                          ],

                        ),
                      )

                      ,
                    ),
                  );


              }
              // (context, index)
                , separatorBuilder: (context, index) => SizedBox(), itemCount:  controller. patientsPostMan.length)

          :
(

    controller.statusRequest.value== StatusRequest.serverFailure?


    SizedBox(
      height: 300,
      width: double.infinity,
      child: Center(
        child: LottieBuilder.asset("assets/Lottie/server.json",
            repeat: true),
      ),
    )


:  SizedBox(
      height: 300,
      width: double.infinity,
      child: Center(
        child: LottieBuilder.asset("assets/Lottie/empty.json",
            repeat: true),
      ),
    )

)
      ;




    });
  }



}

