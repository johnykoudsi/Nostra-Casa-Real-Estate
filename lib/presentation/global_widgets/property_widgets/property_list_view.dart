import 'package:easy_localization/easy_localization.dart';
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
  void search(){
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // if (propertiesBloc.state is! AllPropertiesLoadedState) {
            //   return;
            // }
            FocusManager.instance.primaryFocus?.unfocus();
            showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                builder: (BuildContext context) {
                  return StatefulBuilder(
                    builder: (BuildContext context,
                        void Function(void Function()) setState) {
                      return SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 25, right: 25, top: 8),
                              child: Center(
                                child: Container(
                                  width: 100,
                                  //margin: const EdgeInsets.all(8),
                                  height: 5,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: AppStyle.k4RadiusLowerPadding,
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.5),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 18),
                              child: Column(
                                children: List.generate(
                                  PropertySorts.values.length,
                                  (index) => RadioListTile(
                                      title: Text(
                                        propertySortsUi.reverse[
                                                PropertySorts.values[index]] ??
                                            '',
                                      ),
                                      value: PropertySorts.values[index],
                                      groupValue: propertiesSearchFilter.propertySorts,
                                      onChanged: (value) {
                                        Navigator.of(context).pop();
                                        setState((){
                                          propertiesSearchFilter = propertiesSearchFilter.copyWith(propertySorts: value);
                                        });
                                        search();
                                      },),
                                ),
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
              color: AppStyle.kGreyColor,
            ),
          ),
        ),
      ),
    );
  }
}
