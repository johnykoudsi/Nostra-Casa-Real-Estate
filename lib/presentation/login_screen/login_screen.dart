import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:nostra_casa/presentation/global_widgets/dialogs_widgets/dialogs_snackBar.dart';
import 'package:nostra_casa/presentation/global_widgets/dialogs_widgets/dialogs_yes_no.dart';
import 'package:nostra_casa/utility/app_routes.dart';
import 'package:nostra_casa/utility/app_style.dart';
import '../global_widgets/custom_text_field.dart';
import '../global_widgets/elevated_button_widget.dart';
import '../global_widgets/phone_number_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static final GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  PhoneNumber phoneNumber = PhoneNumber(isoCode: "SY");

  @override
  Widget build(BuildContext context) {
    double getWidth = MediaQuery.of(context).size.width;
    double getHeight = MediaQuery.of(context).size.height;
    final double heightBetweenFields = getHeight * 0.015;

    return ColoredBox(
      color: AppStyle.kBackGroundColor,
      child: SafeArea(
          child: Scaffold(
        backgroundColor: AppStyle.kBackGroundColor,
        appBar: AppBar(),
        body: Form(
          key: _key,
          child: ListView(
            padding: EdgeInsets.fromLTRB(getWidth * 0.04, getWidth * 0.06,
                getWidth * 0.04, getWidth * 0.03),
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Welcome Back".tr(),
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Text(
                    "Login to Continue".tr(),
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  SizedBox(
                    height: getHeight * 0.05,
                  ),

                  // text fields
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // phone number text field
                      SizedBox(
                        height: getHeight * 0.15,
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
                        phoneNumber: phoneNumber,
                      ),

                      // password text field
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
                      GestureDetector(
                        onTap: () async {
                          if (phoneNumberController.text.isEmpty) {
                            DialogsWidgetsSnackBar.showScaffoldSnackBar(
                                title: "Please enter phone number first !".tr(),
                                context: context);
                          } else {
                            DialogsWidgetsYesNo.showYesNoDialog(
                                title:
                                    "${"Verification code will be send to this number :".tr()}"
                                    "\n ${phoneNumber.phoneNumber?.replaceAllMapped(RegExp(r'(\d{3})(\d{3})(\d+)'), (Match m) => "(${m[1]}) ${m[2]}-${m[3]}")}",
                                noTitle: "Cancel".tr(),
                                yesTitle: "Send".tr(),
                                onYesTap: () {},
                                context: context,
                                onNoTap: () {
                                  Navigator.of(context).pop();
                                });
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Forgot Password '.tr(),
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                              Text(
                                'Send a code'.tr(),
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

                  SizedBox(height: getHeight * 0.06),
                  ElevatedButtonWidget(
                    title: 'Login'.tr(),
                    //gradientColor: AppStyle.darkBlueColor,
                    onPressed: () {
                      if (_key.currentState!.validate()) {}
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushReplacementNamed(AppRoutes.signup);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account ? ".tr(),
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          Text(
                            'Signup'.tr(),
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
        ),
      )),
    );
  }
}

//
