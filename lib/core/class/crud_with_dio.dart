import 'dart:io';

import 'package:dentist/core/constant/app_link_api.dart';
import 'package:dentist/core/shaerd/my_cash_helper.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;
  // static String token = CashHelper.getUserToken()! != "" ? CashHelper.getUserToken()! : "";
  static String token = CashHelper.getUserToken() ??"";


  CashHelper cashHelper = CashHelper();

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: AppLinkApi.urlServer,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(milliseconds: 10000),
        receiveTimeout: const Duration(milliseconds: 10000),
      ),
    );
  }

  static Future<Response> myPost({
    required String endPont,
    required myData,
  }) async {

    print("myPost");
    print('token is: $token');

    print(AppLinkApi.urlServer +"${endPont}");

    FormData formData = FormData.fromMap(myData);
    dynamic rul=await dio.post(endPont,
        data: formData,
        options: Options(
            headers: {'Authorization': 'Bearer $token',

        'Accept': 'application/json',
              // 'Content-Type': 'application/json',
            },
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }));
    print("rul is: ${rul.toString()}");

    return  rul;
  }



  static Future<Response> register({
    required String endPont,
    required myData,
  }) async {

    print("myPost");
    print('token is: $token');

    print(AppLinkApi.urlServer +"${endPont}");

    FormData formData = FormData.fromMap(myData);
    dynamic rul=await dio.post(endPont,
        data: formData,
        options: Options(
            headers: {
              // 'Authorization': 'Bearer $token',

              'Accept': 'application/json',
              // 'Content-Type': 'application/json',
            },
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }));
    print("rul is: ${rul.toString()}");

    return  rul;
  }


  static Future<Response> register1({
    required String endPont,
    required myData,
  }) async {
    return await dio.post(endPont,
        data: myData,
        options: Options(
            headers: {
              'Authorization': 'Bearer $token',
              'Accept': 'application/json',
              // 'Content-Type': 'application/json',
            },
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }));
  }

static Future<Response> myGet({
    required String endPont,
     myData,
  }) async {


    return await dio.get(endPont,
        data: myData,
        options: Options(
            headers: {
              'Authorization': 'Bearer $token',
              'Accept': 'application/json',
              'Content-Type': 'application/json',
            },
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }));
  }


 


  static Future<Response> myDelete({
    required String endPont,
    required myData,
  }) async {
    return await dio.delete(endPont,
        data: myData,
        options: Options(
            headers: {
              'Authorization': 'Bearer $token',
              'Accept': 'application/json',
              'Content-Type': 'application/json',
            },
            followRedirects: false,
            validateStatus: (status) {
              return status! < 500;
            }));
  }


  static Future<Response> updateProfile(
      {required String firstName,required String lastName, required File imageFile,required endPont}) async {
      if (!imageFile.existsSync()) {
        throw Exception('Image file does not exist.');
      }

      var formData = FormData.fromMap({
        'first_name': firstName,
        'last_name': lastName,
        'image': await MultipartFile.fromFile(imageFile.path,
            filename: imageFile.path.split('/').last), // Use correct file path
      });


       return  await dio.post(endPont,
          data: formData,
          options: Options(
              headers: {
                'Authorization': 'Bearer $token',
                'Accept': 'application/json',
                'Content-Type': 'application/json',

              },
              followRedirects: false,
              validateStatus: (status) {
                return status! < 500;
              }));


  }





// var response = await dio.post(
//   'http://127.0.0.1:8000/api/update-profile',
//   options: Options(headers: headers),
//   data: formData,
// );

// if (response.statusCode == 200 || response.statusCode == 201) {
//   return response.data; // Return the response data
// } else {
//   // Handle errors more gracefully
//   print('Error updating profile: ${response.statusCode} - ${response.statusMessage}');
//   print('Response data: ${response.data}'); // for debugging purpose
//   return null; //Or throw an exception depending on your error handling strategy
// }




}