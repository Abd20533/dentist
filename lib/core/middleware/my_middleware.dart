import 'package:dentist/core/constant/routes_name.dart';
import 'package:dentist/core/services/services.dart';
import 'package:dentist/core/shared/my_cash_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;
  MyServices 
  myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.mySharedPreferences.get("initialized") != "False") {
      return const RouteSettings(name: AppNameRoutes
      .onBoarding);
      // return const RouteSettings(name: AppNameRoutes
      // .home);
    }
    if (CashHelper.getUserToken() != null && CashHelper.getUserToken()!.isNotEmpty) {

      // if(CashHelper.getUserToken()!.isNotEmpty){
      return const RouteSettings(name: AppNameRoutes
          .home);

    }

    if(myServices.mySharedPreferences.get("initialized") == "False"){
      return const RouteSettings(name: AppNameRoutes
          .register);

    }
    return null;
  }
}
