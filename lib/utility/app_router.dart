import 'package:flutter/material.dart';
import '../presentation/home.dart';
import 'app_routes.dart';


class AppRouter {

  Route? onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) {

      switch (settings.name) {

        case AppRoutes.home:
          return const MyHomePage(title: 'hi');

        default:
          return const Scaffold(
            body: Center(
              child: Text(
                'Check Named Route',
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
            ),
          );
      }
    });
  }
}
