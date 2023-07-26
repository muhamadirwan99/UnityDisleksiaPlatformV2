import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:udp_v2/core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(debug: true, ignoreSsl: true);
  await Firebase.initializeApp();

  if (!kIsWeb) {
    var path = await getTemporaryDirectory();
    Hive.init(path.path);
  }

  mainStorage = await Hive.openBox('mainStorage');

  SplashDatabase.isSplash = mainStorage.get("isSplash") ?? "";

  await FirebaseMessaging.instance.setAutoInitEnabled(true);
  // var token = await FirebaseMessaging.instance.getToken();
  // print("token");
  // print(token);

  FlutterLocalNotificationsPlugin notifications =
      FlutterLocalNotificationsPlugin();

  final StreamController<String?> selectNotificationStream =
      StreamController<String?>.broadcast();

  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('app_icon');

  const initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );

  await notifications.initialize(initializationSettings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) {
    selectNotificationStream.add(notificationResponse.payload);
  });

  AndroidNotificationDetails androidNotificationDetails =
      const AndroidNotificationDetails('your channel id', 'your channel name',
          channelDescription: "Desc",
          importance: Importance.max,
          priority: Priority.high,
          ticker: 'ticker');

  NotificationDetails notificationDetails =
      NotificationDetails(android: androidNotificationDetails);

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    RemoteNotification? notification = message.notification;

    notifications.show(
        0, notification?.title, notification?.body, notificationDetails,
        payload: "notif");

    selectNotificationStream.stream.listen((String? payload) {
      if (payload == "notif") {
        Get.offAll(const MenuNavView());
      }
    });
  });

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(const MyApp()));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) =>
              VideoDatabaseProvider(databaseHelper: DatabaseVideoHelper()),
        ),
        ChangeNotifierProvider(
          create: (_) => InformasiDatabaseProvider(
              databaseHelper: DatabaseInformasiHelper()),
        ),
      ],
      child: MaterialApp(
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!,
          );
        },
        debugShowCheckedModeBanner: false,
        title: 'Unity Disleksia Platform',
        navigatorKey: Get.navigatorKey,
        theme: ThemeData(
          primaryColor: blue500,
          appBarTheme: AppBarTheme(
            backgroundColor: blue500,
            titleTextStyle: titleMedium,
            elevation: 0,
          ),
        ),
        home: const InitialPageView(),
      ),
    );
  }
}
