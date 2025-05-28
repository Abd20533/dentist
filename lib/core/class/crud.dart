// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dentist/core/class/crud_with_dio.dart';
import 'package:dentist/core/class/status_request.dart';
import 'package:dentist/core/functions/check_internet.dart';
import 'package:http/http.dart' as http;

class Crud1 {
  Future<Either<StatusRequest, Map>> postData(
      {required String url, required Map data}) async {
    try {
      print("postData");
      if (await checkInternet()) {
        print("checkInternet: yes");

        var response =
            await http.post(Uri.parse("uri"), body: null, headers: null);
        if (response.statusCode == 200 || response.statusCode == 201) {
          var responseBody = jsonDecode(response.body);

          ///Map responseBody = jsonDecode(response.body);
          ///data {phone :09867,}
          // Map responseBodyMap=responseBody["data"]["0"][1];

          return Right(responseBody);
        } else {
          print("serverFailure");
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        print("No inter Net");

        return const Left(StatusRequest.offlineFailure);
      }
    } catch (e) {
      print("serverFailure");

      return const Left(StatusRequest.failureException);
    }
  }
}

class Crud {
  Future<Either<StatusRequest, dynamic>> postData(
      {required String url, required Map data}) async {
    try {
      print("postData");
      if (await checkInternet()) {
        print("checkInternet: yes");

        var response =await DioHelper.myPost(endPont: "", myData: {});
       

        if (response.statusCode! < 199 &&  response.statusCode! <  300 ) {
          return Right(response);
        } else {
          print("serverFailure");
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        print("No inter Net");

        return const Left(StatusRequest.offlineFailure);
      }
    } catch (e) {
      print("serverFailure");

      return const Left(StatusRequest.failureException);
    }
  }
}
