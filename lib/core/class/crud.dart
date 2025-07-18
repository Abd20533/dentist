import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dentist/core/class/crud_with_dio.dart';
import 'package:dentist/core/class/status_request.dart';
import 'package:dentist/core/functions/check_internet.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';


import 'dart:io';

class Crud {
  Future<Either<StatusRequest, dynamic>> postData({
    required String linkUrl,
    required Map data,
  }) async {
    print("Crud0");

    if (await checkInternet()) {

      print("you have internetr");
      dynamic response=await DioHelper.register(endPont: linkUrl, myData: data);
      print("response is: ${response.toString()}");





      if (response.statusCode! > 199 &&  response.statusCode! <  300 ) {

        print(response.statusCode);
        print("Crud0");
        return Right(response);}

      else {
        return const Left(StatusRequest.serverException);
      }
    }
    return const Left(StatusRequest.serverFailure);


  }

    Future<Either<StatusRequest, Map>> addRequestWithImageOne({
      String? nameRequest,
      required Map data,
      required String url,
      required File? image,
    }) async {
      nameRequest ??= "files";
      var uri = Uri.parse(url);
      var request = http.MultipartRequest("POST", uri);
      // request.headers.addAll(_myheaders);
      if (image != null) {
        var length = await image.length();
        var stream = http.ByteStream(image.openRead());
        stream.cast();
        var multipartFile = http.MultipartFile(nameRequest, stream, length,
            filename: basename(image.path));
        request.files.add(multipartFile);
      }

      // add Data to request
      data.forEach((key, value) {
        request.fields[key] = value;
      });
      // add Data to request
      // Send Request
      var myRequest = await request.send();
      // For get Response Body
      var response = await http.Response.fromStream(myRequest);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responseBody = jsonDecode(response.body);
        return Right(responseBody);
      } else {
        return const Left(StatusRequest.serverFailure);
      }
    }}

