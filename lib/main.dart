import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nostra_casa/presentation/map_screen/widgets/markers.dart';
import 'package:nostra_casa/utility/app_router.dart';
import 'package:nostra_casa/utility/app_style.dart';

void main() {
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
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: AppStyle.theme,
      onGenerateRoute: widget.appRouter.onGenerateRoute,
    );
  }
}
