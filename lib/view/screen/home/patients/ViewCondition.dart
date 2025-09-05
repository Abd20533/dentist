

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dentist/my_import.dart';


class ViewCondition extends StatelessWidget {
  final PatientModel patient;

  const ViewCondition({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {

    final List<ConditionModel> conditions = patient.conditions ?? [];

    return Scaffold(
      backgroundColor: Colors.white,



      body: conditions.isEmpty
          ? Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 40,),

          BuildSectionHeader(title:"أمراض المريض", icon: FontAwesomeIcons.arrowRight,onAdd: () {
            Get.back();
          },),

          Center(child: Text("لا توجد أمراض مضافة")),
          Spacer(),
        ],
      )
          : SingleChildScrollView(

        child: Column(

              children: [
                SizedBox(height: 40,),

                BuildSectionHeader(title:"أمراض المريض", icon: FontAwesomeIcons.arrowRight,onAdd: () {
                  Get.back();
                },),




                ListView.builder(

                        shrinkWrap: true,
                        itemCount: conditions.length,
                        itemBuilder: (context, index) {
                ConditionModel condition = conditions[index];
                return Card(

                  margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 4),
                  shadowColor: Colors.grey,


                  shape: RoundedRectangleBorder(

                      side: BorderSide(width: 1,color: Colors.grey ,),

                      borderRadius: BorderRadius.circular(16)),                  elevation: 4,
                  color: Colors.white,
                  child: ListTile(
                    title: Text(
                      condition.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (condition.notes != null)
                          Text('ملاحظات: ${condition.notes}'),
                        Text('تاريخ الإضافة: ${condition.dateAdded}'),
                      ],
                    ),
                    trailing: PopupMenuButton<String>(
                      onSelected: (value) {
                        if (value == 'edit') {
                          Get.snackbar('تعديل', 'اضغط لتعديل المرض');
                        } else if (value == 'delete') {
                          Get.snackbar('حذف', 'اضغط لحذف المرض');
                        }
                      },
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 'edit',
                          child: Text('تعديل'),
                        ),
                        PopupMenuItem(
                          value: 'delete',
                          child: Text('حذف'),
                        ),
                      ],
                    ),
                  ),
                );
                        },
                      ),
              ],
            ),
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.snackbar('إضافة', 'اضغط لإضافة مرض جديد');

        },
        backgroundColor: Colors.teal.shade300,

        child: Icon(Icons.add,color: Colors.white,size: 36,),
      ),
    );
  }
}
