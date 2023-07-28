import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/add_property_bloc/add_property_bloc.dart';
import '../../../utility/app_style.dart';
import '../widgets/add_title_text_field.dart';

class AddPropertyDescription extends StatefulWidget {
   AddPropertyDescription({Key? key, this.descriptionController}) : super(key: key);
final TextEditingController? descriptionController;
  @override
  State<AddPropertyDescription> createState() => _AddPropertyDescriptionState();
}

class _AddPropertyDescriptionState extends State<AddPropertyDescription> {
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
          children: [
            Text(
              'Describe your property with a few words'.tr(),
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            AddTitleTextField(controller: widget.descriptionController!),
          ],
        ),
      ),
    );
  }
}
