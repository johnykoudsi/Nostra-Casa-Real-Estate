import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nostra_casa/presentation/add_property/widgets/custom_insert_text.dart';

import '../../../business_logic/add_property_bloc/add_property_bloc.dart';
import '../../../utility/app_style.dart';
import '../widgets/custstom_insert_number_field.dart';

class AddRegion extends StatefulWidget {
  const AddRegion({Key? key}) : super(key: key);

  @override
  State<AddRegion> createState() => _AddRegionState();
}

class _AddRegionState extends State<AddRegion> {
  @override
  Widget build(BuildContext context) {
    final addPropertyBloc = context.watch<AddPropertyBloc>();
    TextEditingController regionController = TextEditingController();
    if(addPropertyBloc.state.region != null){
      regionController.text=addPropertyBloc.state.region!;
    }
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
              'Please add your property region',
              style: Theme.of(context).textTheme.headline2,
            ),
            Text(
              'next you will set your property location on the map',
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
                 CustomInsertText(
                   controller: regionController,hintText: "Damascus",),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
