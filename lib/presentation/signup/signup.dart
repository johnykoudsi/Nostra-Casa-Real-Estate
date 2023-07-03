
import 'package:flutter/material.dart';
import 'package:nostra_casa/utility/app_style.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  static final GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();
  String genderRadioValue = 'female';

  @override
  Widget build(BuildContext context) {
    double getWidth = MediaQuery.of(context).size.width;
    double getHeight = MediaQuery.of(context).size.height;
    final double heightBetweenHeaderAndTextField = getHeight * 0.002;
    final double heightBetweenFields = getHeight * 0.015;

    return Scaffold(
      backgroundColor: AppStyle.kBackGroundColor,
      body: SafeArea(
       child: Container(),
      ),
    );
  }
}


