
/*
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService{
  
  static const AndroidNotificationChannel _androidChannel = AndroidNotificationChannel(
      "smart_shoes", "smart_shoes_channel",
      description: "this is smart shoes android notification channel",
  importance: Importance.max,
  playSound: true);

  Future<void> _onBackgroundHandler(RemoteMessage message) async{
    print("this is message data: ${message.data}");
    print("this is message notification title ${message.notification!.title}");
  }
  // check above later.
  
  static final FlutterLocalNotificationsPlugin _notificationPlugin =
  FlutterLocalNotificationsPlugin();
  
  static void init(){
    var androidSettings = const AndroidInitializationSettings("@mipmap/ic_launcher");

    _notificationPlugin.initialize(InitializationSettings(android: androidSettings));
  }




  static void displayNotification(RemoteMessage message) async {
    try{
      var id = DateTime.now().microsecondsSinceEpoch ~/ 1000000;

      var androidNotificationDetails = const AndroidNotificationDetails(
          "smart_shoes","smart_shoes_channel",
          channelDescription: "this is smart shoes project channel",
          importance: Importance.max,
          priority: Priority.high
      );

      final NotificationDetails details = NotificationDetails(
          android: androidNotificationDetails);

      await _notificationPlugin.show(id, message.notification!.title,
          message.notification!.body, details);
    } on Exception catch (e){
      print(e);
    }
  }
  
}

*/