

import 'dart:io';

import 'package:dentist/core/class/crud.dart';
import 'package:dentist/core/class/crud_with_dio.dart';
import 'package:dentist/core/constant/app_link_api.dart';
class AddRadiographToPatientsData {
  final Crud crud;

  AddRadiographToPatientsData({
    required this.crud,
  });





  analyzeRadiograph({

    required String patient_id,
    required String radiograph_id,

  }

      ) async {

    Map<String, dynamic>data=  {
      "patient_id": patient_id,
      "radiograph_id": radiograph_id

    };




    String linkUrl=AppLinkApi.analyzeRadiograph;




    var response = await crud.postData(
        linkUrl:linkUrl


        , data: data,
      );
    return response.fold((l) => l, (r) => r);
  }


  postData({
    required File photo,
    required String patientId,
  }) async {
    String linkUrl = "${AppLinkApi.radiographsAdd}$patientId/";
    // String linkUrl = "${AppLinkApi.addRadiographToPatient}$patientId/";

    print("i am here in postData");





    var response = await crud.postRequestWithImageOneDio(
      linkUrl: linkUrl,
      data: {},
      image: photo,
    );

    return response.fold((l) => l, (r) => r);
  }



  deleteRadiograph({

    required String radiograph_id,

  }

      ) async {

    Map<String, dynamic>data=  {
      "radiograph_id": radiograph_id

    };



    // http://127.0.0.1:8000/api/Radiograph/radiographsAdd/1/
    String linkUrl= "${AppLinkApi.radiographDelete}$radiograph_id/";
    // String linkUrl= "${AppLinkApi.radiographDelete}$radiograph_id/";


    var response = await crud.deleteData(
      linkUrl:linkUrl


      , data: data,
    );
    return response.fold((l) => l, (r) => r);
  }





}
