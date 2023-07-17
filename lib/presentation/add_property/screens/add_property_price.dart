import 'dart:ui';

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
  String timePeriod="month";
  double lowEstimation =200;
  double highEstimation =250;
  //priceController.text = "${price} M SP";
  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    priceController.text = "${price} M SP";
    void increasePrice(){
      setState(() {
        price++;
        priceController.text = "${price} M SP";
      });
    }
    void decreasePrice(){
      setState(() {
        price--;
        priceController.text = "${price} M SP";
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
              'Now set your price',
              style: Theme.of(context).textTheme.headline2,
            ),
            Text(
              'you can change it any time',
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
                        onTap: () {decreasePrice();},
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
                            onChanged: (text){
                              priceController.text = text;
                            },
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
                        onTap: () {increasePrice();},
                      ),
                    ],
                  ),
                  Text("per $timePeriod"),
                  SizedBox(height: screenHeight*0.02,),
                  Text("Places like yours in your area usually range from\n ${lowEstimation} to ${highEstimation} M SP",
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
