


import 'dart:io';

import 'package:dentist/core/class/crud.dart';
import 'package:dentist/core/constant/app_link_api.dart';
class UserData{
  final Crud crud;

  UserData({
    required this.crud,
  });


 putData({
    required File photo,
    required String email,
  }) async {
    String linkUrl = AppLinkApi.userinfoUpdate;

    var response = await crud.putRequestWithImageOneDio(
      email: email,

      linkUrl: linkUrl,
      data: {

      },
      image: photo,
    );

    return response.fold((l) => l, (r) => r);
  }





  getData() async {





  String linkUrl=AppLinkApi.userinfo;

  print("___________getData____________");

  var response = await crud.getData(
      linkUrl:linkUrl

      , data: {} );
  return response.fold((l) => l, (r) => r);
}



}
