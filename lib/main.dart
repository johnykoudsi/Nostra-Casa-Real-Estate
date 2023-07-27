import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:google_maps_flutter_android/google_maps_flutter_android.dart';
import 'package:nostra_casa/business_logic/user/user_bloc.dart';
import 'package:nostra_casa/presentation/map_screen/widgets/markers.dart';
import 'package:google_maps_flutter_platform_interface/google_maps_flutter_platform_interface.dart';
import 'package:nostra_casa/utility/app_bloc_observer.dart';
import 'package:nostra_casa/utility/app_router.dart';
import 'package:nostra_casa/utility/app_style.dart';
import 'package:nostra_casa/utility/constant_logic_validations.dart';

import 'firebase/flutter_notifications.dart';

FlutterNotificationsClass flutterNotifications = FlutterNotificationsClass();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
  flutterNotifications.flutterLocalNotificationsPlugin.show(
      message.data.hashCode,
      message.data['title'],
      message.data['body'],
      NotificationDetails(
        android: AndroidNotificationDetails(
          FlutterNotificationsClass.channel.id,
          FlutterNotificationsClass.channel.name,
          enableVibration: true,
        ),
      ));
}

Future<void> main() async {
  final GoogleMapsFlutterPlatform mapsImplementation =
      GoogleMapsFlutterPlatform.instance;

  if (mapsImplementation is GoogleMapsFlutterAndroid) {
    mapsImplementation.useAndroidViewSurface = false;
  }
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  const AndroidInitializationSettings('@drawable/app_icon');
  FirebaseMessaging.instance.requestPermission();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  Bloc.observer = MyBlocObserver();

  runApp(EasyLocalization(
    supportedLocales: const [Locale('en'), Locale('ar')],
    path: 'assets/translation',
    startLocale: const Locale('en'),
    fallbackLocale: const Locale('en'),
    child: MyApp(appRouter: AppRouter()),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({required this.appRouter, super.key});

  final AppRouter appRouter;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    MapsMarkers.initMarkers();
    flutterNotifications = FlutterNotificationsClass();
    flutterNotifications.localNotificationsRequestPermission();
    flutterNotifications.handleForeGroundNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: globalUserBloc..add(CheckUserFromLocalStorage()),
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        locale: context.locale,
        navigatorKey: globalNavigatorKey,
        supportedLocales: context.supportedLocales,
        debugShowCheckedModeBanner: false,
        theme: AppStyle.theme,
        onGenerateRoute: widget.appRouter.onGenerateRoute,
      ),
    );
  }
}
