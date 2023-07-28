import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utility/app_assets.dart';
import '../../utility/app_style.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    List<String>notifications=["The house you are interested in is sold","Your dream house is on fire","You can't afford your dream house","You pathetic"];
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
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
          "Notifications",
          style: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(color: AppStyle.kBackGroundColor),
        ),
      ),
      body: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onLongPress: () {
                // showEditPropertyTypeAttributeDialog(index);
              },
              child: Expanded(
                child: Container(

                  decoration:  BoxDecoration(
                    color: index.isEven ? AppStyle.kBackGroundColor:AppStyle.kLightGrey,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: screenWidth * 0.038, right: screenWidth * 0.038,top: screenHeight*0.02,bottom: screenHeight*0.02),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: AppStyle.blackColor),
                          ),
                          child: const CircleAvatar(
                            radius: 37,
                            backgroundColor: AppStyle.blackColor,
                            child: CircleAvatar(
                              radius: 35,
                              foregroundImage: AssetImage(AppAssets.logo),
                            ),
                          ),
                        ),
                        SizedBox(width: screenWidth*0.02,),
                        Expanded(
                          child: Text(
                            notifications[index],
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    ));
  }
}
