import 'package:http/http.dart' as http;
 import 'dart:io';


checkInternet() async{
  try {
    final result = await InternetAddress.lookup('task.focal-x.com');
    if(result.isNotEmpty&&result[0].rawAddress.isNotEmpty){
      print('======host');
      return true;
    }print('=========true');
  }on SocketException catch(_){
    print('======false$_');
    return false;
  }
  return false;
  //   final response = await http.get(Uri.parse('https://task.focal-x.com'));
  //   if (response.statusCode == 200) {
  //     print('=========true');
  //     return true;
  //   } else {
  //     print('Server responded with status: ${response.statusCode}');
  //     return false;
  //   }
  // } catch (e) {
  //   print('======false $e');
  //   return false;
  // }
  //
 }