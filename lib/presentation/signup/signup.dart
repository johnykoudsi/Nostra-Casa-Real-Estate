import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:nostra_casa/business_logic/user/user_bloc.dart';
import 'package:nostra_casa/presentation/global_widgets/custom_text_field.dart';
import 'package:nostra_casa/presentation/global_widgets/phone_number_field.dart';
import 'package:nostra_casa/utility/app_router.dart';
import 'package:nostra_casa/utility/app_style.dart';

import '../../utility/app_routes.dart';
import '../../utility/enums.dart';
import '../global_widgets/elevated_button_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key, required this.title});

  final String title;

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  static final GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController phoneNumberController = TextEditingController();
  PhoneNumber phoneNumber = PhoneNumber(isoCode: "SY");
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();
  Gender genderRadioValue = Gender.female;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final double heightBetweenFields = screenHeight * 0.015;
    InternationalPhoneNumberInput? internationalPhoneNumberInput;

    return ColoredBox(
      color: AppStyle.kBackGroundColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppStyle.kBackGroundColor,
          appBar: AppBar(),
          body: Form(
            key: _key,
            child: ListView(
              padding: EdgeInsets.fromLTRB(screenWidth * 0.04,
                  screenWidth * 0.06, screenWidth * 0.04, screenWidth * 0.03),
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome".tr(),
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Text(
                      "Sign Up to Continue".tr(),
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    SizedBox(
                      height: screenHeight * 0.05,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextField(
                          hintText: 'Johny Koudsi',
                          passwordBool: false,
                          controller: fullNameController,
                          label: "Full Name".tr(),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Name is required".tr();
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: heightBetweenFields,
                        ),
                        Text(
                          "Phone Number".tr(),
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        PhoneNumberField(
                          phoneNumberController: phoneNumberController,
                          onChange: (PhoneNumber value) {
                            phoneNumber = value;
                          },
                        ),
                        SizedBox(
                          height: heightBetweenFields,
                        ),
                        CustomTextField(
                          hintText: "johnykoudsi@gmail.com",
                          passwordBool: false,
                          label: "Email".tr(),
                          controller: emailController,
                          textInputType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Email is required".tr();
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: heightBetweenFields,
                        ),
                        CustomTextField(
                          action: TextInputAction.done,
                          controller: passwordController,
                          label: "Password".tr(),
                          onlyNumber: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Password is required".tr();
                            }
                            RegExp regex = RegExp(r'^(?=.*?[a-z]).{8,}$');
                            if (!regex.hasMatch(value)) {
                              return 'Please Enter valid password'.tr();
                            }
                            return null;
                          },
                          hintText: '12345678a',
                          textInputType: TextInputType.visiblePassword,
                          passwordBool: true,
                        ),
                        SizedBox(
                          height: heightBetweenFields,
                        ),
                        CustomTextField(
                          action: TextInputAction.done,
                          controller: repeatPasswordController,
                          label: "Repeat Password".tr(),
                          onlyNumber: false,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Repeat Password is required".tr();
                            }
                            if (value != passwordController.text) {
                              return "Password are not match".tr();
                            }
                            return null;
                          },
                          hintText: '12345678a',
                          textInputType: TextInputType.visiblePassword,
                          passwordBool: true,
                        ),
                        SizedBox(
                          height: heightBetweenFields,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: [
                                Radio(
                                    activeColor: AppStyle.darkBlueColor,
                                    focusColor: AppStyle.darkBlueColor,
                                    value: Gender.male,
                                    groupValue: genderRadioValue,
                                    onChanged: (value) {
                                      setState(() {
                                        genderRadioValue = value ??  Gender.male;
                                      });
                                    }),
                                Text(
                                  "Male".tr(),
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Radio(
                                    activeColor: AppStyle.darkBlueColor,
                                    focusColor: AppStyle.darkBlueColor,
                                    value:  Gender.female,
                                    groupValue: genderRadioValue,
                                    onChanged: (value) {
                                      setState(() {
                                        genderRadioValue = value ?? Gender.female;
                                      });
                                    }),
                                Text(
                                  "Female".tr(),
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: heightBetweenFields),
                        ElevatedButtonWidget(
                          title: 'Continue'.tr(),
                          onPressed: () {
                            if (_key.currentState!.validate()) {
                              context.read<UserBloc>().add(SendSMSEvent(
                                  phoneNumber: phoneNumber.phoneNumber!));

                              Navigator.of(context).pushNamed(
                                  AppRoutes.verificationCode,
                                  arguments: SignUpEvent(
                                      password: passwordController.text,
                                      phoneNumber: phoneNumber.phoneNumber!,
                                      email: emailController.text,
                                      fullName: fullNameController.text,
                                      gender: genderRadioValue,
                                      verificationCode: "0000",
                                  ));
                            }
                          },
                        ),
                        SizedBox(height: screenHeight * 0.04),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed(AppRoutes.policy);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "By signing up,you agree to our ".tr(),
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                              Text(
                                'Terms & Privacy Policy.'.tr(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2!
                                    .copyWith(fontWeight: AppFontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacementNamed(AppRoutes.login);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Already have an account ? ".tr(),
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                Text(
                                  'Login'.tr(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(fontWeight: AppFontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
