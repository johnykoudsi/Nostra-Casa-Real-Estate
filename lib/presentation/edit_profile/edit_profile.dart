import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nostra_casa/presentation/edit_profile/widgets/custom_date_picker.dart';
import 'package:nostra_casa/presentation/global_widgets/custom_text_field.dart';
import 'package:nostra_casa/utility/app_style.dart';

import '../../utility/enums.dart';
import '../global_widgets/elevated_button_widget.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  DateTime _selectedDate = DateTime.now();
  Gender genderRadioValue = Gender.female;

  void _handleDateSelected(DateTime date) {
    setState(() {
      _selectedDate = date;
    });
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppStyle.kBackGroundColor,
      appBar:  AppBar(
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
        padding: EdgeInsets.only(left: screenWidth*0.038,right: screenWidth*0.038,top: screenWidth*0.038,bottom: screenWidth*0.038),
        child: ListView(
          children: [
            CustomTextField(hintText: "johny", passwordBool: false,label: "Full Name",),
            SizedBox(height: screenHeight*0.01,),
            CustomTextField(hintText: "johny@gmail", passwordBool: false,label: "Email",),
            SizedBox(height: screenHeight*0.01,),
            CustomTextField(hintText: "12345678a", passwordBool: false,label: "Password",),
            SizedBox(height: screenHeight*0.01,),
            CustomTextField(hintText: "+963993625082", passwordBool: false,label: "Mobile",),
            SizedBox(height: screenHeight*0.01,),
            CustomTextField(hintText: "johny@gmail", passwordBool: false,label: "Facebook",),
            SizedBox(height: screenHeight*0.01,),
            CustomDatePicker(onDateSelected: _handleDateSelected,label: "Date of birth",selectedDate: DateTime.now(),onChange: (value){
              _selectedDate = value;
            },),
            SizedBox(height: screenHeight*0.03,),
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
                        activeColor: AppStyle.mainColor,
                        focusColor: AppStyle.mainColor,
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
            SizedBox(height: screenHeight*0.03,),
            ElevatedButtonWidget(
              title: "Edit",
              onPressed: (){
                print(_selectedDate);
              },
            ),
          ],
        ),
      ),
    );
  }
}
