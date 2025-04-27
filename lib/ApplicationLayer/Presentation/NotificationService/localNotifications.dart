/*
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:smart_shoes/Presentation/NotificationService/notificationService.dart';

class LocalNotifications{
  LocalNotifications();
  
  final _localNotificationService = FlutterLocalNotificationsPlugin();
  
  Future<void> init() async {
    const AndroidInitializationSettings androidInitSettings =
    AndroidInitializationSettings("@mipmap/ic_launcher");

    IOSInitializationSettings iosInitSettings = IOSInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: _onDidReceiveLocalNotification
    );

    final InitializationSettings settings = InitializationSettings(android: androidInitSettings,iOS: iosInitSettings);

    await _localNotificationService.initialize(settings,onSelectNotification: _onSelectNotification);
  }

  void _onDidReceiveLocalNotification(int id, String? title, String? body, String? payload){

  }

  void _onSelectNotification(String? payload) {
    print(payload);
  }

  Future<NotificationDetails> notificationDetails() async{
    var androidNotificationDetails = const AndroidNotificationDetails("channelId", "channelName",
        channelDescription: "this is local Channel",importance: Importance.max,priority: Priority.high,
        playSound: true);
    var iosNotificationDetails = const IOSNotificationDetails();

    return NotificationDetails(android: androidNotificationDetails,iOS: iosNotificationDetails);
  }

  Future<void> showNotification({required int id, required String title, required String body}) async {
    var details = await notificationDetails();
    await _localNotificationService.show(id, title, body, details);


  }


}


 */
