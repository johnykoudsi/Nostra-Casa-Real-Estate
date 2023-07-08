import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nostra_casa/presentation/my_profile_screen/widgets/MyProfileItem.dart';
import 'package:nostra_casa/utility/app_style.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    bool isClicked = false;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    change() {
      setState(() {
        isClicked = true;
      });
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppStyle.blackColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: screenHeight * 0.1,
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.05,
                  right: screenWidth * 0.05,
                  bottom: screenHeight * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "user account",
                    style: Theme.of(context)
                        .textTheme
                        .headline3
                        ?.copyWith(color: AppStyle.kBackGroundColor),
                  ),
                  Text(
                    "+963 784487474",
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        ?.copyWith(color: AppStyle.kBackGroundColor),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: AppStyle.kBackGroundColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50.0),
                  ),
                ),
                child: ListView(
                  children: [
                    MyProfileItem(svgPath: 'assets/images/fav.svg', name: "My Favorites", onPressed: (){//todo navigate to my favorite
                       }, color: AppStyle.kBackGroundColor,borderRad: 40,),
                    MyProfileItem(svgPath: 'assets/images/bell.svg', name: "Notifications", onPressed: (){
                      //todo navigate to notifications
                    }, color: AppStyle.kGreyColor),
                    MyProfileItem(svgPath: 'assets/images/about.svg', name: "About Us", onPressed: (){
                      //todo navigate to about us
                    }, color: AppStyle.kBackGroundColor),
                    MyProfileItem(svgPath: 'assets/images/language.svg', name: "Language", onPressed: (){
                      //todo add language changer
                    }, color: AppStyle.kGreyColor),
                    MyProfileItem(svgPath: 'assets/images/edit.svg', name: "Edit Profile", onPressed: (){
                      //todo navigate to edit profile
                    }, color: AppStyle.kBackGroundColor),
                    MyProfileItem(svgPath: 'assets/images/share.svg', name: "Sign Out", onPressed: (){
                      //todo sign out
                    }, color: AppStyle.kGreyColor),
                    MyProfileItem(svgPath: 'assets/images/delete.svg', name: "Delete Account", onPressed: (){
                      //todo delete account
                    }, color: AppStyle.kBackGroundColor,isDelete: true,),



                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
