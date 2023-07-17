import 'package:flutter/material.dart';

import '../../../utility/app_style.dart';
import '../widgets/add_title_text_field.dart';

class AddPropertyDescription extends StatefulWidget {
  const AddPropertyDescription({Key? key}) : super(key: key);

  @override
  State<AddPropertyDescription> createState() => _AddPropertyDescriptionState();
}

class _AddPropertyDescriptionState extends State<AddPropertyDescription> {
  late TextEditingController descriptionController;

  @override
  void initState() {
    descriptionController = TextEditingController()
      ..addListener(() {
        setState(() {});
      });
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
          children: [
            Text(
              'Describe your property with a few words',
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            AddTitleTextField(titleController: descriptionController),
          ],
        ),
      ),
    );
  }
}
