import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api/them/custom_text_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_api/core/service/my_service.dart';
import 'package:flutter_api/routes.dart';
import 'binding/initial_bindings.dart';
import 'package:flutter_api/core/const_data/routes.dart';

import 'core/class/localnotificationservice.dart';
import 'firebase_options.dart';



Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message: ${message.messageId}');
}

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  final LocalNotificationService localNotificationService =
  LocalNotificationService();
  await localNotificationService.initialize();
  FirebaseMessaging.onMessage.listen(localNotificationService.showNotification);

  runApp(const MyApp());
  MyService();
  await initialServices();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

   @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_ , child){
        return GetMaterialApp(
     debugShowCheckedModeBanner: false,
     title: 'Flutter App',
     theme: ThemeData(textTheme: CustomTextTheme.textTheme),
     themeMode: ThemeMode.system,
     initialBinding: InitialBindings(),
     getPages: routes,
     initialRoute: Routes.signInScreen,
     );
   }
    );
  }
}