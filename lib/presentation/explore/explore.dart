import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nostra_casa/business_logic/tag_bloc/tag_bloc.dart';
import 'package:nostra_casa/data/models/tags_model.dart';
import 'package:nostra_casa/presentation/explore/widgets/filter_spacer_widget.dart';
import 'package:nostra_casa/presentation/explore/widgets/handle_widget.dart';
import 'package:nostra_casa/presentation/explore/widgets/property_service_filter_widget.dart';
import 'package:nostra_casa/presentation/explore/widgets/property_type_filter_widget.dart';
import 'package:nostra_casa/presentation/explore/widgets/search_text_field.dart';
import 'package:nostra_casa/presentation/explore/widgets/sliverAppBarWidgetWithSearch.dart';
import 'package:nostra_casa/presentation/explore/widgets/sorts_filter_widget.dart';
import 'package:nostra_casa/utility/app_style.dart';
import '../../business_logic/get_properties/get_all-properties_search_filter.dart';
import '../../business_logic/get_properties/get_all_properties_bloc.dart';
import '../../utility/app_assets.dart';
import '../global_widgets/elevated_button_widget.dart';
import '../global_widgets/property_widgets/property_list_view.dart';
import '../global_widgets/property_widgets/property_shimmer.dart';
import '../global_widgets/shimmer.dart';
import '../global_widgets/somthing_wrong.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> with TickerProviderStateMixin {
  TabController? tabController;
  late TabController shimmerController;

  TextEditingController searchController = TextEditingController();

  bool showSearchDeleteIcon = false;

  ScrollController scrollController = ScrollController();

  GetAllPropertiesBloc propertiesBloc = GetAllPropertiesBloc();

  GetAllPropertiesSearchFilter propertiesSearchFilter = GetAllPropertiesSearchFilter();

  @override
  void initState() {
    shimmerController = TabController(length: 5, vsync: this);
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        propertiesBloc.add(
          GetAllPropertiesApiEvent(
            searchFilterProperties: propertiesSearchFilter,
          ),
        );
      }
    });
    super.initState();
  }

  void search() {
    propertiesBloc.add(ChangeToLoadingApiEvent(
      searchFilterProperties: propertiesSearchFilter,
    ));
  }

  @override
  Widget build(BuildContext context) {
    double getWidth = MediaQuery.of(context).size.width;
    double getHeight = MediaQuery.of(context).size.height;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TagBloc()
            ..add(ChangeToLoadingTagApiEvent(
              searchFilterProperties: TagsSearchFilter(),
            )),
        ),
        BlocProvider.value(
          value: propertiesBloc,
        ),
      ],
      child: BlocListener<TagBloc, TagState>(
        listener: (context, state) {
          if (state is TagLoadedState) {
            tabController = TabController(
              //initialIndex: widget.subCategoryArgument.initPage,
              length: state.tags.length,
              vsync: this,
            );
            search();
          }
        },
        child: Scaffold(
          backgroundColor: AppStyle.kBackGroundColor,
          body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBarWidgetWithSearch(
                  title: 'Explore',
                  bottom: AppBar(
                    toolbarHeight: getHeight * 0.08,
                    elevation: 0,
                    titleSpacing: 0,
                    backgroundColor: AppStyle.mainColor,
                    foregroundColor: AppStyle.kBackGroundColor,
                    title: Material(
                      color: const Color(0xfff0f0f0),
                      child: SizedBox(
                        width: double.infinity,
                        child: BlocBuilder<TagBloc, TagState>(
                          builder: (context, state) {
                            if (state is TagLoadedState) {
                              return TabBar(
                                onTap: (index) {
                                  //todo : change selected tag
                                },
                                isScrollable: true,
                                padding: const EdgeInsets.all(0),
                                // labelStyle: const TextStyle(fontFamily: kBoldFont),
                                // unselectedLabelStyle: const TextStyle(fontFamily: kNormalFont),
                                indicatorColor: AppStyle.mainColor,
                                labelColor: AppStyle.mainColor,
                                controller: tabController,
                                labelPadding:
                                    const EdgeInsets.symmetric(horizontal: 18),
                                indicator: const UnderlineTabIndicator(
                                    borderSide: BorderSide(width: 5.0),
                                    insets:
                                        EdgeInsets.symmetric(horizontal: 16.0)),
                                unselectedLabelColor: AppStyle.kGreyColor,
                                tabs: List.generate(
                                  state.tags.length,
                                  (index) => Tab(
                                    icon: SvgPicture.network(
                                      state.tags[index].file,
                                      height: 22,
                                    ),
                                    text: state.tags[index].name,
                                  ),
                                ),
                              );
                            }
                            return TabBar(
                              onTap: (index) {
                                setState(() {
                                  shimmerController.index = 0;
                                });
                              },
                              isScrollable: true,
                              padding: const EdgeInsets.all(0),
                              // labelStyle: const TextStyle(fontFamily: kBoldFont),
                              // unselectedLabelStyle: const TextStyle(fontFamily: kNormalFont),
                              indicatorColor: AppStyle.mainColor,
                              labelColor: AppStyle.mainColor,
                              controller: shimmerController,
                              labelPadding:
                                  const EdgeInsets.symmetric(horizontal: 18),
                              indicator: const UnderlineTabIndicator(
                                  borderSide: BorderSide(width: 5.0),
                                  insets:
                                      EdgeInsets.symmetric(horizontal: 16.0)),
                              unselectedLabelColor: AppStyle.kGreyColor,
                              tabs: List.generate(
                                5,
                                (index) => GestureDetector(
                                  child: Tab(
                                    icon: ShimmerLoader(
                                      height: 22,
                                      width: 22,
                                      border: const BorderRadius.all(
                                          Radius.circular(0)),
                                    ),
                                    text: "..............",
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: BlocBuilder<TagBloc, TagState>(
              builder: (context, state) {
                if (state is TagLoadedState) {
                  final getAllState =
                      context.watch<GetAllPropertiesBloc>().state;
                  return TabBarView(
                    controller: tabController,
                    children: List.generate(state.tags.length, (index) {
                      if (getAllState is AllPropertiesInitial) {
                        return ListView(
                          children: [
                            PropertyShimmer(),
                            PropertyShimmer(),
                          ],
                        );
                      }
                      if (getAllState is AllPropertiesLoadedState &&
                          getAllState.properties.isEmpty) {
                        return SomethingWrongWidget(
                          title: "No properties found !",
                          svgPath: AppAssets.search,
                          elevatedButtonWidget: ElevatedButtonWidget(
                            title: "Refresh",
                            onPressed: () {
                              search();
                            },
                          ),
                        );
                      }
                      if (getAllState is AllPropertiesLoadedState) {
                        print("maxxxxx"+getAllState.hasReachedMax.toString());
                        return RefreshIndicator(
                          onRefresh: () async {
                            search();
                          },
                          child: AllPropertyListView(
                            hasReachedMax: getAllState.hasReachedMax,
                            properties: getAllState.properties,
                            scrollController: scrollController,
                          ),
                        );
                      }
                      return SomethingWrongWidget(
                        elevatedButtonWidget: ElevatedButtonWidget(
                          title: "Refresh",
                          onPressed: () {
                            search();
                          },
                        ),
                      );
                    }),
                  );
                }
                if (state is TagInitial) {
                  return ListView(
                    children: [
                      PropertyShimmer(),
                      PropertyShimmer(),
                    ],
                  );
                }
                return SomethingWrongWidget(
                  elevatedButtonWidget: ElevatedButtonWidget(
                    title: "Refresh",
                    onPressed: () {
                      context.read<TagBloc>().add(ChangeToLoadingTagApiEvent());
                    },
                  ),
                );
              },
            ),
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Filter FAB
              FloatingActionButton(
                heroTag: "asdasdasd",
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      shape: AppStyle.k10TopBorderRectangle,
                      isScrollControlled: true,
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
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 18),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SearchTextField(
                                          onClear: () {
                                            searchController.clear();
                                            FocusManager.instance.primaryFocus
                                                ?.unfocus();
                                            Navigator.of(context).pop();

                                            setState(() {
                                              propertiesSearchFilter =
                                                  propertiesSearchFilter
                                                      .copyWith(term: "");
                                              showSearchDeleteIcon = false;
                                            });
                                            search();
                                          },
                                          onSend: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return;
                                            }
                                            Navigator.of(context).pop();

                                            setState(() {
                                              propertiesSearchFilter =
                                                  propertiesSearchFilter
                                                      .copyWith(term: value);
                                              showSearchDeleteIcon = true;
                                            });
                                            search();
                                          },
                                          searchController: searchController,
                                          showSearchDeleteIcon:
                                              showSearchDeleteIcon,
                                        ),
                                        const FilterSpacing(),
                                        PropertyTypeFilterExploreWidget(
                                          onChanged: (value) {
                                            Navigator.of(context).pop();
                                            setState(() {
                                              propertiesSearchFilter =
                                                  propertiesSearchFilter
                                                      .copyWith(
                                                          propertyType: value);
                                            });
                                            search();
                                          },
                                          value: propertiesSearchFilter
                                              .propertyType,
                                        ),
                                        const FilterSpacing(),
                                        PropertyServiceFilterExploreWidget(
                                          onChanged: (value) {
                                            Navigator.of(context).pop();
                                            setState(() {
                                              propertiesSearchFilter =
                                                  propertiesSearchFilter
                                                      .copyWith(
                                                          propertyService:
                                                              value);
                                            });
                                            search();
                                          },
                                          value: propertiesSearchFilter
                                              .propertyService,
                                        ),
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

              // Sort FAB
              FloatingActionButton(
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      shape: AppStyle.k10TopBorderRectangle,
                      builder: (BuildContext context) {
                        return StatefulBuilder(
                          builder: (BuildContext context,
                              void Function(void Function()) setState) {
                            return SortsFilterWidget(
                              value: propertiesSearchFilter.propertySorts,
                              onChanged: (value) {
                                Navigator.of(context).pop();
                                setState(() {
                                  propertiesSearchFilter =
                                      propertiesSearchFilter.copyWith(
                                          propertySorts: value);
                                });
                                search();
                              },
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
      ),
    );
  }
}
