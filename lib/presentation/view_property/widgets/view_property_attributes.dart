import 'package:flutter/material.dart';

import '../../../data/models/special_attributes.dart';

class ViewPropertyAttributes extends StatelessWidget {
  ViewPropertyAttributes({required this.abstractPropertyAttributes, Key? key})
      : super(key: key);
  AbstractPropertyAttributes abstractPropertyAttributes;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children:abstractPropertyAttributes.toScreen().entries.map((entry) {
       return Row(
          children: [
            Text(
              "${entry.value} ",
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              entry.key,
              style: Theme.of(context).textTheme.headline5,
            ),
          ],
        );
      }).toList()
    );
  }
}
