import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_api/core/class/localnotificationservice.dart';
import 'package:flutter_api/core/const_data/const_data.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;

class NotificationController extends GetxController{

  Future<void> getAccessToken() async {
    try {
      final serviceAccountJson = await rootBundle.loadString(
          'assets/focal-fire-firebase-adminsdk-l3nmr-debf7be8fb.json');
      final accountCredentials = ServiceAccountCredentials.fromJson(
        json.decode(serviceAccountJson),
      );
      const scopes = ['https://www.googleapis.com/auth/firebase.messaging'];
      final client = http.Client();
      try {
        final accessCredentials =
        await obtainAccessCredentialsViaServiceAccount(
          accountCredentials,
          scopes,
          client,
        );
        ConstData.accessToken = accessCredentials.accessToken.data;
        print('==========Access Token: ${ConstData.accessToken}');
      } catch (e) {
        print('===========Error obtaining access token: $e');
      } finally {
        client.close();
      }
    } catch (e) {
      print('=============Error loading service account JSON: $e');
    }
  }


  Future<void> sendMessage (String title, String bodymessage) async {

    try {
      var collection = await FirebaseFirestore.instance.collection('users').get();
      for (var doc in collection.docs) {
        String? token = doc['token'];
        var header = {
          "Content-Type" : "application/json",
          "Authorization": "Bearer ${ConstData.accessToken}"
        };
        var uri = "https://fcm.googleapis.com/v1/projects/focal-fire/messages:send";
        var body = {
          "message":{
            "token": token,
            "notification": {
              "title": title,
              "body": bodymessage,
            },
            "android": {
              "notification": {
                "sound" : "Tri-tone"
              }
            },
            "apns" : {
              "payload" : {
                "aps" :{
                  "sound" : "default"
                }
              }
            }
          }
        };

        var request = http.Request('Post', Uri.parse(uri));
        request.headers.addAll(header);
        request.body = json.encode(body);
        var response = await request.send();
        final  resBody = await response.stream.bytesToString();

        if (response.statusCode==200){
          print('============ hiiii $resBody');
        }else{
          print('============ faild to send  $resBody');
        }

      }
    }catch(e){
      print("===========$e");
    }

  }



  void showNotification(RemoteMessage message)async {
    RemoteNotification? notification = message.notification;
    AndroidNotification? androidNotification = message.notification?.android;
    if(notification != null && androidNotification != null){
      FlutterLocalNotificationsPlugin().show(notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            LocalNotificationService().channel.id,
            LocalNotificationService().channel.name,
            channelDescription: LocalNotificationService().channel.description,
            icon: androidNotification.smallIcon,
          ),
        ),
      );
    }
  }

  receiveMessage() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print(
            'Message also contained a notification: ${message.notification}');
        print('======= ${message.notification!.title}');
        print('======= ${message.notification!.body}');

        Get.snackbar("${message.notification!.title}",
            "${message.notification!.body}");
      }
    });
  }



  @override
  void onInit() {
    getAccessToken();
    receiveMessage();
    // TODO: implement onInit
    super.onInit();
  }

}