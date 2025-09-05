


import 'package:dentist/core/class/crud.dart';
import 'package:dentist/core/constant/app_link_api.dart';
class Reports {
  final Crud crud;

  Reports({
    required this.crud,
  });


  postData({
    required String radiograph_id,
    required String patient_id,

  }

      ) async {




    Map<String, dynamic>data={
      "patient_id":patient_id,
      "radiograph_id":radiograph_id



    };

    String end=patient_id;
    String linkUrl="${AppLinkApi.addRadiographToPatient}$end'/'";


    var response = await crud.postData(
        linkUrl:linkUrl

        , data: data );
    return response.fold((l) => l, (r) => r);
  }
}
