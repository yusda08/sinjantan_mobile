import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FCMHelper {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotif =
      FlutterLocalNotificationsPlugin();

  final allUserTopic = 'all-user';

  void initLocalNotif() {
    final androidInit = AndroidInitializationSettings('logo_tapin');
    final iosInit = IOSInitializationSettings();
    final initSettings =
        InitializationSettings(android: androidInit, iOS: iosInit);
    _flutterLocalNotif.initialize(initSettings);

    _flutterLocalNotif
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(
          AndroidNotificationChannel(
            'fcm_default_channel',
            'notif',
            'notification',
            importance: Importance.max,
          ),
        );

    _firebaseMessaging.getToken().then((value) => debugPrint('token $value'));
  }

  configureFcm() {
    initLocalNotif();
    if (Platform.isIOS) {
      _firebaseMessaging.requestPermission(
          sound: true, badge: true, alert: true, provisional: true);
    }

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null) {
        _flutterLocalNotif.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              'fcm_default_channel',
              'Notification Channel',
              'description',
              icon: 'logo_tapin',
              importance: Importance.max,
            ),
          ),
        );
      }
      debugPrint('onMessage');
      debugPrint('Message data: ${message.data}');
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint('onMessageOpenedApp');
      debugPrint('Message data: ${message.data}');
    });
  }

  void subscribeFCMUserTopic(String userId) {
    final topicToUser = 'user-$userId';
    _firebaseMessaging.subscribeToTopic(topicToUser);
    _firebaseMessaging.subscribeToTopic(allUserTopic);
  }

  void unSubscribeFCMAllTopic(String userId) {
    final topicToUser = 'user-$userId';

    _firebaseMessaging.unsubscribeFromTopic(topicToUser);
    _firebaseMessaging.unsubscribeFromTopic(allUserTopic);
  }
}
