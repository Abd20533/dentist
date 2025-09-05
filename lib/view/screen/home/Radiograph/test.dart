//
// Get.dialog(
//   AlertDialog(
//     title: Text(
//         "نتيجة التحليل: ${report.summary}"),
//     content: SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment:
//         CrossAxisAlignment
//             .start,
//         children: [
//           Image.network(report
//               .annotatedImage),
//           const SizedBox(
//               height: 10),
//           const Text(
//               "تفاصيل الاكتشافات:"),
//           const SizedBox(
//               height: 8),
//           ...report.findings
//               .asMap()
//               .entries
//               .map((entry) {
//             final i = entry.key;
//             final f = entry.value;
//             return Card(
//               margin:
//               const EdgeInsets
//                   .symmetric(
//                   vertical: 6),
//               elevation: 2,
//               child: Padding(
//                 padding:
//                 const EdgeInsets
//                     .all(8.0),
//                 child: Column(
//                   crossAxisAlignment:
//                   CrossAxisAlignment
//                       .start,
//                   children: [
//                     Text(
//                       "The tooth number: ${i + 1}",
//                       style: const TextStyle(
//                           fontWeight:
//                           FontWeight.bold),
//                     ),
//                     Text(
//                       "Detection: ${f.detectionClass} (${(f.detectionConfidence * 100).toStringAsFixed(2)}%)",
//                       style: const TextStyle(
//                           fontWeight:
//                           FontWeight.bold),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           }).toList(),
//         ],
//       ),
//     ),
//     actions: [
//       TextButton(
//         onPressed: () =>
//             Get.back(),
//         child:
//         const Text("إغلاق"),
//       )
//     ],
//   ),
// );


