
import 'package:dentist/controller/home/PatientController.dart';
import 'package:dentist/view/screen/general_widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddOnePatient extends StatelessWidget {
   AddOnePatient({super.key});

  final controller = Get.put(AddPatientController());



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(),
      appBar: AppBar(
          elevation: 2,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,

          title: const Text('سجل المريض')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: controller.formKey,
          autovalidateMode: AutovalidateMode.always,
          child: ListView(
            children: [


            Container(
              padding: const EdgeInsets.all(4),
              // margin: const EdgeInsets.all(10),
              height: 75,
              child: CustomTextFormField(
                  shouldFadeInLeft: false,
                errorColor:  Colors.red.shade900
                  ,
                  obscureText: false,
                  label: 'الاسم الكامل',
                  controller: controller.nameController,
                  keyboardType: TextInputType.emailAddress,
                  validationType: "string",
                  borderRadius:6
                // validationType: "password",
              ),
            ),
            Container(
              padding: const EdgeInsets.all(4),
              // margin: const EdgeInsets.all(10),
              height: 75,
              child: CustomTextFormField(
                  shouldFadeInLeft: false,

                errorColor:  Colors.red.shade900
                  ,
                  obscureText: false,
                  label: 'العمر',
                  controller: controller.ageController,
                  keyboardType: TextInputType.number,
                  validationType: "age",
                  borderRadius:6
                // validationType: "password",
              ),
            ),

              // _textField(controller.ageController, 'العمر', type: TextInputType.number, validator: true),
              const SizedBox(height: 10),
              const Text('الوضع الصحي:'),
              Obx(() => Column(
                children: controller.conditions.map((cond) {
                  return CheckboxListTile(
                    title: Text(cond),
                    value: controller.selectedConditions.contains(cond),
                    onChanged: (val) => controller.toggleCondition(cond, val!),
                  );
                }).toList(),
              )),
              Obx(() {
                if (!controller.showOtherDiseaseField.value) return const SizedBox();
                return Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: controller.otherDiseaseController,
                            decoration: const InputDecoration(labelText: 'أمراض أخرى'),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: controller.addAdditionalDisease,
                        )
                      ],
                    ),
                    ...controller.additionalDiseases.map((disease) => ListTile(
                      title: Text(disease),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => controller.additionalDiseases.remove(disease),
                      ),
                    )),
                  ],
                );
              }),



              Container(
                padding: const EdgeInsets.all(4),
                // margin: const EdgeInsets.all(10),
                height: 75,
                child: CustomTextFormField(
                    shouldFadeInLeft: false,

                    errorColor:  Colors.red.shade900
                    ,
                    obscureText: false,
                    label: 'الأدوية الحالية',
                    controller: controller.medicationsController,
                    keyboardType: TextInputType.name,
                    validationType: "string",
                    borderRadius:6
                  // validationType: "password",
                ),
              ),
              // _textField(controller.medicationsController, 'الأدوية الحالية'),

              Container(
                padding: const EdgeInsets.all(4),
                // margin: const EdgeInsets.all(10),
                height: 75,
                child: CustomTextFormField(
                    shouldFadeInLeft: false,

                    errorColor:  Colors.red.shade900
                    ,
                    obscureText: false,
                    label: 'الحساسية من أدوية معينة',
                    controller: controller.allergyController,
                    keyboardType: TextInputType.number,
                    validationType: "age",
                    borderRadius:6
                  // validationType: "password",
                ),
              ),
              // _textField(controller.allergyController, 'الحساسية من أدوية معينة'),

              Container(
                padding: const EdgeInsets.all(4),
                // margin: const EdgeInsets.all(10),
                height: 75,
                child: CustomTextFormField(
                    shouldFadeInLeft: false,

                    errorColor:  Colors.red.shade900
                    ,
                    obscureText: false,
                    label: 'رقم الجوال',
                    controller: controller.phoneController,
                    keyboardType: TextInputType.phone,
                    validationType: "phone",
                    borderRadius:6
                  // validationType: "password",
                ),
              ),

              // _textField(controller.phoneController, 'رقم الجوال', type: TextInputType.phone, validator: true),
              const SizedBox(height: 20),
              const Text('تفاصيل المعالجات', style: TextStyle(fontWeight: FontWeight.bold),),
              Obx(() => Column(
                children: controller.treatments.asMap().entries.map((entry) {
                  int index = entry.key;
                  var treatment = entry.value;
                  String? selectedValue = controller.treatmentTypes.contains(treatment['type']) ? treatment['type'] : null;
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        children: [
                          DropdownButtonFormField<String>(
                            value: selectedValue,
                            items:controller. treatmentTypes
                                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                                .toList(),
                            onChanged: (val) => controller.treatments[index]['type'] = val,
                            decoration: const InputDecoration(labelText: 'نوع المعالجة'),
                          ),
                          TextFormField(
                            decoration: const InputDecoration(labelText: 'رقم السن'),
                            onChanged: (val) => controller.treatments[index]['tooth'] = val,
                          ),
                          Text('تاريخ العلاج: ${DateFormat('yyyy-MM-dd').format(treatment['date'])}'),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => controller.removeTreatment(index),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              )),
              ElevatedButton(
                onPressed: controller.addTreatment,
                child: const Text('إضافة معالجة جديدة'),
              ),


              Container(
                padding: const EdgeInsets.all(4),
                // margin: const EdgeInsets.all(10),
                height: 160,
                child: CustomTextFormField(
                    shouldFadeInLeft: false,

                    errorColor:  Colors.red.shade900
                    ,
                    obscureText: false,
                    label:  'القصة السنية السابقة',
                    controller: controller.dentalHistoryController,
                    keyboardType: TextInputType.name,
                    maxLines: 3,
                    validationType: "nul",
                    borderRadius:6
                  // validationType: "password",
                ),
              ),

              // _textField(controller.dentalHistoryController, 'القصة السنية السابقة', maxLines: 3),
              const Text('صور شعاعية سابقة'),
              Obx(() => Column(
                children: controller.radiographs.asMap().entries.map((entry) {
                  int index = entry.key;
                  var r = entry.value;
                  return ListTile(
                    title: Text('الصورة: ${r['path']}'),
                    subtitle: Text('التاريخ: ${DateFormat('yyyy-MM-dd').format(r['date'])}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => controller.removeRadiograph(index),
                    ),
                  );
                }).toList(),
              )),
              ElevatedButton(
                onPressed: controller.addRadiograph,
                child: const Text('إضافة صورة شعاعية'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: controller.savePatientData,
                child: const Text('حفظ'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textField(TextEditingController c, String label,
      {TextInputType type = TextInputType.text, bool validator = false, int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: c,
        keyboardType: type,
        maxLines: maxLines,
        decoration: InputDecoration(border: const OutlineInputBorder(), labelText: label),
        validator: validator ? (val) => val == null || val.isEmpty ? 'الرجاء إدخال $label' : null : null,
      ),
    );
  }
}
