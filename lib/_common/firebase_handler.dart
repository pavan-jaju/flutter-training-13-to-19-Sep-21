import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_taining_app_1/_state/app_state.dart';
import 'package:get/get.dart';

class FirebaseHandler {
  static init() async {
    await Firebase.initializeApp();

    String? token = await FirebaseMessaging.instance.getToken();

    debugPrint("==================== token $token");

    await FirebaseMessaging.instance.subscribeToTopic("flutter_training");

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {});

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("====================== Received the message ${message.data}");

      if (message.data["logout_user"] == "true") {
        Get.find<AppState>().signOut();
      }

      print(message.notification);
    });

    FirebaseMessaging.onBackgroundMessage(
        _firebaseMessagingBackgroundMessageHandler);
  }

  static Future<void> _firebaseMessagingBackgroundMessageHandler(
      RemoteMessage message) async {
    await Firebase.initializeApp();

    print(
        "=================== onBackgroundMessage => data => ${message.data} ");
    print(
        "=================== onBackgroundMessage => notification =>  ${message.notification?.title}");
  }
}
