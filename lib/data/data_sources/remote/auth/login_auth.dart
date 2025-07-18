

import 'package:dentist/core/class/crud.dart';
import 'package:dentist/core/constant/app_link_api.dart';

class LoginData {
  final Crud crud;

  LoginData({
    required this.crud,
  });

  postData({
    // required String email,
    required String username,
    required String password,
  }) async {

     Map<String, dynamic>data={
    'password': password,
    'username': username,
    };
    var response = await crud.postData(linkUrl: AppLinkApi.login, data: data);
    return response.fold((l) => l, (r) => r);
  }
}
