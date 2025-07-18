class ModelLogin{


  late final String access;


  ModelLogin(this.access);


  ModelLogin.formJson(dynamic json) {

    access = json['access'];
  }





}

