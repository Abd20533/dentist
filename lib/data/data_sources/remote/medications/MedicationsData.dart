import 'package:dentist/core/class/crud.dart';
import 'package:dentist/core/constant/app_link_api.dart';
class AddMedicationsData {
  final Crud crud;

  AddMedicationsData({
    required this.crud,
  });




  postData({

    required String name,
    required String dosage,
    required String times_per_day,
    required String time_of_day,
    required String duration,
    required String notes,
    required String patientId,


  }



  ) async {






    Map<String, dynamic>data={



        "name": name,
        "dosage": dosage,
        "times_per_day": times_per_day,
        "time_of_day": time_of_day,
        "duration":duration,
        "notes": notes



    };

    String end=patientId;
    String linkUrl="${AppLinkApi.medicationsAdd}$end/";


    var response = await crud.postData(
        linkUrl:linkUrl

        , data: data );
    return response.fold((l) => l, (r) => r);
  }











  medicationsDelete({

    required String medicationId,
    required String patientId,

  }

      ) async {

    Map<String, dynamic>data=  {

    };

    // http://127.0.0.1:8000/api/medications/medicationsDelete/1/2/

    String linkUrl= "${AppLinkApi.medicationsDelete}$patientId/$medicationId/";


    var response = await crud.deleteData(
      linkUrl:linkUrl


      , data: data,
    );
    return response.fold((l) => l, (r) => r);
  }


}
