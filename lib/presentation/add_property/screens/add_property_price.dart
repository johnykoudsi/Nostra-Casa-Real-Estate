import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nostra_casa/presentation/add_property/widgets/rounded_elevated_button.dart';

import '../../../utility/app_style.dart';

class AddPropertyPrice extends StatefulWidget {
  const AddPropertyPrice({Key? key}) : super(key: key);

  @override
  State<AddPropertyPrice> createState() => _AddPropertyPriceState();
}

class _AddPropertyPriceState extends State<AddPropertyPrice> {
  TextEditingController priceController = TextEditingController();

  double price = 225;
  String timePeriod = "month".tr();
  double lowEstimation = 200;
  double highEstimation = 250;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    priceController.text = "${price}";
    void increasePrice() {
      setState(() {
        price = double.parse(priceController.text);
        price++;
      });
    }

    void decreasePrice() {
      setState(() {
        price = double.parse(priceController.text);
        price--;
      });
    }

    return Scaffold(
      backgroundColor: AppStyle.kBackGroundColor,
      body: Padding(
        padding: EdgeInsets.only(
            left: screenWidth * 0.038,
            right: screenWidth * 0.038,
            top: screenHeight * 0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Now set your price'.tr(),
              style: Theme.of(context).textTheme.headline2,
            ),
            Text(
              'you can change it any time'.tr(),
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: AppStyle.kGreyColor),
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            Container(
              height: screenHeight * 0.25,
              decoration: BoxDecoration(
                color: AppStyle.kLightGrey,
                borderRadius: AppStyle.k15BorderRadius,
                border: Border.all(
                  color: AppStyle.kGreyColor,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundedElevatedButton(
                        iconData: Icons.remove,
                        backgroundColor: AppStyle.kLightGrey,
                        onTap: () {
                          decreasePrice();
                        },
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: AppStyle.k15BorderRadius,
                            color: AppStyle.kBackGroundColor,
                            border: Border.all(
                              color: AppStyle.kGreyColor,
                            ),
                          ),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: priceController,
                            cursorColor: AppStyle.blackColor,
                            style: const TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                      RoundedElevatedButton(
                        iconData: Icons.add,
                        backgroundColor: AppStyle.kLightGrey,
                        onTap: () {
                          increasePrice();
                        },
                      ),
                    ],
                  ),
                  Text("sp per ".tr()+timePeriod),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Text(
                    "Places like yours in your area usually range from\n".tr() +lowEstimation.toString() +"to".tr()+ highEstimation.toString(),
                    style: Theme.of(context).textTheme.headline5,
                    textAlign: TextAlign.center,
                    maxLines: 3,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
