import 'package:flutter_api/core/const_data/const_data.dart';

class AppLink{


  //remote address

  static String appRoot = 'https://task.focal-x.com';
  static String appApi = '$appRoot/api';
  static String register = '$appApi/register';
  static String logIn = '$appApi/login';
  static String logOut = '$appApi/logout';
  static String categories = '$appApi/categories';
  static String sub = '$appApi/sub';
  static String subCategories = '$sub/categories';
  static String product = '$appApi/product';
  static String order = '$appApi/order';
  static String getOrder = '$order/getOrder';
  static String createOrder = '$order/createOrder';
  static String updateOrder = '$order/updateOrder';
  static String deleteOrder = '$order/deleteOrder';



  Map<String, String> getHeader(){
    Map<String, String> mainHeader={
      'Content-Type' : 'application/json',
      'Accept' : 'application/json',
      'X-Requested-With' : 'XMLHttpRequest'
    };
    return mainHeader;
  }
  Map<String,String> getHeaderToken(){
    Map<String, String> mainHeader={
      'Content-Type' : 'application/json',
      'Accept' : 'application/json',
      'X-Requested-With' : 'XMLHttpRequest',
      'Authorization' : 'Bearer ${ConstData.token}'
    };
    return mainHeader;
  }
}