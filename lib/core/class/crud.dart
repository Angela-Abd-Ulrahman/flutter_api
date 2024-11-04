import 'dart:convert';
import 'package:flutter_api/core/const_data/all_keys.dart';
import 'package:flutter_api/core/service/my_service.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'package:flutter_api/core/class/status_request.dart';
import 'check_internet.dart';

class Crud {
  Future<Either<StatusRequest, String>> postData(
      String uri, Map body, Map<String,String> headers,bool tosaveToken) async{
    try{
      if (await checkInternet() == true){
        var Url = Uri.parse(uri);
        var response = await http.post(Url, body: body, headers: headers);
        print('=== status code');
        print(response.statusCode);
        var decodedResponse = json.decode(response.body);
        print('======1');
        print(response.statusCode);
        print('1');
        if (response.statusCode == 200 || response.statusCode == 201){
          if(tosaveToken == true){
            var token = decodedResponse['data']['access_token'];
            print('this is token from Api');
            print(token);
            await MyService().saveStringValue(AppKeys.storeTokenKey, token);
            await MyService().setConsDataToken();
          }print('======2');
          print('success');
          return const Left(StatusRequest.success);
        }else{print('=====3');
          var message = decodedResponse['message'];
          return Right(message);
        }
      }else{print('=====4');
        return  const Left(StatusRequest.offlineFailure);
      }
    } catch (_){
      print('===== ${_}');
      return const Left(StatusRequest.serverFailure);
    }
  }


  Future<Either<StatusRequest, String>> getData(
      String uri, Map <String, String>? headers) async{
    print('get data');
    try{
      if (await checkInternet() == true){
        print('===1');
        var response = await http.get(
          Uri.parse(uri),
          headers: headers,
        );
        print('====2');
        var responseBody = response.body;
        print(response.statusCode);
        print('====3');

        if (response.statusCode == 200 || response.statusCode == 201){
         print('====hear');
          return Right(responseBody);
        }else{
          print('=====4');
          return Left(StatusRequest.serverFailure);
        }
      }else{
        print('====5');
        return Left(StatusRequest.offlineFailure);
      }
    }catch(_){
      print('====6');
      return Left(StatusRequest.serverFailure);
    }
  }
}