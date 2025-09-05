

import 'package:dentist/core/class/crud.dart';
import 'package:dentist/core/constant/app_link_api.dart';
class GetPatientsData {
  final Crud crud;

  GetPatientsData({
    required this.crud,
  });

  getData(
  ) async {


    var response = await crud.getData(linkUrl: AppLinkApi.getPatients, data: {});
    return response.fold((l) => l, (r) => r);
  }




  deletePatient({

    required String patient_id,

  }

      ) async {

    // Map<String, dynamic>data=  {
    //   "radiograph_id": radiograph_id
    //
    // };


    String linkUrl= "${AppLinkApi.deletePatient}$patient_id/";


    var response = await crud.deleteData(
      linkUrl:linkUrl


      , data: {},
    );
    return response.fold((l) => l, (r) => r);
  }



}
