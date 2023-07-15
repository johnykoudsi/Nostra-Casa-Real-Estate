import 'package:flutter/material.dart';
import 'package:nostra_casa/presentation/add_property/add_property_home.dart';
import 'package:nostra_casa/presentation/my_profile_screen/my_profile_screen.dart';
import 'package:nostra_casa/presentation/signup/signup.dart';
import 'package:nostra_casa/presentation/verification_screen/code_verification_screen.dart';
import 'package:nostra_casa/presentation/welcome/welcome.dart';
import '../business_logic/user/user_bloc.dart';
import '../presentation/bottom_nav_bar/bottom_nav_bar.dart';
import '../presentation/login_screen/login_screen.dart';
import '../presentation/policy.dart';
import '../presentation/splash_screen/splash_screen.dart';
import 'app_routes.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) {
      switch (settings.name) {

        case AppRoutes.splashScreen:
          return const SplashScreen();

          case AppRoutes.welcome:
          return const WelcomeScreen();

        case AppRoutes.policy:
          return Policy(title: 'Usage and Privacy Policy');
        case AppRoutes.signup:
          return const SignUpScreen(title: 'Welcome');

        case AppRoutes.bottomNavBar:
          return const BottomNavBar();

        case AppRoutes.login:
          return const LoginScreen();

        case AppRoutes.verificationCode:
          SignUpEvent args = settings.arguments as SignUpEvent;
          return CodeVerificationScreenPage(signUpEvent: args);

        case AppRoutes.myProfile:
          return const MyProfileScreen();

        case AppRoutes.addPropertyWelcome:
          return  AddPropertyHome();

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
