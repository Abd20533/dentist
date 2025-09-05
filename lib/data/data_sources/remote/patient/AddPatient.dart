

import 'package:dentist/core/class/crud.dart';
import 'package:dentist/core/constant/app_link_api.dart';
class AddPatientsData {
  final Crud crud;

  AddPatientsData({
    required this.crud,
  });

  postData({

  required String name,
  required String phone,
  required String gender,
  required String age,

}

      ) async {




      Map<String, dynamic>data={


        'name': name,
        'age': age,
        'gender': gender,
        'phone': phone,
      };

    var response = await crud.postData(linkUrl: AppLinkApi.addPatient, data: data);
    return response.fold((l) => l, (r) => r);
  }
}
