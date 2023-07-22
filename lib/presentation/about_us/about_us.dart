import 'package:flutter/material.dart';
import 'package:nostra_casa/utility/app_style.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppStyle.blackColor,
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
          "Nostra Casa",
          style: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(color: AppStyle.kBackGroundColor),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(screenWidth * 0.038, screenWidth * 0.1,
            screenWidth * 0.038, screenWidth * 0.038),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: screenHeight * 0.1,
              ),
              Text(
                "Nostra Casa",
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(color: AppStyle.kBackGroundColor),
              ),
              Padding(
                padding: EdgeInsets.only(top: screenHeight * 0.05),
                child: Text(
                  "Welcome to Nostra Casa platform.\nHere you can find different type of properties to buy, rent, or to have your holiday in!\nYou can even publish your own property or create agency to publish other properties people may be interest in.\nNostra Casa will help you to describe your place in the best way.",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: AppStyle.kBackGroundColor, height: 2),
                ),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(screenWidth * 0.2,
                      screenWidth * 0.2, screenWidth * 0.2, 0),
                  child: const Divider(
                    color: Colors.white,
                  )),
            ],
          ),
        ),
      ),
    ));
  }
}
