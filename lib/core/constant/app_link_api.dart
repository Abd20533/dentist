class AppLinkApi {
  // static const String urlServer = "http://192.168.16.209:8000/api/";
  // static const String urlServer = "http://192.168.1.106:8000/api/";
  static const String urlServer = "http://10.224.142.209:8000/api/";
  static const String urlServerImage = "http://10.224.142.209:8000";

  // 10.224.142.209:8000
  // static const String urlServer = "http://10.126.104.209:8000/api/";
  // static const String urlServerImage = "http://10.126.104.209:8000";

//auth
  static const register = 'register/';
  static const login = 'token/';
  static const userinfo = 'userinfo/';
  static const userinfoUpdate = 'userinfo/update/';
  static const changePassword = 'change_password/';
  static const forgetPassword = 'forget_password/';
  static const resetPassword = 'reset_password/';



 //patients

  static const patients="patients";

  static const getPatients = '$patients/getPatients/';

  static const addRadiographToPatient = '$patients/addRadiographToPatient/';
  static const addPatient = '$patients/addPatient/';
  static const deletePatient = '$patients/deletePatient/';
  static const patientDelete = '$patients/patients/delete/';


  static const radiograph= "Radiograph";
  static const analyzeRadiograph = '$radiograph/analyzeRadiograph/';
  static const radiographDelete = '$radiograph/radiographDelete/';






  // ###############   allergies

  static const allergies="allergies";
  static const allergiesAdd = '$allergies/allergiesAdd/';
  static const allergiesGet = '$allergies/allergiesGet/';
  static const allergiesDelete = '$allergies/allergiesDelete/';



//   ##################### medications
  static const medications="medications";
  static const medicationsGet = '$medications/medicationsGet/';
  static const medicationsAdd = '$medications/addMedicationToPatient/';
  static const medicationsDelete = '$medications/medicationsDelete/';


  static const treatments="treatments";


  static const treatmentsGet = '$treatments/treatmentsGet/';
  static const treatmentsDelete = '$treatments/treatmentsDelete/';
  static const addTreatmentToPatient = '$treatments/addTreatmentToPatient/';



  static const condition="Condition";


  static const addCondition = '$condition/addCondition/';
  static const getConditions = '$condition/getConditions/';
  static const deleteCondition = '$condition/deleteCondition/';





}
