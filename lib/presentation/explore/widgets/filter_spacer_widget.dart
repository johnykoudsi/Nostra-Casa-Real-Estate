import 'package:flutter/material.dart';

import '../../../utility/app_style.dart';

class FilterSpacing extends StatelessWidget {
  const FilterSpacing({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 18,vertical: 18),
      child: Divider(
        height: 0,
        color: AppStyle.kGreyColor,
        thickness: 0.8,
      ),
    );
  }
}
