
import 'package:dentist/core/class/crud.dart';
import 'package:dentist/core/constant/app_link_api.dart';

class SignUpData {
  final Crud crud;

  SignUpData({
    required this.crud,
  });

  postData({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {

    Map<String, dynamic>data={


      'first_name': firstName,
      'last_name': lastName,
      'password': password,
      'email': email,
    };
    var response = await crud.registerData(linkUrl: AppLinkApi.register, data: data);
    return response.fold((l) => l, (r) => r);
  }
}
