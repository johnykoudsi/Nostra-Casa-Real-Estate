import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nostra_casa/utility/app_assets.dart';
import 'package:nostra_casa/utility/app_style.dart';
import '../../business_logic/user/user_bloc.dart';
import '../../utility/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late bool isFirstTime;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserLoggedState) {
          Navigator.of(context).pushNamedAndRemoveUntil(
              AppRoutes.bottomNavBar, (Route<dynamic> route) => false);
        }
        if (state is UserNotLoggedState) {
          Navigator.of(context).pushReplacementNamed(AppRoutes.welcome);
        }
      },
      child: Scaffold(
        body: Center(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppAssets.appLogo), fit: BoxFit.fitWidth),
            ),
          ),
        ),
      ),
    );
  }
}
