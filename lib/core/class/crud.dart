import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:ecommercephpsql/core/class/statusrequest.dart';
import 'package:http/http.dart' as http;

import '../functions/checkinternet.dart';

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    try {
      print(linkurl);

      if (await checkInternet()) {
        var response = await http.post(Uri.parse(linkurl), body: data);
        print(response.statusCode);
        print(response.reasonPhrase);

        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          print(responsebody);
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (e) {
      return const Left(StatusRequest.serverException);
    }
  }
}
