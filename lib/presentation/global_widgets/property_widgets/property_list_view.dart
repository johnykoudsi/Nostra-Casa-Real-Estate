import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nostra_casa/business_logic/get_properties/get_all-properties_search_filter.dart';
import 'package:nostra_casa/business_logic/get_properties/get_all_properties_bloc.dart';
import 'package:nostra_casa/presentation/global_widgets/elevated_button_widget.dart';
import 'package:nostra_casa/presentation/global_widgets/property_widgets/property_card.dart';
import 'package:nostra_casa/presentation/global_widgets/property_widgets/property_shimmer.dart';
import 'package:nostra_casa/presentation/global_widgets/somthing_wrong.dart';
import 'package:nostra_casa/utility/app_assets.dart';
import 'package:nostra_casa/utility/app_style.dart';
import 'package:nostra_casa/utility/enums.dart';
import '../../../utility/app_routes.dart';
import '../../view_property/widgets/spacing.dart';

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
      searchFilterProperties: propertiesSearchFilter,
    ));
    super.initState();
  }

  void search() {
    propertiesSearchFilter = propertiesSearchFilter.copyWith(page: 1);
    propertiesBloc.add(ChangeToLoadingApiEvent(
        searchFilterProperties: propertiesSearchFilter));
  }

  @override
  void dispose() {
    propertiesBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: propertiesBloc,
      child: Scaffold(
        body: BlocBuilder<GetAllPropertiesBloc, GetAllPropertiesState>(
          builder: (context, state) {
            if (state is AllPropertiesInitial) {
              return ListView(
                children: [
                  PropertyShimmer(),
                  PropertyShimmer(),
                  PropertyShimmer(),
                ],
              );
            }
            if (state is AllPropertiesLoadedState) {
              return ListView.builder(
                  itemCount: state.properties.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.viewProperty,
                              arguments: state.properties[index]);
                        },
                        child: Hero(
                          tag: state.properties[index].id,
                          child: PropertyCard(
                            property: state.properties[index],
                          ),
                        ));
                  });
            }
            return SomethingWrongWidget(
              elevatedButtonWidget: ElevatedButtonWidget(
                title: "Refresh",
                onPressed: () {
                  context
                      .read<GetAllPropertiesBloc>()
                      .add(ChangeToLoadingApiEvent(
                        searchFilterProperties:
                            propertiesSearchFilter.copyWith(page: 1),
                      ));
                },
              ),
            );
          },
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // filter
            FloatingActionButton(
              onPressed: () {
                FocusManager.instance.primaryFocus?.unfocus();
                showModalBottomSheet(
                    context: context,
                    shape: AppStyle.k10TopBorderRectangle,
                    builder: (BuildContext context) {
                      return StatefulBuilder(
                        builder: (BuildContext context,
                            void Function(void Function()) setState) {
                          return SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const HandleWidget(),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 18),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 22),
                                        child: Text(
                                          "Property Type",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4,
                                        ),
                                      ),
                                      Column(
                                        children: List.generate(
                                          PropertyType.values.length,
                                          (index) => RadioListTile(
                                            title: Text(
                                              propertyTypeUi.reverse[
                                                      PropertyType
                                                          .values[index]] ??
                                                  '',
                                            ),
                                            value: PropertyType.values[index],
                                            groupValue: propertiesSearchFilter
                                                .propertyType,
                                            onChanged: (value) {
                                              Navigator.of(context).pop();
                                              setState(() {
                                                propertiesSearchFilter =
                                                    propertiesSearchFilter
                                                        .copyWith(
                                                            propertyType:
                                                                value);
                                              });
                                              search();
                                            },
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
                        },
                      );
                    });
              },
              backgroundColor: AppStyle.mainColor,
              child: SizedBox(
                child: SvgPicture.asset(
                  AppAssets.search,
                  color: AppStyle.kBackGroundColor,
                ),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            // sort
            FloatingActionButton(
              onPressed: () {
                // if (propertiesBloc.state is! AllPropertiesLoadedState) {
                //   return;
                // }
                FocusManager.instance.primaryFocus?.unfocus();
                showModalBottomSheet(
                    context: context,
                    shape: AppStyle.k10TopBorderRectangle,
                    builder: (BuildContext context) {
                      return StatefulBuilder(
                        builder: (BuildContext context,
                            void Function(void Function()) setState) {
                          return SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const HandleWidget(),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 18),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 22),
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
                                              propertySortsUi.reverse[PropertySorts
                                                      .values[index]] ??
                                                  '',
                                            ),
                                            value: PropertySorts.values[index],
                                            groupValue: propertiesSearchFilter
                                                .propertySorts,
                                            onChanged: (value) {
                                              Navigator.of(context).pop();
                                              setState(() {
                                                propertiesSearchFilter =
                                                    propertiesSearchFilter.copyWith(
                                                        propertySorts: value);
                                              });
                                              search();
                                            },
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
                        },
                      );
                    });
              },
              backgroundColor: AppStyle.mainColor,
              child: SizedBox(
                child: SvgPicture.asset(
                  AppAssets.filter,
                  color: AppStyle.kBackGroundColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FilterSpacing extends StatelessWidget {
  const FilterSpacing({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 18),
      child:  Divider(
        height: 0,
        color: AppStyle.kGreyColor,
        thickness: 0.8,
      ),
    );
  }
}

class HandleWidget extends StatelessWidget {
  const HandleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 8),
      child: Center(
        child: Container(
          width: 100,
          //margin: const EdgeInsets.all(8),
          height: 5,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: AppStyle.k4RadiusLowerPadding,
            color: Theme.of(context).primaryColor.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
