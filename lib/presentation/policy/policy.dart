import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nostra_casa/utility/app_style.dart';

class Policy extends StatefulWidget {
  Policy({super.key, required this.title});

  final String title;

  @override
  State<Policy> createState() => _PolicyState();
}

class _PolicyState extends State<Policy> {
  bool? accept = false;

  void changeAcceptance() {
    setState(() {
      accept = !accept!;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
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
              "Usage and Privacy Policy".tr(),
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
                      "You should only post your own properties or other people properties with there known and acceptance.\nPosting others properties may lead to block you account.\nWhen promoting to agency make sure to add a clear legal files, you only gets to apply once.\nMake sure to describe your property with out exaggeration.".tr()                          .tr(),
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
