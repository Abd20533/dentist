


/// todo ViewPatientDetailsPage{
/// todo  ViewPatientDetailsPage #######################
//
// class ViewPatientDetailsPage extends StatelessWidget {
//    ViewPatientDetailsPage({super.key, required this.Patient});
//
//    final PatientModel Patient;
//   final controller = Get.find<PatientController>();
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.only(top: 38.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//
//               BuildSectionHeader(title: "View Patient Details".tr,onAdd: (){
//
//                 Get.back();
//
//               },
//                 icon: Icons.arrow_forward
//                 ,),
//
//               CircleAvatar(
//                 radius: 50,
//                   // backgroundColor: Colors.orange,
//                   backgroundColor: Colors.teal,
//
//
//
//                   // child:               Icon(FontAwesomeIcons.tooth,color: Colors.blue.shade500,size: 50,)
//                   child:               Icon(FontAwesomeIcons.tooth,color: Colors.white,size: 50,)
//
//               ),
//
//               text(),
//               TitleRow(value: Patient.age.toString(), labelColor: Colors.teal,title: "age",),
//               TitleRow(value: Patient.gender, labelColor: Colors.teal,title: "Gender",),
//               TitleRow(value: Patient.phone, labelColor: Colors.teal,title: "Phone",),
//               TitleRow(value: Patient.allergies, labelColor: Colors.teal,title: "Allergies",),
//
//
//
//             ],
//
//
//           ),
//         ),
//
//
//
//       ),
//
//
//     );
//
//   }
//    Widget text(){
//      return
//        Padding(
//          padding: const EdgeInsets.only(top: 10.0),
//          child: Text(Patient.name,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
//        )
//
//
//      ;
//
//
//    }
//
//
//
//
// }
//
//
//
// class TitleRow extends StatelessWidget {
//   final String? value;
//   final Color labelColor;
//   final TextStyle? valueStyle;
//   final double gap;
//   final String title;
//
//   const TitleRow({
//     super.key,
//     required this.value,
//     this.labelColor = Colors.teal,
//     this.valueStyle,
//     this.gap = 8.0, required this.title,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.center,
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Text(
//           title,
//           style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//             color: labelColor,
//             fontWeight: FontWeight.w600,
//             fontSize: 16
//           ),
//         ),
//         SizedBox(width: gap),
//         Text(
//           value != null ? '$value' : '—',
//           style: valueStyle ??
//               Theme.of(context).textTheme.bodyMedium?.copyWith(
//                 fontWeight: FontWeight.w500,
//               ),
//         ),
//
//         IconButton(onPressed: () {
//
//         }, icon: Icon(Icons.edit),color: Colors.teal,)
//       ],
//     );
//   }
// }


/// todo #####################################  down(


// import 'dart:ui';
//import 'package:dentist/data/model/Patient/ToothTreatmentModel.dart';
// import 'package:intl/intl.dart' as intl;
//
// import 'package:dentist/data/model/Patient/MedicationModel.dart';
// //
//
// BuildSectionHeader(
// title: "صور الأشعة",
// onAdd: () {
// _showAddRadiographDialog(context);
// },
// icon: Icons.add_photo_alternate,
// ),
//
// const SizedBox(height: 10),
//
// patient.radiographs!.isEmpty
// ? const Text("لا توجد صور أشعة مضافة بعد")
// : GridView.builder(
// shrinkWrap: true,
// physics: const NeverScrollableScrollPhysics(),
// gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 2, // صورتين في كل صف
// crossAxisSpacing: 8,
// mainAxisSpacing: 8,
// ),
// itemCount: patient.radiographs!.length,
// itemBuilder: (context, index) {
//
// final radiograph = patient.radiographs![index];
// return Card(
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(12)),
// clipBehavior: Clip.antiAlias,
// child: Image.asset(
// radiograph.photo,
// fit: BoxFit.cover,
// ),
// );
// },
// ),
//
//
//
// BuildSectionHeader(
// title: "المعالجات السنية",
// onAdd: () {
// _showAddTreatmentDialog(context);
// },
// icon: Icons.add_circle_outline,
// ),
//
// const SizedBox(height: 10),
//
// patient.treatments == null || patient.treatments!.isEmpty
// ? const Text("لا توجد معالجات مضافة بعد")
// : SizedBox(
// height: MediaQuery.of(context).size.height/3.5,
// // height: 220,
// child: ListView.builder(
// scrollDirection: Axis.horizontal,
// // scrollDirection: Axis.vertical,
// itemCount: patient.treatments!.length,
// itemBuilder: (context, index) {
// final treatment = patient.treatments![index];
// return _buildToothCard(treatment);
// },
// ),
// ),
//
// const SizedBox(height: 20),
//
// BuildSectionHeader(
// title: "الأدوية",
// onAdd: () {
// _showAddMedicationDialog(context);
// },
// icon: Icons.add_circle_outline,
// ),
//
// const SizedBox(height: 10),
//
// patient.medications == null
// ? const Text("لا توجد أدوية مضافة بعد")
// : SizedBox(
// height: MediaQuery.of(context).size.height / 3.5,
// child: ListView.builder(
// scrollDirection: Axis.horizontal,
// itemCount: patient.medications!.length,
// itemBuilder: (context, index) {
// final medication = patient.medications![index];
// return _buildMedicationCard(medication);
// },
//
// ),
// ),
//
// const SizedBox(height: 20),
//
// ###############
/// todo
// //
// Widget _buildMedicationCard1(Medication medication) {
//   return Card(
//     elevation: 3,
//     shadowColor: Colors.grey.shade500,
//
//     color: Colors.white,
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//     child: Container(
//       width: 200,
//       padding: const EdgeInsets.all(8),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//
//           // Icon(FontAwesomeIcons.bookMedical),
//           // Icon(FontAwesomeIcons.notesMedical),
//           Icon(FontAwesomeIcons.briefcaseMedical),
//           Text("اسم الدواء: ${medication.name}", style: const TextStyle(fontWeight: FontWeight.bold)),
//           if (medication.dosage != null) Text("الجرعة: mg${medication.dosage}  "),
//           if (medication.timesPerDay != null) Text("مرات اليوم: ${medication.timesPerDay}"),
//           if (medication.timeOfDay != null) Text("وقت اليوم: ${medication.timeOfDay}"),
//           if (medication.duration != null) Text("المدة: ${medication.duration}"),
//           if (medication.notes != null) Text("ملاحظات: ${medication.notes}"),
//         ],
//       ),
//     ),
//   );
// }
//
//
//
//
// Widget _buildMedicationCard(Medication medication) {
//   return Card(
//     elevation: 3,
//     shadowColor: Colors.grey.shade500,
//     color: Colors.white,
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//     child: Directionality(
//
//       textDirection: TextDirection.rtl,
//       // textDirection: TextDirection.ltr,
//       child: Container(
//         width: 200,
//         padding: const EdgeInsets.all(8),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Icon(FontAwesomeIcons.briefcaseMedical),
//             Text("اسم الدواء: ${medication.name}", style: const TextStyle(fontWeight: FontWeight.bold)),
//             if (medication.dosage != null) Text("الجرعة: mg${medication.dosage}"),
//             if (medication.timesPerDay != null) Text("مرات اليوم: ${medication.timesPerDay}"),
//             if (medication.timeOfDay != null) Text("وقت اليوم: ${medication.timeOfDay}"),
//             if (medication.duration != null) Text("المدة: ${medication.duration}"),
//             if (medication.notes != null) Text("ملاحظات: ${medication.notes}"),
//           ],
//         ),
//       ),
//     ),
//   );
// }
//
//
// void _showAddMedicationDialog(BuildContext context) {
//   final nameController = TextEditingController();
//   final dosageController = TextEditingController();
//   final timesPerDayController = TextEditingController();
//   final timeOfDayController = TextEditingController();
//   final durationController = TextEditingController();
//   final notesController = TextEditingController();
//
//   showDialog(
//     context: context,
//     builder: (_) => AlertDialog(
//       title: const Text("إضافة دواء"),
//       content: SingleChildScrollView(
//         child: Column(
//           children: [
//             TextField(controller: nameController, decoration: const InputDecoration(labelText: "اسم الدواء")),
//             TextField(controller: dosageController, decoration: const InputDecoration(labelText: "الجرعة")),
//             TextField(controller: timesPerDayController, decoration: const InputDecoration(labelText: "مرات اليوم")),
//             TextField(controller: timeOfDayController, decoration: const InputDecoration(labelText: "وقت اليوم")),
//             TextField(controller: durationController, decoration: const InputDecoration(labelText: "المدة")),
//             TextField(controller: notesController, decoration: const InputDecoration(labelText: "ملاحظات")),
//           ],
//         ),
//       ),
//       actions: [
//         TextButton(onPressed: () => Get.back(), child: const Text("إلغاء")),
//         ElevatedButton(
//           style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
//           onPressed: () {
//             final newMedication = Medication(
//               id: DateTime.now().millisecondsSinceEpoch,
//               name: nameController.text,
//               dosage: dosageController.text,
//               timesPerDay: timesPerDayController.text,
//               timeOfDay: timeOfDayController.text,
//               duration: durationController.text,
//               notes: notesController.text,
//               patient: patient.id,
//             );
//
//
//             patient.medications?.add(newMedication);
//
//
//             Get.back();
//           },
//           child: const Text("حفظ"),
//         ),
//       ],
//     ),
//   );
// }
//  void _showAddRadiographDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (_) => AlertDialog(
//         title: const Text("إضافة صورة أشعة"),
//         content: const Text("اختر صورة من المعرض أو الكاميرا"),
//         actions: [
//           TextButton(
//             onPressed: () {
//               print("فتح الكاميرا");
//               Get.back();
//             },
//             child: const Text("📷 كاميرا"),
//           ),
//           TextButton(
//             onPressed: () {
//               print("فتح المعرض");
//               Get.back();
//             },
//             child: const Text("🖼 المعرض"),
//           ),
//         ],
//       ),
//     );
//   }
//   Widget _buildToothCard(ToothTreatmentModel treatment) {
//     final formattedDate =intl. DateFormat.yMMMd().format(
//       DateTime.parse(treatment.treatmentDate),
//     );
//
//     return Card(
//       elevation: 3,
//       shadowColor: Colors.grey.shade300,
//       color: Colors.white,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Container(
//         width: 160,
//         padding: const EdgeInsets.all(8),
//         child: Column(
//           children: [
//             treatment.image != null
//                 ? Image.asset(treatment.image!, width: 120, height: 80, fit: BoxFit.cover)
//                 : const Icon(FontAwesomeIcons.tooth, size: 60, color: Colors.black),
//
//             const SizedBox(height: 8),
//             Text("سن رقم: ${treatment.toothNumber}"),
//             Text("الحالة: ${treatment.condition}"),
//             Text("العلاج: ${treatment.treatmentType ?? "غير محدد"}"),
//             Text("التاريخ: $formattedDate"),
//             const SizedBox(height: 6),
//             CircleAvatar(
//               radius: 6,
//               // backgroundColor: Color(int.parse(treatment.color)),
//
//               backgroundColor:   controller.getColorFromString(treatment.color)
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//   void _showAddTreatmentDialog(BuildContext context) {
//     final toothNumberController = TextEditingController();
//     final conditionController = TextEditingController();
//     final treatmentTypeController = TextEditingController();
//
//     showDialog(
//       context: context,
//       builder: (_) => AlertDialog(
//         title: const Text("إضافة معالجة سنية"),
//         content: SingleChildScrollView(
//           child: Column(
//             children: [
//               TextField(
//                 controller: toothNumberController,
//                 keyboardType: TextInputType.number,
//                 decoration: const InputDecoration(labelText: "رقم السن"),
//               ),
//               TextField(
//                 controller: conditionController,
//                 decoration: const InputDecoration(labelText: "الحالة"),
//               ),
//               TextField(
//                 controller: treatmentTypeController,
//                 decoration: const InputDecoration(labelText: "نوع العلاج"),
//               ),
//             ],
//           ),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Get.back(),
//             child: const Text("إلغاء"),
//           ),
//           ElevatedButton(
//             style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
//             onPressed: () {
//               final newTreatment = ToothTreatmentModel(
//                 id: DateTime.now().millisecondsSinceEpoch,
//                 condition: conditionController.text,
//                 color: "white",
//                 treatmentType: treatmentTypeController.text,
//                 toothNumber: toothNumberController.text,
//                 treatmentDate: DateTime.now().toIso8601String(),
//                 patient: patient.id,
//                 image: "assets/images/tooth6.jpg",
//                 photo: "assets/images/tooth6.jpg",
//               );
//
//               // إضافة المعالجة لقائمة المريض
//               patient.treatments?.add(newTreatment);
//
//               Get.back();
//             },
//             child: const Text("حفظ"),
//           ),
//         ],
//       ),
//     );
//   }



//
// // الحقول
// buildInfoCard(
// context, "الاسم", patient.name, Icons.person, Colors.teal,),
// buildInfoCard(context, "العمر", "${patient.age}",
// Icons.cake, Colors.teal),
// buildInfoCard(
// context, "الجنس", patient.gender, Icons.male, Colors.teal),
// SizedBox(
// child: buildInfoCard(context, "الهاتف", patient.phone,
// Icons.phone, Colors.teal),
// ),

//
// Widget buildInfoCard(BuildContext context, String title, String? value,
//     IconData icon, Color color) {
//   return Card(
//     margin: const EdgeInsets.symmetric(vertical: 6),
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//     elevation: 2,
//     shadowColor: Colors.grey,
//     color: Colors.white,
//     child: ListTile(
//       leading: Icon(icon, color: color),
//       title: Text(
//         title,
//         style: TextStyle(
//             color: color, fontWeight: FontWeight.bold, fontSize: 16),
//       ),
//       subtitle: Text(
//         value ?? "غير مُضاف",
//         style: const TextStyle(fontSize: 15),
//       ),
//       trailing: IconButton(
//         icon: Icon(value == null ? Icons.add : Icons.edit, color: color),
//         onPressed: () {
//           _showEditDialog(context, title, value);
//         },
//       ),
//     ),
//   );
// }

/// todo #####################################  down )

/// todo ViewPatientDetailsPage }
