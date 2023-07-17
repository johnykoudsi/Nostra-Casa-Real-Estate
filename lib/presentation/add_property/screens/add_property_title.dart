import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../../utility/app_style.dart';

class AddPropertyTitle extends StatefulWidget {
  const AddPropertyTitle({Key? key}) : super(key: key);

  @override
  State<AddPropertyTitle> createState() => _AddPropertyTitleState();
}

class _AddPropertyTitleState extends State<AddPropertyTitle> {
   late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController()
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    TextEditingController titleController = TextEditingController();


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
              'Now let\'s give your house a title',
              style: Theme.of(context).textTheme.headline2,
            ),
            Text(
              'short titles work best. Have fun with it you, can always change it later',
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: AppStyle.kGreyColor),
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            Container(
              height: screenHeight * 0.2,
              decoration: BoxDecoration(
                borderRadius: AppStyle.k15BorderRadius,
                  border: Border.all(
                width: 3,
                color: AppStyle.blackColor,
              )),
              child: TextField(
                controller: controller,
                maxLines: null,),
            ),
            Text(controller.text.length.toString()+"/32"),
          ],
        ),
      ),
    );
  }
}
