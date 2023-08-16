import 'package:flutter/material.dart';
import '../../../utility/app_style.dart';
import '../../../utility/enums.dart';

class PropertyServiceFilterWidget extends StatefulWidget {
  PropertyServiceFilterWidget(
      {required this.selectedFilter, required this.onChange, Key? key})
      : super(key: key);
  PropertyService selectedFilter;
  Function(PropertyService) onChange;

  @override
  State<PropertyServiceFilterWidget> createState() =>
      _PropertyServiceFilterWidgetState();
}

class _PropertyServiceFilterWidgetState extends State<PropertyServiceFilterWidget> {
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
              label: Text(
                propertyServiceUI.reverse[PropertyService.all] ?? "",
              ),
              labelStyle: widget.selectedFilter == PropertyService.all
                  ? selectedTextTheme
                  : unSelectedTextTheme,
              selected: widget.selectedFilter == PropertyService.all,
              onSelected: (bool value) {
                widget.onChange(PropertyService.all);
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
                      propertyServiceUI.reverse[PropertyService.values[index]] ?? '',
                    ),
                    labelStyle:
                    widget.selectedFilter == PropertyService.values[index]
                        ? selectedTextTheme
                        : unSelectedTextTheme,
                    selected: widget.selectedFilter == PropertyService.values[index],
                    onSelected: (bool value) {
                      widget.onChange(PropertyService.values[index]);
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
