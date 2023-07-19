import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nostra_casa/presentation/add_property/widgets/add_title_text_field.dart';
import 'package:pinput/pinput.dart';

import '../../../utility/app_style.dart';

class AddPropertyTitle extends StatefulWidget {
  const AddPropertyTitle({Key? key}) : super(key: key);

  @override
  State<AddPropertyTitle> createState() => _AddPropertyTitleState();
}

class _AddPropertyTitleState extends State<AddPropertyTitle> {
  late TextEditingController titleController;

  @override
  void initState() {
    titleController = TextEditingController()
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
              'Now let\'s give your house a title'.tr(),
              style: Theme.of(context).textTheme.headline2,
            ),
            Text(
              'short titles work best. Have fun with it you, can always change it later'
                  .tr(),
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: AppStyle.kGreyColor),
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            AddTitleTextField(titleController: titleController),
          ],
        ),
      ),
    );
  }
}
