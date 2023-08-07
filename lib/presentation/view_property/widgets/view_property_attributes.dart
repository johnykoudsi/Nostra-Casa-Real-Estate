import 'package:flutter/material.dart';

class ViewPropertyAttributes extends StatelessWidget {
   ViewPropertyAttributes({Key? key}) : super(key: key);
  List<String> propertyAttributesList = [
    "guests",
    "bedrooms",
    "beds",
    "bathrooms",
    "balconies",
    "beds"
  ];
  List<int> propertyAttributesListValue = [2, 5, 25, 5, 3, 7];
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(propertyAttributesList.length,
              (index) {
            return Wrap(
              children: [
                Text(
                  index > 0 ? ", " : "",
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  "${propertyAttributesListValue[index]} ",
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  propertyAttributesList[index],
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            );
          }),
    );
  }
}
