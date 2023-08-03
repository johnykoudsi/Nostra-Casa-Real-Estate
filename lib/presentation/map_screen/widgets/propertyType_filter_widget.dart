import 'package:flutter/material.dart';
import '../../../utility/app_style.dart';
import '../../../utility/enums.dart';

class PropertyTypeFilterWidget extends StatefulWidget {
  PropertyTypeFilterWidget({required this.selectedFilter, Key? key})
      : super(key: key);
  Set<PropertyType> selectedFilter;

  @override
  State<PropertyTypeFilterWidget> createState() =>
      _PropertyTypeFilterWidgetState();
}

class _PropertyTypeFilterWidgetState extends State<PropertyTypeFilterWidget> {
  @override
  Widget build(BuildContext context) {
    final selectedTextTheme = Theme.of(context)
        .textTheme
        .headline6!
        .copyWith(color: AppStyle.kBackGroundColor);
    final unSelectedTextTheme = Theme.of(context).textTheme.headline6;
    final selectedFilter = widget.selectedFilter;
    return SizedBox(
      height: 150,
      child: ListView.separated(
        padding: const EdgeInsets.all(18),
        //shrinkWrap: true,
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return FilterChip(
            label: Text(
              propertyType.reverse[PropertyType.values[index]] ?? '',
            ),
            labelStyle: selectedFilter.contains(PropertyType.values[index])
                ? selectedTextTheme
                : unSelectedTextTheme,
            selected: selectedFilter.contains(PropertyType.values[index]),
            onSelected: (bool value) {
              setState(() {
                if (value) {
                  selectedFilter.add(PropertyType.values[index]);
                } else {
                  selectedFilter.remove(PropertyType.values[index]);
                }
              });
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 18,
          );
        },
        // children: [
        //   FilterChip(
        //     label: const Text(
        //       "Residential",
        //     ),
        //     labelStyle:selectedFilter.contains(PropertyType.residential)
        //         ?selectedTextTheme
        //         :unSelectedTextTheme,
        //     selected: selectedFilter.contains(PropertyType.residential),
        //     onSelected: (bool value) {
        //       setState(() {
        //         if (value) {
        //           selectedFilter.add(PropertyType.residential);
        //         } else {
        //           selectedFilter.remove(PropertyType.residential);
        //         }
        //       });
        //     },
        //   ),
        //   FilterChip(
        //     label: const Text(
        //       "Agricultural",
        //     ),
        //     labelStyle:selectedFilter.contains(PropertyType.agricultural)
        //         ?selectedTextTheme
        //         :unSelectedTextTheme,
        //     selected: selectedFilter.contains(PropertyType.agricultural),
        //     onSelected: (bool value) {
        //       setState(() {
        //         if (value) {
        //           selectedFilter.add(PropertyType.agricultural);
        //         } else {
        //           selectedFilter.remove(PropertyType.agricultural);
        //         }
        //       });
        //     },
        //   ),
        //   FilterChip(
        //     label: const Text(
        //       "Commercial",
        //     ),
        //     labelStyle:selectedFilter.contains(PropertyType.commercial)
        //         ?selectedTextTheme
        //         :unSelectedTextTheme,
        //     selected: selectedFilter.contains(PropertyType.commercial),
        //     onSelected: (bool value) {
        //       setState(() {
        //         if (value) {
        //           selectedFilter.add(PropertyType.commercial);
        //         } else {
        //           selectedFilter.remove(PropertyType.commercial);
        //         }
        //       });
        //     },
        //   ),
        // ],
      ),
    );
  }
}
