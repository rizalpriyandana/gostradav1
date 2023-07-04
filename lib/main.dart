import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gostradav1/app/bindings/bindings.dart';

import 'package:gostradav1/app/routes/app_page.dart';
import 'package:gostradav1/app/routes/rout_name.dart';
import 'package:gostradav1/app/ui/pages/kategori/khs/khs.dart';
import 'package:gostradav1/app/ui/pages/kategori/krs/krs.dart';
import 'package:gostradav1/app/ui/pages/kategori/penawaran_krs/penawaran_krs.dart';
import 'package:gostradav1/app/ui/pages/kategori/riwayat_bayar/riwayat_bayar.dart';
import 'package:gostradav1/app/ui/pages/library/detailbookv2.dart';
import 'package:gostradav1/app/ui/pages/library/detailsearch.dart';
import 'package:gostradav1/app/ui/pages/library/libraryv2.dart';


import 'package:gostradav1/app/ui/pages/navigation/chat.dart';
import 'package:gostradav1/app/ui/pages/notifikasi/notifikasi.dart';
import 'package:gostradav1/app/ui/pages/splash/splash.dart';
import 'firebase_options.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

/// Define a top-level named handler which background/terminated messages will
/// call.
///
/// To verify things are working, check out the native platform logs.
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.

  // AwesomeNotifications().createNotification(
  //     content: NotificationContent(
  //         id: message.hashCode + 1,
  //         channelKey: 'basic_channel',
  //         title: 'aaaaa',
  //         body: 'bdy'));

  // print("ini Background Notif Jalan");
  // print(message.data);
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  } else {
    Firebase.app();
  }

  // // RemoteNotification? notification = message.notification;
  // // AndroidNotification? android = message.notification?.android;

  // // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  print("Handling a background message: ${message.messageId}");
  var payload = json.decode(message.data["data"]);
  print(payload);

  AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: message.hashCode,
          channelKey: 'basic_channel',
          title: payload["title"],
          body: payload["message"],
          payload: {"type": payload["type"]}));
}

/// Create a [AndroidNotificationChannel] for heads up notifications

/// Initialize the [FlutterLocalNotificationsPlugin] package.

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  AwesomeNotifications().initialize(
      // set the icon to null if you want to use the default app icon
      null,
      [
        NotificationChannel(
            channelGroupKey: 'basic_channel_group',
            channelKey: 'basic_channel',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            importance: NotificationImportance.Max)
      ],
      // Channel groups are only visual and are not required
      channelGroups: [
        NotificationChannelGroup(
            channelGroupkey: 'basic_channel_group',
            channelGroupName: 'Basic group')
      ],
      debug: true);

  // Set the background messaging handler early on, as a named top-level function
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  GlobalBinding().dependencies();

  // await initializeDateFormatting('id_ID', null);

  // Plugin must be initialized before using
  // await FlutterDownloader.initialize(
  //     debug:
  //         true, // optional: set to false to disable printing logs to console (default: true)
  //     ignoreSsl:
  //         true // option: set to false to disable working with http links (default: false)
  //     );
  AwesomeNotifications()
      .actionStream
      .listen((ReceivedNotification receivedNotification) {
    if (receivedNotification.payload != null) {
      var type = receivedNotification.payload!["type"];
      print(type.runtimeType);
      switch (type) {
        case "1":
          {
            Get.to(RoutName.root);
          }
          break;

        case "2":
          {
            Get.to((PenawaranKrsPage()));
          }
          break;

        case "3":
          {
            Get.to(KrsPage());
          }
          break;

        case "4":
          {
            Get.to(RoutName.root);
          }
          break;
        case "5":
          {
            Get.to(KhsPage());
          }
          break;
        case "6":
          {
            Get.to(ChatPage());
          }
          break;
        case "7":
          {
            Get.to(RiwayatBayarPage());
          }
          break;
        default:
          {
            Get.to(RoutName.root);
          }
          break;
      }
    }
  });
  AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
    if (!isAllowed) {
      // This is just a basic example. For real apps, you must show some
      // friendly dialog box before call the request method.
      // This is very important to not harm the user experience
      print("notallowed");
      AwesomeNotifications().requestPermissionToSendNotifications(
          channelKey: "basic_channel",
          permissions: [
            NotificationPermission.Alert,
            NotificationPermission.Sound,
            NotificationPermission.Vibration,
            NotificationPermission.Badge
          ]);
    } else {
      print("allowed");
    }
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: 'Poppins', scaffoldBackgroundColor: Colors.white),
        home: SplashPage(),
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: child!,
          );
        },
        getPages: AppPage.pages,
      );
    });
  }
}
