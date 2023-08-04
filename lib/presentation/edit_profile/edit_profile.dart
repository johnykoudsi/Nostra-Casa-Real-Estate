import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nostra_casa/business_logic/edit_user_bloc/edit_user_bloc.dart';
import 'package:nostra_casa/presentation/global_widgets/custom_text_field.dart';
import 'package:nostra_casa/presentation/global_widgets/dialogs_widgets/dialogs_snackBar.dart';
import 'package:nostra_casa/utility/app_style.dart';
import '../../business_logic/user/user_bloc.dart';
import '../../utility/enums.dart';
import '../global_widgets/elevated_button_widget.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  static final GlobalKey<FormState> _key = GlobalKey<FormState>();

  DateTime? selectedDate;
  Gender genderRadioValue = Gender.female;
  TextEditingController dateTextController = TextEditingController();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController facebookController = TextEditingController();

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
              height: 216,
              padding: const EdgeInsets.only(top: 6.0),
              // The Bottom margin is provided to align the popup above the system navigation bar.
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              // Provide a background color for the popup.
              color: CupertinoColors.systemBackground.resolveFrom(context),
              // Use a SafeArea widget to avoid system overlaps.
              child: SafeArea(
                top: false,
                child: child,
              ),
            ));
  }

  @override
  void initState() {
    final userBloc = context.read<UserBloc>().state;
    if (userBloc is UserLoggedState) {
      nameController = TextEditingController(text: userBloc.user.user.name);
      emailController = TextEditingController(text: userBloc.user.user.email);
      mobileController = TextEditingController(text: userBloc.user.user.mobile);
      facebookController =
          TextEditingController(text: userBloc.user.user.facebook);

      DateTime? dateOfBirth = userBloc.user.user.dateOfBirth;

      if (dateOfBirth != null) {
        selectDate(dateOfBirth);
      }

      genderRadioValue = userBloc.user.user.gender;
    }
    super.initState();
  }

  void selectDate(DateTime value) {
    setState(() {
      selectedDate = value;
      dateTextController.text = DateFormat.yMEd().format(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return BlocListener<EditUserBloc, EditUserState>(
      listener: (context, state) {
        if(state is EditUserErrorState){
          DialogsWidgetsSnackBar.showSnackBarFromStatus(
              context: context,
              helperResponse: state.helperResponse,
            showServerError: true
          );
        }
        if(state is EditUserDoneState){
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        backgroundColor: AppStyle.kBackGroundColor,
        appBar: AppBar(
          backgroundColor: AppStyle.blackColor,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: AppStyle.kBackGroundColor,
            ),
          ),
          title: Text(
            "Edit Profile",
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: AppStyle.kBackGroundColor),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(
              left: screenWidth * 0.038,
              right: screenWidth * 0.038,
              top: screenWidth * 0.038,
              bottom: screenWidth * 0.038),
          child: Form(
            key: _key,
            child: ListView(
              children: [
                CustomTextField(
                  hintText: "johny",
                  passwordBool: false,
                  label: "Full Name".tr(),
                  controller: nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Name can not be empty".tr();
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                CustomTextField(
                  hintText: "johny@gmail",
                  passwordBool: false,
                  label: "Email".tr(),
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email can not be empty".tr();
                    }
                    return null;
                  },
                ),
                // SizedBox(height: screenHeight*0.01,),
                // CustomTextField(hintText: "12345678a", passwordBool: false,label: "Password",),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                CustomTextField(
                  hintText: "+963993625082",
                  passwordBool: false,
                  label: "Phone Number".tr(),
                  controller: mobileController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Number can not be empty".tr();
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                CustomTextField(
                  hintText: "johny@facebook",
                  passwordBool: false,
                  label: "Facebook".tr(),
                  controller: facebookController,
                ),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                GestureDetector(
                  onTap: () {
                    DateTime date = selectedDate ?? DateTime(2012, 1, 1);
                    DateTime difference = DateTime(8);
                    DateTime now = DateTime.now();

                    _showDialog(CupertinoDatePicker(
                      initialDateTime: date,
                      minimumYear: 1930,
                      maximumYear: now.year - difference.year,
                      mode: CupertinoDatePickerMode.date,
                      onDateTimeChanged: (DateTime value) {
                        selectDate(value);
                      },
                    ));
                  },
                  child: CustomTextField(
                    hintText: "Date of birth".tr(),
                    enabled: false,
                    controller: dateTextController,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Radio(
                            activeColor: AppStyle.mainColor,
                            focusColor: AppStyle.mainColor,
                            value: Gender.male,
                            groupValue: genderRadioValue,
                            onChanged: (value) {
                              setState(() {
                                genderRadioValue = value ?? Gender.male;
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
                            activeColor: AppStyle.mainColor,
                            focusColor: AppStyle.mainColor,
                            value: Gender.female,
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
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                BlocBuilder<EditUserBloc, EditUserState>(
                  builder: (context, state) {
                    return ElevatedButtonWidget(
                      title: "Edit".tr(),
                      isLoading: state is EditUserLoadingState,
                      onPressed: () {
                        if (_key.currentState!.validate()) {
                          context.read<EditUserBloc>().add(EditUserApiEvent(
                                phoneNumber: mobileController.text,
                                email: emailController.text,
                                fullName: nameController.text,
                                facebook: facebookController.text,
                                gender: genderRadioValue,
                              ));
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
