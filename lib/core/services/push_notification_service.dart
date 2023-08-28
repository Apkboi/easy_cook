import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushNotificationService {
  PushNotificationService._();


  /// Create a [AndroidNotificationChannel] for heads up notifications
  static AndroidNotificationChannel channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description:
      'This channel is used for important notifications.', // description
      importance: Importance.high,
      playSound: true);

  /// Initialize the [FlutterLocalNotificationsPlugin] package.
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  static final FirebaseMessaging _fcm = FirebaseMessaging.instance;

  static Future<void> initialize() async {
    _fcm.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true);

    if (!kIsWeb) {
      // channel = const AndroidNotificationChannel(
      //     'high_importance_channel', // id
      //     'High Importance Notifications', // title
      //     description:
      //         'This channel is used for important notifications.', // description
      //     importance: Importance.high,
      //     playSound: true);

      /// Create an Android Notification Channel.
      ///
      /// We use this channel in the `AndroidManifest.xml` file to override the
      /// default FCM channel to enable heads up notifications.
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);

      /// Update the iOS foreground notification presentation options to allow
      /// heads up notifications.
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    }

    log((await getDeviceToken()).toString());

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log('A new message received: ${message.data}');
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null && !kIsWeb) {
        log(' message received ${notification.toString()}');
        flutterLocalNotificationsPlugin.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              icon: 'launch_background',
            ),
          ),
        );
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log(' In app message received');
    });

    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        // log('A new getInitialMessage event was published!: ${message.data}');
        // DeepLinkData? payloadNotification = _decodeNotificationData(message);
        // // FlutterToast.showToast(msg: '$payloadNotification');
        // if (payloadNotification != null) {
        //   injector<DeepLinkCubit>().saveRecentNotification(payloadNotification);
        //   // DeeplinkAnalyticEvents()
        //     .appOpenedFromPushNotification(type: payloadNotification.type??'');
        // }
      }
    });
  }

  static Future<String?> getDeviceToken() async {
    return await _fcm.getToken();
  }
}
