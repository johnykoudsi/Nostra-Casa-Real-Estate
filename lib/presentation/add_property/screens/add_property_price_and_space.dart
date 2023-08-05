import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nostra_casa/presentation/add_property/widgets/custstom_insert_number_field.dart';
import '../../../business_logic/add_property_bloc/add_property_bloc.dart';
import '../../../utility/app_style.dart';
import '../../../utility/enums.dart';

class AddPropertyPriceAndSpace extends StatefulWidget {
  const AddPropertyPriceAndSpace({Key? key}) : super(key: key);

  @override
  State<AddPropertyPriceAndSpace> createState() =>
      _AddPropertyPriceAndSpaceState();
}

class _AddPropertyPriceAndSpaceState extends State<AddPropertyPriceAndSpace> {

  String priceTimePeriod = "";

  @override
  void initState() {
    final addPropertyBloc = context.read<AddPropertyBloc>();

    priceTimePeriod =
        propertyServicePriceUI.reverse[addPropertyBloc.state.propertyService] ??
            "";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

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
                  BlocBuilder<AddPropertyBloc, AddPropertyState>(
                    builder: (context, state) {
                      return CustomInsertNumberField(
                        value: state.price,
                        onChange: (value) {
                          num? input = num.tryParse(value);
                          if(input != null){
                            context.read<AddPropertyBloc>()
                                .add(PropertyPrice(price: input));
                          }else{
                            context.read<AddPropertyBloc>()
                                .add(PropertyPrice(price: 0));
                          }
                        },
                        unit: priceTimePeriod,
                        label: "Price",
                      );
                    },
                  ),
                  SizedBox(
                    height: screenHeight * 0.05,
                  ),

                  BlocBuilder<AddPropertyBloc, AddPropertyState>(
                    builder: (context, state) {
                      return CustomInsertNumberField(
                        value: state.area,
                        onChange: (value) {
                          num? input = num.tryParse(value);
                          if(input != null){
                            context.read<AddPropertyBloc>()
                                .add(PropertyArea(area: input));
                          }else{
                            context.read<AddPropertyBloc>()
                                .add(PropertyArea(area: 0));
                          }
                        },
                        unit: "square meters".tr(),
                        label: "Area",
                      );
                    },
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
