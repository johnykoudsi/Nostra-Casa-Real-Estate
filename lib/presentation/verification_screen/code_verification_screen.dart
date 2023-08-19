import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nostra_casa/business_logic/user/user_bloc.dart';
import 'package:nostra_casa/presentation/global_widgets/dialogs_widgets/dialogs_snackBar.dart';
import 'package:nostra_casa/presentation/verification_screen/widgets/pinInutWidget.dart';
import 'package:nostra_casa/utility/app_style.dart';
import 'package:pinput/pinput.dart';
import '../../utility/app_routes.dart';
import '../global_widgets/elevated_button_widget.dart';

class CodeVerificationScreenPage extends StatefulWidget {
  CodeVerificationScreenPage({required this.signUpEvent, Key? key})
      : super(key: key);

  SignUpEvent signUpEvent;
  @override
  State<CodeVerificationScreenPage> createState() =>
      _CodeVerificationScreenPagePageState();
}

class _CodeVerificationScreenPagePageState
    extends State<CodeVerificationScreenPage> {
  static final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final controller = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();
  final focusNode = FocusNode();
  bool canTapResend = true;
  bool canTapResend2 = true;

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double getWidth = MediaQuery.of(context).size.width;
    double getHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(),
      body: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if(state is UserLoggedState){
            Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.bottomNavBar ,(Route<dynamic> route) => false);
          }
          if(state is UserErrorState){
            DialogsWidgetsSnackBar.showSnackBarFromStatus(
                context: context,
              helperResponse: state.helperResponse,
              showServerError: true
            );
          }
        },
        child: SafeArea(
          child: ListView(
            padding: EdgeInsets.fromLTRB(getWidth * 0.04, getWidth * 0.06,
                getWidth * 0.04, getWidth * 0.03),
            children: [
              SizedBox(height: getHeight * 0.1),
              Center(
                child: Text(
                  "Verification".tr(),
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              SizedBox(height: getHeight * 0.1),
              Column(
                children: [
                  Text(
                    "Verification code has been sent to your number".tr(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    widget.signUpEvent.phoneNumber.replaceAllMapped(
                        RegExp(r'(\d{3})(\d{3})(\d+)'),
                        (Match m) => "(${m[1]}) ${m[2]}-${m[3]}"),
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontWeight: AppFontWeight.bold),
                  ),
                  SizedBox(
                    height: getHeight * 0.1,
                  ),
                ],
              ),
              Pinput(
                length: 4,
                pinAnimationType: PinAnimationType.slide,
                controller: controller,
                focusNode: focusNode,
                androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
                defaultPinTheme: PinPutTheme.defaultPinTheme,
                showCursor: true,
                cursor: PinPutTheme.cursor,
                preFilledWidget: PinPutTheme.preFilledWidget,
              ),
              SizedBox(
                height: getHeight * 0.18,
              ),
              BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  return ElevatedButtonWidget(
                    title: 'Verify'.tr(),
                    isLoading: state is UserLoading,
                    onPressed: controller.text.isEmpty
                        ? null
                        : () {
                            widget.signUpEvent.verificationCode =
                                controller.text;

                            context.read<UserBloc>().add(widget.signUpEvent);
                          },
                  );
                },
              ),
              SizedBox(
                height: getHeight * 0.02,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    child: Text(
                      "Resend Code".tr(),
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    onPressed: () async {
                      if (canTapResend) {
                        canTapResend = false;
                        //todo: resend verification code

                        await Future.delayed(const Duration(seconds: 62), () {
                          canTapResend = true;
                        });
                      } else {
                        if (canTapResend2) {
                          canTapResend2 = false;
                          DialogsWidgetsSnackBar.showScaffoldSnackBar(
                            title: "Please try again shortly.".tr(),
                            context: context,
                          );
                          await Future.delayed(const Duration(seconds: 2), () {
                            canTapResend2 = true;
                          });
                        }
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
