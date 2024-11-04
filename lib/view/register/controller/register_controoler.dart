import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api/core/class/crud.dart';
import 'package:flutter_api/core/class/status_request.dart';
import 'package:flutter_api/core/const_data/all_keys.dart';
import 'package:flutter_api/core/const_data/const_data.dart';
import 'package:flutter_api/core/service/app_link.dart';
import 'package:flutter_api/core/service/my_service.dart';
import 'package:flutter_api/view/home/screen/home_screen.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController{

  TextEditingController nameController =TextEditingController();
  TextEditingController emailController =TextEditingController();
  TextEditingController passwordController =TextEditingController();
  StatusRequest response = StatusRequest.isloading;
  String responseMessage = '';
  bool isLoading=false;
  Future signUp() async{
    isLoading = true;
    response = StatusRequest.isloading;
    update();
    Either<StatusRequest, String> result = await Crud().postData(
      AppLink.register,
        {'name' : nameController.text,
          'email' : emailController.text,
          'password' : passwordController.text,
          'fcm_token' : '${ConstData.fcmToken}',},
        {'Accept' : 'application/json',},
        true);
    result.fold((left) async {
      isLoading = false;
      response = left;
      Get.snackbar('message', response.toString());
      update();
      if(response == StatusRequest.success){

          await MyService().saveStringValue(AppKeys.storeNameKey, nameController.text);
          await MyService().saveStringValue(AppKeys.storeEmailKey, emailController.text);
          await MyService().saveStringValue(AppKeys.storePasswordKey, passwordController.text);
          await MyService().setConsData();

          Get.snackbar(" Success", "Data saved successfully!");


        Get.to(() => const HomeScreen());
      }
    }, (right){
      isLoading = false;
      responseMessage = right;
      Get.defaultDialog(title: responseMessage);
      update();
    });
  }

  bool isPassword = true;
  void togglePasswordVisibility(){
    isPassword = !isPassword;
    update();
  }
  }