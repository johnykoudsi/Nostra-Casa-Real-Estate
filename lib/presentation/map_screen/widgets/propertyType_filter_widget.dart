import 'package:flutter/material.dart';
import '../../../utility/app_style.dart';
import '../../../utility/enums.dart';

class PropertyTypeFilterWidget extends StatefulWidget {
  PropertyTypeFilterWidget(
      {required this.selectedFilter, required this.onChange, Key? key})
      : super(key: key);
  PropertyType? selectedFilter;
  Function(bool, int) onChange;
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
    return SizedBox(
      height: 150,
      child: ListView.separated(
        padding: const EdgeInsets.all(18),
        //shrinkWrap: true,
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return ChoiceChip(
              label: Text(
                propertyType.reverse[PropertyType.values[index]] ?? '',
              ),
              labelStyle: widget.selectedFilter == PropertyType.values[index]
                  ? selectedTextTheme
                  : unSelectedTextTheme,
              selected: widget.selectedFilter == PropertyType.values[index],
              onSelected: (bool value) {
                widget.onChange(value, index);
              });
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
