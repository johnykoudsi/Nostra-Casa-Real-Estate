import 'package:flutter/material.dart';
import '../../../utility/app_style.dart';
import '../../../utility/enums.dart';

class PropertyTypeFilterWidget extends StatefulWidget {
  PropertyTypeFilterWidget(
      {required this.selectedFilter, required this.onChange, Key? key})
      : super(key: key);
  PropertyType selectedFilter;
  Function(PropertyType) onChange;

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
        .copyWith(color: AppStyle.kBackGroundColor, fontSize: 14);
    final unSelectedTextTheme =
        Theme.of(context).textTheme.headline6!.copyWith(fontSize: 14);
    return SizedBox(
      height: 35,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: [
            const SizedBox(
              width: 18,
            ),
            ChoiceChip(
              label: const Text(
                "All Property Types",
              ),
              labelStyle: widget.selectedFilter == PropertyType.all
                  ? selectedTextTheme
                  : unSelectedTextTheme,
              selected: widget.selectedFilter == PropertyType.all,
              onSelected: (bool value) {
                widget.onChange(PropertyType.all);
              },
            ),
            ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 18,),
              shrinkWrap: true,
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return ChoiceChip(
                    label: Text(
                      propertyTypeUi.reverse[PropertyType.values[index]] ?? '',
                    ),
                    labelStyle:
                        widget.selectedFilter == PropertyType.values[index]
                            ? selectedTextTheme
                            : unSelectedTextTheme,
                    selected: widget.selectedFilter == PropertyType.values[index],
                    onSelected: (bool value) {
                      widget.onChange(PropertyType.values[index]);
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
      ),
    );
  }
}
