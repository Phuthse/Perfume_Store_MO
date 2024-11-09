import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:perfume_store_mo/main.dart';
import 'package:perfume_store_mo/pages/notification.dart';

class Firebaseapi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async{
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print('Token: $fCMToken');
    initPushNotifications();
  }

  Future<void> handleBackgroundMessage(RemoteMessage message) async{
    print('Title: ${message.notification?.title}');
    print('Body: ${message.notification?.body}');
    print('Payload: $message.data');
  }

  void handleMessage(RemoteMessage? message){
    if(message == null) return;

    navigatorKey.currentState?.pushNamed(
      NotificationScreen.route,
      arguments: message
    );


  }

  Future initPushNotifications()async{
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true
    );
    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    //FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }
}