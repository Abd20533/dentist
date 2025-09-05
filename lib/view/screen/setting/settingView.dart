
import 'package:dentist/controller/setting/settingController.dart';
import 'package:dentist/core/constant/AppColor.dart';
import 'package:dentist/core/localization/change_local.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorProfilePage extends StatelessWidget {
  final DoctorProfileController controller = Get.put(DoctorProfileController());
  final LocaleController localeController = Get.find();

  DoctorProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: AppMyColor.backgroundColorApp,
      appBar: AppBar(
        backgroundColor: AppMyColor.backgroundColorApp,
        title: Text('Doctor Profile'.tr),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: controller.saveProfileWithSnackBar,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildDoctorImage(),
            const SizedBox(height: 30),

            _buildTextField(
              label: 'Name'.tr,
              value: controller.name.value,
              onChanged: (value) => controller.name.value = value,
            ),

            _buildTextField(
              label: 'Age'.tr,
              value: controller.age.value,
              onChanged: (value) => controller.age.value = value,
            ),

            _buildDateField(),

            Obx(() => SwitchListTile(
              title: Text('Dark Mode'.tr),
              value: localeController.appThemeMode.value == ThemeMode.dark,
              onChanged: (value) {
                localeController.changeAppThemeMode(value ? "dark" : "light");
              },
            )),

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
          ],
        ),
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
            } else {
              return const CircleAvatar(
                radius: 70,
                child: Icon(Icons.person, size: 60),
              );
            }
          }),
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

  Widget _buildTextField({
    required String label,
    required String value,
    required Function(String) onChanged,
  }) {
    return TextFormField(
      decoration: InputDecoration(labelText: label),
      initialValue: value,
      onChanged: onChanged,
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
