
import 'package:dentist/controller/setting/settingController.dart';
import 'package:dentist/my_import.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorProfilePage extends StatelessWidget {
  final DoctorProfileController controller = Get.put(DoctorProfileController());
  // final DoctorProfileController controller = Get.put(DoctorProfileController()..getInfo());
  final LocaleController localeController = Get.find();

  DoctorProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.white,
        onPressed: () {
          if (controller.doctorImage.value == null) {
            Get.snackbar("تنبيه", "الرجاء اختيار صورة أولاً");
            return;
          }

          controller.putUser(
            email: controller.user.email ?? "", // تاخذ الإيميل الحالي
            photo: controller.doctorImage.value!, // تاخذ الصورة الجديدة
          );
        },
        icon: Icon(Icons.save, color: Colors.teal.shade300),
        label: const Text(
          "save",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),

      body: Obx(
        () {

          if(          controller.isLoading.value
          ){





            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                BuildSectionHeader(
                  title: "Doctor Profile",

                  icon: Icons.arrow_forward,

                ),
                Expanded(
                  child: Center(
                    child: SizedBox(
                      height: 300,
                      width: double.infinity,
                      child: LottieBuilder.asset(
                        "assets/Lottie/core/loading.json",
                        repeat: true,
                      ),
                    ),
                  ),
                ),
              ],
            );


          } if(  controller.statusRequest.value!= StatusRequest.success
          ){





            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                BuildSectionHeader(
                  title: "Doctor Profile",

                  icon: Icons.arrow_forward,

                ),
                Expanded(
                  child: Center(
                    child: SizedBox(
                      height: 300,
                      width: double.infinity,
                      child: LottieBuilder.asset(
                        "assets/Lottie/server.json",
                        repeat: true,
                      ),
                    ),
                  ),
                ),
              ],
            );


          }

          return

          SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,



              children: [


                const SizedBox(height: 30),


                BuildSectionHeader(
                  title: "Doctor Profile",

                  icon: Icons.arrow_forward,

                ),
                const SizedBox(height: 20),

                _buildDoctorImage(),
                const SizedBox(height: 30),

                // البيانات الأساسية للطبيب
                ListTile(
                  title: Text("Name is :"),
                  subtitle: Row(
                    children: [
                      Text(controller.user.firstName! ),
                      SizedBox(width: 10,),
                      Text(controller.user.lastName!),

                    ],
                  ),
                  leading: const Icon(Icons.person),
                ),



                ListTile(
                  title: Text("Email is :"),
                  subtitle: Text(controller.user.email!),
                  leading: const Icon(Icons.email),
                  trailing: IconButton(
                    icon: const Icon(Icons.edit, color: Colors.teal),
                    onPressed: controller.showEditEmailDialog,
                  ),
                ),



                _buildDateField(),

                const Divider(),

                SwitchListTile(
                  title: Text('Dark Mode'.tr),
                  value: localeController.appThemeMode.value == ThemeMode.dark,
                  onChanged: (value) {
                    localeController.changeAppThemeMode(value ? "dark" : "light");
                  },
                ),

                ListTile(
                  title: Text('Change Language'.tr),
                  trailing: DropdownButton<String>(
                    value: localeController.language?.languageCode,
                    items: const [
                      DropdownMenuItem(value: 'ar', child: Text('العربية')),
                      DropdownMenuItem(value: 'en', child: Text('English')),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        localeController.changeLanguage(value);
                      }
                    },
                  ),
                ),

                SizedBox(height: 50,)
              ],
            ),
          );

        },
   ),
    );
  }

  Widget _buildDoctorImage() {
    return Center(
      child: Stack(
        children: [


          Obx(() {
            if (controller.doctorImage.value != null) {
              return CircleAvatar(
                radius: 70,
                backgroundImage: FileImage(controller.doctorImage.value!),
              );
            } else if (controller.user.photo != null && controller.user.photo!.isNotEmpty) {
              return CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(controller.user.photo!),
              );
            } else {
              return const CircleAvatar(
                radius: 70,
                child: Icon(Icons.person, size: 60),
              );
            }
          }),

          // Obx(() {
          //   if (controller.doctorImage.value != null) {
          //     return CircleAvatar(
          //       backgroundColor: AppMyColor.teal200,
          //       radius: 70,
          //       backgroundImage: FileImage(controller.doctorImage.value!),
          //     );
          //   } else {
          //     return const CircleAvatar(
          //       backgroundColor: AppMyColor.teal200,
          //       radius: 70,
          //       child: Icon(Icons.person, size: 60, color: Colors.white),
          //     );
          //   }
          // }),
          Positioned(
            bottom: 0,
            right: 0,
            child: IconButton(
              icon: const Icon(Icons.camera_alt, size: 30),
              onPressed: controller.showImagePickerDialog,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDateField() {
    return Obx(() => ListTile(
      title: Text('Certificate Date'.tr),
      subtitle: Text(controller.certificateDate.value),
      trailing: const Icon(Icons.calendar_today),
      onTap: controller.selectCertificateDate,
    ));
  }
}

