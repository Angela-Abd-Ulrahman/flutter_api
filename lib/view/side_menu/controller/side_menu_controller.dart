import 'package:dartz/dartz.dart';
import 'package:flutter_api/core/class/crud.dart';
import 'package:flutter_api/core/class/status_request.dart';
import 'package:flutter_api/core/const_data/all_keys.dart';
import 'package:flutter_api/core/const_data/const_data.dart';
import 'package:flutter_api/core/service/app_link.dart';
import 'package:flutter_api/core/service/my_service.dart';
import 'package:flutter_api/view/sign_in/screen/sign_in_screen.dart';
import 'package:get/get.dart';

class SideMenuController extends GetxController {
  StatusRequest response = StatusRequest.isloading;
  String responseMessage = '';
  bool isLoading = false;
  Future<void> signOut() async {
    isLoading = true;
    response = StatusRequest.isloading;
    update();
    Either<StatusRequest, String> result = await Crud().postData(
      AppLink.logOut,
      {}, // You may pass additional body data if needed
      {'Authorization': 'Bearer ${ConstData.token}',
        'Accept': 'application/json',},
      false,);
    result.fold((left) async {
      isLoading = false;
      response = left;
      update();
      if (response == StatusRequest.success) {
        // Clear the saved token on successful logout
        await MyService().saveStringValue(AppKeys.storeTokenKey, '');
        ConstData.token = '';
        // Navigate to Sign In screen
        Get.offAll(() => const SignInScreen());
      } else {
        Get.snackbar('Error', 'Failed to sign out');
      }
    }, (right) {
      isLoading = false;
      responseMessage = right;
      Get.defaultDialog(title: 'Sign Out Failed', middleText: responseMessage);
      update();
    });
  }
}
