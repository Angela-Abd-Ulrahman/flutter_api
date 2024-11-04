

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_api/core/const_data/all_keys.dart';
import 'package:flutter_api/core/const_data/const_data.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MyService extends GetxService{

  late SharedPreferences sharedPreferences;

  Future <MyService> init() async{
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
Future<void>saveStringValue(String key, String value) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
}

Future<String?>getStringValue(String key) async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
}

  Future<void>setConsData() async{
    ConstData.name = (await getStringValue(AppKeys.storeNameKey)) ?? '';
    ConstData.email = (await getStringValue(AppKeys.storeEmailKey)) ?? '';
    ConstData.password = (await getStringValue(AppKeys.storePasswordKey)) ?? '';
    print('this is Information after storing');
    print(ConstData.name);
    print(ConstData.email);
    print(ConstData.password);
  }


  Future<void>setConsDataToken() async{
    ConstData.token = (await getStringValue(AppKeys.storeTokenKey))!;
    print('this is token after storing');
    print(ConstData.token);
}

  Future <void> getToken() async {
    try{
      ConstData.fcmToken = (await FirebaseMessaging.instance.getToken())!;
      print('My Token is    ${ConstData.fcmToken}');
    }catch(e){
      print('=============== The Token is faild $e');
    }
  }



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getToken();
  }
}

initialServices()async{
  await Get.putAsync(() => MyService().init());
}