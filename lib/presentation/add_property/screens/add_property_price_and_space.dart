import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nostra_casa/presentation/add_property/widgets/custstom_insert_number_field.dart';
import 'package:nostra_casa/presentation/add_property/widgets/rounded_elevated_button.dart';

import '../../../business_logic/add_property_bloc/add_property_bloc.dart';
import '../../../utility/app_style.dart';

class AddPropertyPriceAndSpace extends StatefulWidget {
  const AddPropertyPriceAndSpace({Key? key}) : super(key: key);

  @override
  State<AddPropertyPriceAndSpace> createState() => _AddPropertyPriceAndSpaceState();
}

class _AddPropertyPriceAndSpaceState extends State<AddPropertyPriceAndSpace> {
  TextEditingController priceController = TextEditingController();
  TextEditingController spaceController = TextEditingController();

  double price = 225;
  double space = 100;
  String timePeriod = "sp per month".tr();
  double lowEstimation = 200;
  double highEstimation = 250;

  @override
  Widget build(BuildContext context) {
    final addPropertyBloc = context.watch<AddPropertyBloc>();
    if (addPropertyBloc.state.propertyService == PropertyService.rent) {
      timePeriod = "sp per month".tr();
    } else if (addPropertyBloc.state.propertyService == PropertyService.sale) {
      timePeriod = "";
    } else if (addPropertyBloc.state.propertyService ==
        PropertyService.holiday) {
      timePeriod = "sp per day".tr();
    }
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    priceController.text = price.toString();
    spaceController.text = space.toString();
    void increasePrice() {
      setState(() {
        if (priceController.text != "") {
          price = double.parse(priceController.text);
          price++;
        }
      });
    }

    void decreasePrice() {
      setState(() {
        if (priceController.text != "") {
          price = double.parse(priceController.text);
          price--;
        }
      });
    }

    void increaseSpace() {
      setState(() {
        if (spaceController.text != "") {
          space = double.parse(spaceController.text);
          space++;
        }
      });
    }

    void decreaseSpace() {
      setState(() {
        if (spaceController.text != "") {
          space = double.parse(spaceController.text);
          space--;
        }
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
              'Now set your property price and space'.tr(),
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
            Expanded(
              child: ListView(
                children: [

                  CustomInsertNumberField(
                    decrease: decreasePrice,
                    increase: increasePrice,
                    controller: priceController,
                    unit: timePeriod,
                    additionalText:
                        "Places like yours in your area usually range from\n"
                                .tr() +
                            lowEstimation.toString() +
                            " to ".tr() +
                            highEstimation.toString(),
                  ),
                  SizedBox(
                    height: screenHeight * 0.05,
                  ),
                  CustomInsertNumberField(
                    decrease: decreaseSpace,
                    increase: increaseSpace,
                    controller: spaceController,
                    unit: "square meters".tr(),
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
