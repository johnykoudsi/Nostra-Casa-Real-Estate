import 'package:flutter/material.dart';

import '../../../../../utility/app_style.dart';
import '../../../widgets/rounded_elevated_button.dart';

class OneAttributeWidget extends StatelessWidget {
  OneAttributeWidget({
    required this.value,
    required this.name,
    required this.onTapMinus,
    required this.onTapPlus,
    Key? key})
      : super(key: key);

  String name;
  int value;
  Function()? onTapPlus;
  Function()? onTapMinus;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
        decoration: const BoxDecoration(
          color: AppStyle.kBackGroundColor,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    name,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RoundedElevatedButton(
                      iconData: Icons.remove,
                      onTap: onTapMinus,
                    ),
                    SizedBox(
                      width: screenWidth * 0.09,
                      child: Text(
                        value.toString(),
                        style: Theme.of(context).textTheme.headline5,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    RoundedElevatedButton(
                      iconData: Icons.add,
                      onTap: onTapPlus,
                    ),
                  ],
                ),
              ],
            ),
            const Divider(
              color: AppStyle.kGreyColor,
            ),
          ],
        ));
  }
}
