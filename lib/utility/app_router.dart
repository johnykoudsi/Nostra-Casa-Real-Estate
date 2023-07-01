import 'package:flutter/material.dart';
import 'package:nostra_casa/presentation/welcome/welcome.dart';
import '../presentation/home.dart';
import '../presentation/policy.dart';
import 'app_routes.dart';


class AppRouter {

  Route? onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) {

      switch (settings.name) {
        case AppRoutes.welcome:
          return const Welcome(title: 'welcome');
        case AppRoutes.policy:
          return  Policy(title: 'Usage and Privacy Policy');

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
