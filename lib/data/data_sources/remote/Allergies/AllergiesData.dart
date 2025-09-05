


import 'package:dentist/core/class/crud.dart';
import 'package:dentist/core/constant/app_link_api.dart';
class AllergiesData {
  final Crud crud;

  AllergiesData({
    required this.crud,
  });


  postData({

    required String patientId,
  required Map<String, dynamic> dataMap

  }

      ) async {




    Map<String, dynamic>data=dataMap;

    String end=patientId;
    String linkUrl="${AppLinkApi.allergiesAdd}$end/";


    var response = await crud.postData(
        linkUrl:linkUrl

        , data: data );
    return response.fold((l) => l, (r) => r);
  }

 deleteData({


    required String allergyId,
    required String patientId,

  }

      ) async {

    String linkUrl= "${AppLinkApi.allergiesDelete}$patientId/$allergyId/";


    var response = await crud.deleteData(
      linkUrl:linkUrl


      , data: {},
    );
    return response.fold((l) => l, (r) => r);
  }
}
