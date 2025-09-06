
import 'package:dentist/view/screen/home/analysis/view_analysis_for_one_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dentist/my_import.dart';


class ViewPanoramaRays extends StatelessWidget {
  final int patientId;
  const ViewPanoramaRays({super.key, required this.patientId});

  @override
  Widget build(BuildContext context) {
    final AddRadiographToPatientsController addRadiographController =
    Get.put(AddRadiographToPatientsController());
    final PatientController patientController = Get.find<PatientController>();

    return Scaffold(
      drawer: const Drawer(),
      backgroundColor: Colors.white,
      body: Obx(() {


        if (addRadiographController.isAddImage.value) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("جاري التحميل"),
              SizedBox(height: 40,),
              const Center(child: CircularProgressIndicator(color: AppMyColor.teal300,)),
            ],
          );
        }
        if (addRadiographController.isLoading.value) {
          return const Center(child: CircularProgressIndicator(color: AppMyColor.teal300,));
        }




        final patient = patientController.patientsPostMan
            .firstWhere((p) => p.id == patientId);

        final radiographs = patient.radiographs ?? [];
        final reports = patient.analysisReports ?? [];


        if (addRadiographController.isExpandedList.length != radiographs.length) {
          addRadiographController.initExpansionStates(radiographs.length);
          addRadiographController.initAnalyzingStates(radiographs.length);
        }

        return radiographs.isEmpty
            ? Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 25),
            BuildSectionHeader(
              title: "صور الأشعة",
              icon: FontAwesomeIcons.arrowRight,
              onAdd: () => Get.back(),
            ),
            const Spacer(),
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Center(
                child: LottieBuilder.asset("assets/Lottie/empty.json",
                    repeat: true),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 3),
          ],
        )
            : SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 25),
              BuildSectionHeader(
                title: "صور الأشعة",
                icon: FontAwesomeIcons.arrowRight,
                onAdd: () => Get.back(),
              ),
              ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.all(12),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: radiographs.length,
                itemBuilder: (context, index) {
                  final radiograph = radiographs[index];
                  final relatedReports = reports
                      .where((r) => r.radiograph == radiograph.id)
                      .toList();

                  return Card(
                    shadowColor: Colors.grey,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.grey, width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,

                    margin: const EdgeInsets.only(bottom: 5),
                    child: Column(
                      children: [


                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            child: Row(
                              spacing: 8,
                              children: [
                                Icon(Icons.numbers_outlined,size: 20,color: AppMyColor.teal, ),
                                Text(
                                  "Rays : ${index + 1}",
                                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14,color: AppMyColor.black87),
                                ),




                              ],),
                          ),
                        ),


                        Padding(
                          padding: const EdgeInsets.only(top: 28.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width-50,
                            height: 140,


                            child: Image.network(
                              radiograph.photo,
                              height: 200,
                              // width: 200,
                              fit: BoxFit.cover,
                              // fit: BoxFit.fill,
                            ),
                          ),
                        ),


                        Row(



                          children: [


                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
                              child: SizedBox(
                                child: Row
                                  (
                                  spacing: 8,
                                  children: [

                                    Icon(Icons.timer_sharp,size: 20,color: AppMyColor.teal, ),
                                    Text(
                                      "Date : ",
                                      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13,color: AppMyColor.black87),
                                    ),
                                    Text(
                                      radiograph.date != null
                                          ? radiograph.date!.substring(0, 10)
                                          : "بدون تاريخ"

                                      ,
                                      style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12,color: AppMyColor.black87),
                                    ),


                                  ],),
                              ),
                            ),

                                    SizedBox(height: 10,),
                                    relatedReports.isEmpty
                                        ? Obx(() {
                                      final isAnalyzing = index <
                                          addRadiographController
                                              .isAnalyzingList
                                              .length
                                          ? addRadiographController
                                          .isAnalyzingList[index]
                                          : false;

                                      return isAnalyzing
                                          ? Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 18.0,horizontal: 10),
                                            child: SizedBox(
                                                                                  height: 40,
                                                                                  width: 40,
                                                                                  child:
                                                                                  CircularProgressIndicator(
                                            strokeWidth: 3,

                                            color: Colors
                                                .teal.shade200,
                                                                                  ),
                                                                                ),
                                          )
                                          : Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 18.0),
                                            child: IconButton(
                                                                                  onPressed: () {
                                            addRadiographController
                                                .analyzeRadiograph(
                                              index: index,
                                              patientId: patientId
                                                  .toString(),
                                              radiographId:
                                              radiograph.id
                                                  .toString(),
                                            );
                                                                                  },
                                                                                  icon: Icon(
                                            Icons
                                                .analytics_outlined,
                                            size: 32,
                                            color: Colors
                                                .teal.shade200,
                                                                                  ),
                                                                                ),
                                          );
                                    })
                                        : const SizedBox(height: 30),
                            IconButton(onPressed: (){

                              Get.to(() => ViewAnalysisForOneImage(
                                patientId: patient.id.toString(),
                                radiographsId: radiograph.id.toString(),
                              ));


                            },
                                icon:  Icon(Icons.visibility,
                                  size: 32, color: Colors.teal.shade200,)),



                                    IconButton(
                                      icon: const Icon(Icons.delete,
                                          size: 32, color: Colors.red),
                                      onPressed: () {
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
                                                  addRadiographController
                                                      .deleteRadiograph(
                                                    index: index,
                                                    patientId:
                                                    patientId.toString(),
                                                    radiographId:
                                                    radiograph.id
                                                        .toString(),
                                                  );
                                                  addRadiographController
                                                      .removeExpansionState(
                                                      index);
                                                  Get.back();
                                                },
                                                child: const Text("تأكيد",
                                                    style: TextStyle(
                                                        color: Colors.red)),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),


                                  ],



                        ),





                        Obx(() {
                          final isExpanded = index <
                              addRadiographController
                                  .isExpandedList.length
                              ? addRadiographController
                              .isExpandedList[index]
                              : false;

                          return ExpansionTile(
                            leading: const SizedBox(),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "اضغط لعرض التفاصيل",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Icon(
                                  isExpanded
                                      ? FontAwesomeIcons.arrowUp
                                      : FontAwesomeIcons.arrowDown,
                                  color: Colors.teal.shade200,
                                  size: 24,
                                ),
                              ],
                            ),
                            trailing: const SizedBox(width: 5),
                            initiallyExpanded: isExpanded,
                            onExpansionChanged: (expanded) {
                              addRadiographController
                                  .toggleExpansion(index);
                            },
                            children: relatedReports.isEmpty
                                ? const [
                              Padding(
                                padding: EdgeInsets.all(12),
                                child: Text(
                                    "لا توجد نتائج تحليل لهذه الصورة"),
                              )
                            ]
                                : relatedReports.map((report) {
                              return ListTile(
                                leading: Icon(
                                  FontAwesomeIcons.fileMedical,
                                  color: Colors.teal.shade200,
                                ),
                                title: Text(report.id.toString()),
                                subtitle: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "بتاريخ: ${report.createdAt.substring(0, 10)}"),
                                    const SizedBox(height: 4),
                                    Image.network(
                                        report.annotatedImage),
                                  ],
                                ),
                                onTap: () {

                                  Get.dialog(
                                    AlertDialog(
                                      title: Text("نتيجة التحليل: ${report.summary}"),
                                      content: SingleChildScrollView(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Image.network(report.annotatedImage),
                                            const SizedBox(height: 10),
                                            Text("تفاصيل الاكتشافات:"),
                                            const SizedBox(height: 8),
// ...report.findings.map((f) {
                                            ...report.findings.asMap().entries.map((entry) {

                                              final i = entry.key; //
                                              final f = entry.value;
                                              return Card(
                                                margin: const EdgeInsets.symmetric(vertical: 6),
                                                elevation: 2,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "The tooth number: ${i+1}",
                                                        style: const TextStyle(
                                                            fontWeight: FontWeight.bold),
                                                      ),Text(
                                                        "Detection: ${f.detectionClass} (${(f.detectionConfidence * 100).toStringAsFixed(2)}%)",
                                                        style: const TextStyle(
                                                            fontWeight: FontWeight.bold),
                                                      ),



                                                      Row(
                                                        children: [
                                                          Container(
                                                            width: 20,
                                                            height: 20,
                                                            margin: const EdgeInsets.only(right: 6),
                                                            decoration: BoxDecoration(
                                                              color: addRadiographController.classificationColors[f.classificationClass] ?? Colors.grey,
                                                              borderRadius: BorderRadius.circular(20),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Column(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                              children: [
                                                                Text(
                                                                  "Classification:"
                                                                  ,
                                                                  style: const TextStyle(fontWeight: FontWeight.w500),
                                                                ),Text(
                                                                  "${f.classificationClass} "
                                                                      "(${(f.classificationConfidence * 100).toStringAsFixed(2)}%)",
                                                                  style: const TextStyle(fontWeight: FontWeight.w500),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),

                                                      const SizedBox(height: 4),
                                                      Text("Details:"),
                                                      ...f.classificationDetails.entries.map((e) {


                                                        return Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: Row(
                                                            children: [

                                                              Container(
                                                                width: 20,
                                                                height: 20,
                                                                margin: const EdgeInsets.only(right: 6),
                                                                decoration: BoxDecoration(
                                                                  color: addRadiographController.classificationColors[e.key] ?? Colors.grey,
                                                                  borderRadius: BorderRadius.circular(20),
                                                                ),
                                                              ),
                                                              Text(
                                                                  "  ${e.key}: ${(e.value * 100).toStringAsFixed(2)}%"),
                                                            ],
                                                          ),
                                                        );
                                                      }),
                                                      const SizedBox(height: 4),
                                                      Text(
                                                          "Bounding Box: [${f.bbox.join(', ')}]"),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }),
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Get.back(),
                                          child: const Text("إغلاق"),
                                        )
                                      ],
                                    ),
                                  );





                                },
                              );
                            }).toList(),
                          );
                        }),
                      ],
                    ),
                  );


                },
                separatorBuilder: (context, index) {
                  return
                      SizedBox(height: 25,);
                },

              ),
              const SizedBox(height: 100),
            ],
          ),
        );
      }),


      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.white,
        onPressed: () {
          Get.bottomSheet(
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Wrap(
                children: [
                  ListTile(
                    leading: Icon(Icons.image, color: Colors.teal.shade300),
                    title: const Text("إضافة صورة"),
                    onTap: () {
                      addRadiographController.pickImageAndSubmit(
                        patientId.toString(),
                        patientController.patientsPostMan
                            .firstWhere((p) => p.id == patientId),
                      );
                      Get.back();
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.insert_drive_file, color: Colors.teal.shade300),
                    title: const Text("إضافة ملف"),
                    onTap: () {
                      addRadiographController.pickFileAndSubmit(
                        patientId.toString(),
                        patientController.patientsPostMan
                            .firstWhere((p) => p.id == patientId),
                      );
                      Get.back();
                    },
                  ),
                ],
              ),
            ),
          );
        },
        icon: Icon(Icons.add_a_photo, color: Colors.teal.shade300),
        label: const Text(
          "إضافة صورة/ملف",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),


      // floatingActionButton: FloatingActionButton.extended(
      //   backgroundColor: Colors.white,
      //   onPressed: () {
      //     addRadiographController.pickAndSubmit(
      //       patientId.toString(),
      //       patientController.patientsPostMan
      //           .firstWhere((p) => p.id == patientId),
      //     ).then((_) {
      //       addRadiographController.addExpansionState();
      //     });
      //   },
      //   icon: Icon(Icons.add_a_photo, color: Colors.teal.shade300),
      //   label: const Text(
      //     "إضافة صورة",
      //     style: TextStyle(color: Colors.black, fontSize: 16),
      //   ),
      // ),
    );
  }
}
