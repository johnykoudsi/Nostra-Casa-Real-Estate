import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../utility/enums.dart';

class PropertyServiceFilterExploreWidget extends StatelessWidget {
  PropertyServiceFilterExploreWidget(
      {required this.onChanged, required this.value, Key? key})
      : super(key: key);
  PropertyService value;
  Function(PropertyService?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Text(
            "Property Service".tr(),
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        Column(
          children: List.generate(
            PropertyService.values.length,
                (index) => RadioListTile(
                title: Text(
                  propertyServiceUI.reverse[PropertyService.values[index]] ?? '',
                ),
                value: PropertyService.values[index],
                groupValue: value,
                onChanged: onChanged
            ),
          ),
        ),
      ],
    );
  }
}
