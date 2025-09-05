import 'package:dentist/controller/home/PatientController/AddPatientController.dart';
import 'package:dentist/core/constant/AppColor.dart';
import 'package:dentist/view/screen/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class AddPatient extends StatelessWidget {
  const AddPatient({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddPatientController());

    return Scaffold(
      backgroundColor:AppMyColor.backgroundColorApp,



      appBar: AppBar(
        centerTitle: true,
        shadowColor: Colors.grey,
        title: Text("إضافة مريض".tr, style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          // color: Colors.white

        ),),

        elevation: 0,
        backgroundColor: AppMyColor.backgroundColorApp,


        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.to(() => Home());

          },
        ),),


      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // الاسم
              Card(

                color: Colors.white,
                elevation: 3,
                shadowColor: Colors.grey,

                shape: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(50)),

                child: CircleAvatar(

                  backgroundColor: AppMyColor.white,
                  radius: 40,
                  child:

                          Icon(FontAwesomeIcons.tooth, size: 60, color: Colors.teal),

                ),



              ),
SizedBox(height: 10,),

              SizedBox(
                height:  MediaQuery.of(context).size.height/16,
                width: MediaQuery.of(context).size.width/1.2,
                child: TextFormField(
                  controller: controller.nameController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 2),


                    labelText: "الاسم",
                    border: OutlineInputBorder(

                     borderRadius: BorderRadius.all(Radius.circular(12),) ,
                      borderSide: BorderSide(width: 1,color: AppMyColor.grey)

                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),




              SizedBox(

                height:  MediaQuery.of(context).size.height/12,
                width: MediaQuery.of(context).size.width/1.2,
                child: IntlPhoneField(


                  controller: controller.phoneController,
                  decoration: const InputDecoration(
                    labelText: 'رقم الهاتف',
                    contentPadding: EdgeInsets.symmetric(horizontal: 6,vertical: 5),


                    // border: OutlineInputBorder()
                    border: OutlineInputBorder(


                        borderRadius: BorderRadius.all(Radius.circular(12),) ,
                        borderSide: BorderSide(width: 1,color: AppMyColor.grey)

                    ),


                  ),
                  initialCountryCode: 'SY',
                  onCountryChanged: (country) {
                    controller.selectedCountryCode.value = "+${country.dialCode}";
                  },
                  onChanged: (phone) {
                  },
                ),
              ),
              SizedBox(
                height:  MediaQuery.of(context).size.height/16,
                width: MediaQuery.of(context).size.width/2.6,
                child: TextFormField(

                  controller: controller.ageController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "العمر",
                    // border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 2),

                    border: OutlineInputBorder(

                        borderRadius: BorderRadius.all(Radius.circular(12),) ,
                        borderSide: BorderSide(width: 1,color: AppMyColor.grey)

                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),


              Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio<String>(
                    value: "male",
                    groupValue: controller.gender.value,
                    onChanged: (val) => controller.gender.value = val!,
                  ),
                  const Text("Male"),
                  const SizedBox(width: 20),
                  Radio<String>(
                    value: "female",
                    groupValue: controller.gender.value,
                    onChanged: (val) => controller.gender.value = val!,
                  ),
                  const Text("Female"),
                ],
              )),
              const SizedBox(height: 24),


              ElevatedButton(
                style: ElevatedButton.styleFrom(

                  shadowColor: AppMyColor.grey,
                  elevation: 3,
                  backgroundColor: Colors.white,
                  overlayColor: Colors.teal,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)

                  ),
                  // minimumSize: Size(100, 18)


                ),


                onPressed: () {

                  controller.addPatients();
                  // controller.submit();
                },
                child:

                controller.isLoading.value ==true?
                const  CircularProgressIndicator(
                  strokeWidth: 3,

                  backgroundColor: Colors.white,

                  color: AppMyColor.teal,)

                    :

                const Text("إضافة")
              ),
            ],
          ),
        ),
      ),
    );
  }
}
