import 'package:flutter/material.dart';
import '../../../utility/app_style.dart';
import '../../../utility/enums.dart';

class PropertyTypeFilterWidget extends StatefulWidget {
  PropertyTypeFilterWidget(
      {required this.selectedFilter, required this.onChange, Key? key})
      : super(key: key);
  PropertyType? selectedFilter;
  Function(bool, PropertyType?) onChange;
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
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          const SizedBox(
            width: 18,
          ),
          ChoiceChip(
              label: const Text(
                "All",
              ),
              labelStyle: widget.selectedFilter == null
                  ? selectedTextTheme
                  : unSelectedTextTheme,
              selected: widget.selectedFilter == null,
              onSelected: (bool value) {
                widget.onChange(value, null);
              }),
          ListView.separated(
            padding: const EdgeInsets.all(18),
            shrinkWrap: true,
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return ChoiceChip(
                  label: Text(
                    propertyType.reverse[PropertyType.values[index]] ?? '',
                  ),
                  labelStyle:
                      widget.selectedFilter == PropertyType.values[index]
                          ? selectedTextTheme
                          : unSelectedTextTheme,
                  selected: widget.selectedFilter == PropertyType.values[index],
                  onSelected: (bool value) {
                    widget.onChange(value, PropertyType.values[index]);
                  });
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                width: 18,
              );
            },
          ),
        ],
      ),
    );
  }
}
