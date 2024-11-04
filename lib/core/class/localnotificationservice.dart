import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_api/core/const_data/app_colors.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';


class LocalNotificationService{
  AndroidNotificationChannel channel = const AndroidNotificationChannel(
    'id_channel',
    'testing_channel',
    description: 'descripe',
    importance: Importance.high,
  );

  Future<void> initialize() async{
    FlutterLocalNotificationsPlugin().initialize(
      const InitializationSettings(
        android:
        AndroidInitializationSettings('@mipmap/ic_launcher'),

      ),
    );
  }

  Future<void> showNotification(RemoteMessage message) async{
    RemoteNotification? notification = message.notification;
    AndroidNotification? androidNotification = message.notification?.android;
    if (notification != null && androidNotification != null){
      Get.defaultDialog(
          backgroundColor: AppColors.gryTextColor,
          titleStyle: const TextStyle(color: AppColors.blackColor),
          title: notification.title.toString(),
          middleText: notification.body.toString()
      );

      FlutterLocalNotificationsPlugin().show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              icon: '@mipmap/ic_launcher'
          ),
        ),
      );
    }
  }
}