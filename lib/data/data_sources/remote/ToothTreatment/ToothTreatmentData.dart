
import 'package:dentist/core/class/crud.dart';
import 'package:dentist/core/constant/app_link_api.dart';
class ToothTreatmentPatientsData {
  final Crud crud;

  ToothTreatmentPatientsData({
    required this.crud,
  });


  postData({


    required String patientId,
    required String condition,
    required String tooth_number,
    required String treatmentType,
    required String colorHex,

  }

      ) async {



    Map<String, dynamic> data = {
      "patient": patientId,          // في الباك لازم يكون المفتاح مثل الـ ForeignKey
      "condition": condition,        // يجي من CONDITION_CHOICES
      "treatment_type": treatmentType, // يجي من TREATMENT_CHOICES
      "tooth_number": tooth_number,
      "color": colorHex,             // hex string مثل "#FF0000"
    };

    Map<String, dynamic>data1={
      "patientId":patientId,
      "condition":condition,
      "tooth_number":tooth_number




    };

    String end=patientId;
    String linkUrl="${AppLinkApi.addTreatmentToPatient}$end/";


    var response = await crud.postData(
        linkUrl:linkUrl

        , data: data );
    return response.fold((l) => l, (r) => r);
  }









  getData(
      ) async {


    var response = await crud.getData(linkUrl: AppLinkApi.getPatients, data: {});
    return response.fold((l) => l, (r) => r);
  }



  deleteData({

    required String toothTreatmentId,
    required String patientId,

  }

      ) async {

    String linkUrl= "${AppLinkApi.treatmentsDelete}$patientId/$toothTreatmentId/";


    var response = await crud.deleteData(
      linkUrl:linkUrl


      , data: {},
    );
    return response.fold((l) => l, (r) => r);
  }



}
