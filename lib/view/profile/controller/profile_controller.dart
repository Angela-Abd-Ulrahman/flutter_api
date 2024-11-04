import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_api/core/const_data/all_keys.dart';
import 'package:flutter_api/core/service/my_service.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController{
  TextEditingController nameController =TextEditingController();
  TextEditingController emailController =TextEditingController();
  TextEditingController passwordController =TextEditingController();
  File? _selectedImage;
  File? get selectedImage => _selectedImage;

  Future<void> pickImageFromGallery() async {
    try {
      final returnedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (returnedImage != null) {
        _selectedImage = File(returnedImage.path);
        update(); // Update the state after image selection
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick image: $e');
    }
  }



  Future<void> loadUserData()async{
   nameController.text = await MyService().getStringValue(AppKeys.storeNameKey) ?? '';
   emailController.text =  await MyService().getStringValue(AppKeys.storeEmailKey) ?? '';
   passwordController.text = await MyService().getStringValue(AppKeys.storePasswordKey) ?? '';


   update();
  }

  Future<void> saveEditedData() async{
    await MyService().saveStringValue(AppKeys.storeNameKey, nameController.text);
    await MyService().saveStringValue(AppKeys.storeEmailKey, emailController.text);
    await MyService().saveStringValue(AppKeys.storePasswordKey, passwordController.text);
    await MyService().setConsData();


    Get.snackbar(" Success", "Data saved successfully!");
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadUserData();
  }

  bool isPassword = true;
  void togglePasswordVisibility(){
    isPassword = !isPassword;
    update();
  }
}

