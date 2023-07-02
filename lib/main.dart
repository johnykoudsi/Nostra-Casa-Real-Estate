import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nostra_casa/utility/app_router.dart';
import 'package:nostra_casa/utility/app_style.dart';

void main() {
  runApp(
      EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translation',
      startLocale: const Locale('en'),
      // <-- change the path of the translation files
      fallbackLocale: const Locale('en'),
      child: MyApp(appRouter: AppRouter()),
      ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({required this.appRouter, super.key});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: AppStyle.theme,
      onGenerateRoute: appRouter.onGenerateRoute,
    );
  }
}
