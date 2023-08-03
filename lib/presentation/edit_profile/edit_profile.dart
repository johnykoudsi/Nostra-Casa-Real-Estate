import 'package:flutter/material.dart';
import 'package:nostra_casa/presentation/edit_profile/widgets/custom_date_picker.dart';
import 'package:nostra_casa/presentation/global_widgets/custom_text_field.dart';
import 'package:nostra_casa/utility/app_style.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  DateTime _selectedDate = DateTime.now();

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
            CustomTextField(hintText: "johny@gmail", passwordBool: false,label: "Password",),
            SizedBox(height: screenHeight*0.01,),
            CustomTextField(hintText: "johny@gmail", passwordBool: false,label: "Mobile",),
            SizedBox(height: screenHeight*0.01,),
            CustomTextField(hintText: "johny@gmail", passwordBool: false,label: "Facebook",),
            SizedBox(height: screenHeight*0.01,),
            CustomDatePicker(onDateSelected: _handleDateSelected,label: "Date of birth",),

          ],
        ),
      ),
    );
  }
}
