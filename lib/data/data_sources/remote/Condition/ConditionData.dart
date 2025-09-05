


import 'package:dentist/core/class/crud.dart';
import 'package:dentist/core/constant/app_link_api.dart';
class ConditionData{
  final Crud crud;

  ConditionData({
    required this.crud,
  });


  postData({
    required String patientId,
    required  Map<String, dynamic>dataMap

  }

      ) async {




    Map<String, dynamic>data=dataMap;

    String linkUrl=AppLinkApi.addCondition;


    var response = await crud.postData(
        linkUrl:linkUrl

        , data: data );
    return response.fold((l) => l, (r) => r);
  }







  deleteData({


    required String condition_id,

  }

      ) async {

    String linkUrl= AppLinkApi.deleteCondition;
    Map<String, dynamic> data={"condition_id":condition_id};

    var response = await crud.deleteData(
      linkUrl:linkUrl


      , data: data
    );
    return response.fold((l) => l, (r) => r);
  }




}
