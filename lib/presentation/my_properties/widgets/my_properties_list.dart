import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nostra_casa/business_logic/my_property_action/my_property_action_bloc.dart';
import '../../../data/models/properties_model.dart';
import 'my_properties_item.dart';
import 'my_properties_shimmer.dart';

class MyPropertiesList extends StatefulWidget {
  MyPropertiesList({required this.scrollController,
    required this.hasReachedMax,
    required this.properties,
    Key? key})
      : super(key: key);
  bool hasReachedMax;
  List<Property> properties;
  ScrollController scrollController;

  @override
  State<MyPropertiesList> createState() => _MyPropertiesListState();
}

class _MyPropertiesListState extends State<MyPropertiesList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.hasReachedMax
            ? widget.properties.length
            : widget.properties.length + 1,
        controller: widget.scrollController,
        itemBuilder: (BuildContext context, int index) {
          if (index >= widget.properties.length) {
            return MyPropertiesShimmer(index: index,);
          }
          return BlocProvider(
            create: (context) => MyPropertyActionBloc(),
            child: MyPropertyItemWidget(
              index: index,
              property: widget.properties[index],
            ),
          );
        });
  }
}

