import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nostra_casa/business_logic/get_nearby_properties/get_nearby_properties_bloc.dart';
import 'package:nostra_casa/business_logic/get_properties/get_all-properties_search_filter.dart';
import 'package:nostra_casa/business_logic/get_properties/get_all_properties_bloc.dart';
import 'package:nostra_casa/presentation/global_widgets/property_widgets/property_card.dart';
import 'package:nostra_casa/presentation/global_widgets/somthing_wrong.dart';
import 'package:nostra_casa/utility/app_assets.dart';

import '../../../utility/app_routes.dart';

class AllPropertyListView extends StatefulWidget {
  AllPropertyListView({this.propertiesSearchFilter, Key? key})
      : super(key: key);
  GetAllPropertiesSearchFilter? propertiesSearchFilter;

  @override
  State<AllPropertyListView> createState() => _AllPropertyListViewState();
}

class _AllPropertyListViewState extends State<AllPropertyListView> {
  late GetAllPropertiesSearchFilter propertiesSearchFilter;
  GetAllPropertiesBloc propertiesBloc = GetAllPropertiesBloc();

  @override
  void initState() {
    propertiesSearchFilter =
        widget.propertiesSearchFilter ?? GetAllPropertiesSearchFilter();

    propertiesBloc.add(GetAllPropertiesApiEvent(
        searchFilterProperties: propertiesSearchFilter));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: propertiesBloc,
      child: BlocBuilder<GetAllPropertiesBloc, GetAllPropertiesState>(
        builder: (context, state) {
          if (state is AllPropertiesInitial) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is AllPropertiesLoadedState) {
            return ListView.builder(
                itemCount: state.properties.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.viewProperty);
                      },
                      child: PropertyCard(
                        property: state.properties[index],
                      ));
                });
          }

          return SomethingWrongWidget();
        },
      ),
    );
  }
}
