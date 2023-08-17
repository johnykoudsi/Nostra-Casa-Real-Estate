import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../utility/enums.dart';

class PropertyTypeFilterExploreWidget extends StatelessWidget {
  PropertyTypeFilterExploreWidget(
      {required this.onChanged, required this.value, Key? key})
      : super(key: key);
  PropertyType value;
  Function(PropertyType?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Text(
            "Property Type".tr(),
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
        Column(
          children: List.generate(
            PropertyType.values.length,
            (index) => RadioListTile(
              title: Text(
                propertyTypeUi.reverse[PropertyType.values[index]] ?? '',
              ),
              value: PropertyType.values[index],
              groupValue: value,
              onChanged: onChanged
            ),
          ),
        ),
      ],
    );
  }
}
