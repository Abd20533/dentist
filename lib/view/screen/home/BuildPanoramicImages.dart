



import 'package:dentist/controller/home/build_panoramic_images_controller.dart';
import 'package:dentist/my_import.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildPanoramicImages extends StatelessWidget {
  const BuildPanoramicImages({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BuildPanoramicImagesController>();

    const maxVisibleItems = 5;

    return Obx(() {
      final teeth = controller.teeth;
      final hasMore = teeth.length > maxVisibleItems;

      final displayedTeeth =
      hasMore ? teeth.take(maxVisibleItems - 1).toList() : teeth;

      if (hasMore) {
        displayedTeeth.add(
          controller.teeth.last, // فقط placeholder، لا يؤثر
        );
      }

      return GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        childAspectRatio: 1.3,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: displayedTeeth.asMap().entries.map((entry) {
          final index = entry.key;
          final tooth = entry.value;

          if (hasMore && index == displayedTeeth.length - 1) {
            return GestureDetector(
              onTap: () => print("عرض المزيد من الأسنان"),
              child: Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                color: Colors.grey[200],
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.more_horiz, size: 40, color: Colors.black54),
                      SizedBox(height: 8),
                      Text("عرض المزيد",
                          style: TextStyle(fontSize: 16, color: Colors.black87)),
                    ],
                  ),
                ),
              ),
            );
          }

          return Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    tooth.image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
                Positioned(
                  top: 8,
                  left: 8,
                  right: 8,
                  child: Row(
                    children: [
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: tooth.color,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          tooth.condition,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                color: Colors.black54,
                                offset: Offset(1, 1),
                                blurRadius: 2,
                              )
                            ],
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      );
    });
  }
}