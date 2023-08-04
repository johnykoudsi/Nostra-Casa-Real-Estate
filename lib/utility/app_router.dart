import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nostra_casa/business_logic/add_property_bloc/add_property_bloc.dart';
import 'package:nostra_casa/business_logic/amenity_bloc/amenity_bloc.dart';
import 'package:nostra_casa/presentation/add_property/add_property_home.dart';
import 'package:nostra_casa/presentation/edit_profile/edit_profile.dart';
import 'package:nostra_casa/presentation/my_profile_screen/my_profile_screen.dart';
import 'package:nostra_casa/presentation/signup/signup.dart';
import 'package:nostra_casa/presentation/verification_screen/code_verification_screen.dart';
import 'package:nostra_casa/presentation/welcome/welcome.dart';
import '../business_logic/edit_user_bloc/edit_user_bloc.dart';
import '../business_logic/tag_bloc/tag_bloc.dart';
import '../business_logic/user/user_bloc.dart';
import '../presentation/about_us/about_us.dart';
import '../presentation/add_property/welcome_step.dart';
import '../presentation/bottom_nav_bar/bottom_nav_bar.dart';
import '../presentation/login_screen/login_screen.dart';
import '../presentation/notifications/notifications.dart';
import '../presentation/policy/policy.dart';
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
          return const WelcomeStep();

        case AppRoutes.notifications:
          return const Notifications();
        case AppRoutes.editProfile:
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => EditUserBloc(),
              ),
            ],
            child: const EditProfile(),
          );
        case AppRoutes.addProperty:
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => AddPropertyBloc(),
              ),
              BlocProvider(
                create: (context) =>
                    AmenityBloc()..add(ChangeToLoadingApiEvent()),
              ),
              BlocProvider(
                create: (context) =>
                    TagBloc()..add(ChangeToLoadingTagApiEvent()),
              ),
            ],
            child: const AddPropertyHome(),
          );
        case AppRoutes.aboutUs:
          return const AboutUs();

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
