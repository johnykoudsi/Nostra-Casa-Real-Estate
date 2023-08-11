import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nostra_casa/business_logic/add_property_bloc/add_property_bloc.dart';
import 'package:nostra_casa/business_logic/amenity_bloc/amenity_bloc.dart';
import 'package:nostra_casa/business_logic/promote_to_agency/promote_to_agency_bloc.dart';
import 'package:nostra_casa/business_logic/send_property_bloc/send_property_bloc.dart';
import 'package:nostra_casa/presentation/add_property/add_property_home.dart';
import 'package:nostra_casa/presentation/edit_profile/edit_profile.dart';
import 'package:nostra_casa/presentation/more/more_screen.dart';
import 'package:nostra_casa/presentation/promote_to_agency/add_agency_location.dart';
import 'package:nostra_casa/presentation/promote_to_agency/promote_to_agency.dart';
import 'package:nostra_casa/presentation/promote_to_agency/welcome_to_promote.dart';
import 'package:nostra_casa/presentation/review_property/review_property_screen.dart';
import 'package:nostra_casa/presentation/signup/signup.dart';
import 'package:nostra_casa/presentation/verification_screen/code_verification_screen.dart';
import 'package:nostra_casa/presentation/view_property/view_property.dart';
import 'package:nostra_casa/presentation/welcome/welcome.dart';
import '../business_logic/country_bloc/country_bloc.dart';
import '../business_logic/edit_user_bloc/edit_user_bloc.dart';
import '../business_logic/tag_bloc/tag_bloc.dart';
import '../business_logic/user/user_bloc.dart';
import '../presentation/about_us/about_us.dart';
import '../presentation/add_property/welcome_step.dart';
import '../presentation/bottom_nav_bar/bottom_nav_bar.dart';

import '../presentation/explore/explore.dart';
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
          return const MoreScreen();

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
              BlocProvider(
                create: (context) => CountryBloc()..add(GetCountryCityEvent()),
              ),
            ],
            child: const AddPropertyHome(),
          );
        case AppRoutes.aboutUs:
          return const AboutUs();

        case AppRoutes.viewProperty:
          return const ViewProperty();

        case AppRoutes.reviewProperty:
          AddPropertyState args = settings.arguments as AddPropertyState;
          return BlocProvider(
            create: (context) => SendPropertyBloc(),
            child: ReviewProperty(addPropertyState: args),
          );

        case AppRoutes.homePage:
          return const Explore();
        case AppRoutes.welcomeToPromote:
          return const WelcomeToPromote();
        case AppRoutes.promoteToAgency:
          return const PromoteToAgency();
        case AppRoutes.addAgencyLocation:
          return    MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => PromoteToAgencyBloc(),
              ),
            ],
            child: const AddAgencyLocation(),
          );

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
