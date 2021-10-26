import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:proyectoparqueovialidad/services/WidgetNotifcation.dart';

class PushNotificationService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;
  static StreamController<String> _messageStream =
      new StreamController.broadcast();
  static Stream<String> get messageString => _messageStream.stream;

  static Future _backgroundHandler(RemoteMessage message) async {
    print('background Handler ${message.notification!.body}');
  }

  static Future _onMessageHandler(RemoteMessage message) async {
    print('onMessageHandler Handler ${message.notification!.body}');
    _messageStream.add(message.notification?.title ?? 'No Title');
  }

  static Future _onMessageOpenApp(RemoteMessage message) async {
    print('onMessageOpenApp Handler ${message.messageId}');
    _messageStream.add(message.notification?.title ?? 'No Title');
  }

  static Future initializedApp() async {
    //Push Notifications
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    print(token);

    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);
    suscribeTopic();
    WidgetNotificationState  widgetNotificationState = new WidgetNotificationState();
    widgetNotificationState.cosntructNotification();
  }

  static suscribeTopic() {
    FirebaseMessaging.instance.subscribeToTopic("notificationData").then(
          (value) => print("Success"),
        );
  }

  static closeStreams() {
    _messageStream.close();
  }
}
