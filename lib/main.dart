import 'package:flutter/material.dart';
import 'package:nostra_casa/utility/app_router.dart';

void main() {
  runApp(
      MyApp(
          appRouter:  AppRouter()
      ));
}

class MyApp extends StatelessWidget {
  const MyApp({required this.appRouter,super.key});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: appRouter.onGenerateRoute,
    );
  }
}
