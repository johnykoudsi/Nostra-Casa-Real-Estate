import 'package:flutter/material.dart';

import '../../../utility/enums.dart';
import 'filter_spacer_widget.dart';
import 'handle_widget.dart';

class SortsFilterWidget extends StatelessWidget {
  SortsFilterWidget({required this.onChanged,required this.value,Key? key}) : super(key: key);

  PropertySorts value;
  Function(PropertySorts?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const HandleWidget(),
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 18),
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 22),
                  child: Text(
                    "Sorts",
                    style: Theme.of(context)
                        .textTheme
                        .headline4,
                  ),
                ),
                Column(
                  children: List.generate(
                    PropertySorts.values.length,
                        (index) => RadioListTile(
                      title: Text(
                        propertySortsUi.reverse[
                        PropertySorts.values[index]] ?? '',
                      ),
                      value:
                      PropertySorts.values[index],
                      groupValue: value,
                      onChanged: onChanged,
                    ),
                  ),
                ),
                const FilterSpacing(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
