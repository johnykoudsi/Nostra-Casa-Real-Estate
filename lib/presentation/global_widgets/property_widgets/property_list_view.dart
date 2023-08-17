import 'package:flutter/material.dart';

import 'package:nostra_casa/presentation/global_widgets/property_widgets/property_card.dart';
import 'package:nostra_casa/presentation/global_widgets/property_widgets/property_shimmer.dart';
import '../../../data/models/properties_model.dart';
import '../../../utility/app_routes.dart';

class AllPropertyListView extends StatefulWidget {
  AllPropertyListView({required this.scrollController,required this.hasReachedMax,required this.properties, Key? key}) : super(key: key);
  List<Property> properties;
  bool hasReachedMax;
  ScrollController scrollController;

  @override
  State<AllPropertyListView> createState() => _AllPropertyListViewState();
}

class _AllPropertyListViewState extends State<AllPropertyListView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        controller: widget.scrollController,
          itemCount: widget.hasReachedMax
              ?widget.properties.length
              :widget.properties.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index >= widget.properties.length) {
              return PropertyShimmer();
            }
            return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.viewProperty,
                      arguments: widget.properties[index]);
                },
                child: Hero(
                  tag: widget.properties[index].id,
                  child: PropertyCard(
                    property: widget.properties[index],
                  ),
                ));
          }),
    );
  }
}
