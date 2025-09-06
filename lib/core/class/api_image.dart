

import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dentist/core/class/status_request.dart';

import 'package:http/http.dart'as http;
import 'package:dentist/print.dart';
import 'package:path/path.dart';


class ApiImage{
  Future<Either<StatusRequest, Map>> addRequestWithImageOne({
    String? nameRequest,
    required Map data,
    required String url,
    required File? image,
  }) async {
    nameRequest ??= "photo";
    // nameRequest ??= "files";
    var uri = Uri.parse(url);
    var request = http.MultipartRequest("POST", uri);
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
      printme.yellow(response.body);
      Map responseBody = jsonDecode(response.body);
      return Right(responseBody);
    } else {
      return const Left(StatusRequest.serverFailure);
    }
  }}
