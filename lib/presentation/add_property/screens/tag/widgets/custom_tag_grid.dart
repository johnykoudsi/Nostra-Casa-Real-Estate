import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nostra_casa/business_logic/add_property_bloc/add_property_bloc.dart';
import '../../../../../business_logic/tag_bloc/tag_bloc.dart';
import '../../../../../data/models/tags_model.dart';
import '../../../../../utility/app_assets.dart';
import '../../../../../utility/app_style.dart';
import '../../../../../utility/constant_logic_validations.dart';
import '../../../../global_widgets/elevated_button_widget.dart';
import '../../../../global_widgets/shimmer.dart';
import '../../../../global_widgets/somthing_wrong.dart';

class CustomTagGrid extends StatefulWidget {
  const CustomTagGrid({Key? key}) : super(key: key);

  @override
  State<CustomTagGrid> createState() => _CustomTagGridState();
}

class _CustomTagGridState extends State<CustomTagGrid> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        context.read<TagBloc>().add(
              GetTagApiEvent(
                searchFilterProperties: TagsSearchFilter(),
              ),
            );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double getWidth = MediaQuery.of(context).size.width;
    double getHeight = MediaQuery.of(context).size.height;
    return BlocBuilder<TagBloc, TagState>(
      builder: (context, state) {
        if (state is TagLoadedState) {
          return GridView.builder(
              controller: scrollController,
              itemCount: state.hasReachedMax
                  ? state.tags.length
                  : state.tags.length + 2,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1.6,
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemBuilder: (BuildContext context, int index) {
                if (index >= state.tags.length) {
                  return ShimmerLoader();
                }
                return TagItemWidget(
                  tag: state.tags[index],
                );
              });
        }
        if (state is TagInitial) {
          return GridView.builder(
              itemCount: 8,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1.6,
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemBuilder: (BuildContext context, int index) {
                return ShimmerLoader();
              });
        }
        return SomethingWrongWidget(
          elevatedButtonWidget: ElevatedButtonWidget(
            title: "Refresh".tr(),
            onPressed: () {
              context.read<TagBloc>().add(ChangeToLoadingTagApiEvent());
              //search(userS);
            },
          ),
        );
      },
    );
  }
}

class TagItemWidget extends StatelessWidget {
  TagItemWidget({required this.tag, Key? key}) : super(key: key);
  Tag tag;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        context.read<AddPropertyBloc>().add(OnTagItemPressEvent(tag: tag));
      },
      child: BlocBuilder<AddPropertyBloc, AddPropertyState>(
        builder: (context, state) {
          return Container(
              decoration: BoxDecoration(
                color: state.selectedTag.contains(tag)
                    ? AppStyle.kGreyColor
                    : AppStyle.kBackGroundColor,
                border: Border.all(
                  color: state.selectedTag.contains(tag)
                      ? AppStyle.blackColor
                      : AppStyle.kGreyColor,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    left: screenWidth * 0.03,
                    right: screenWidth * 0.03,
                    top: screenWidth * 0.01),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SvgPicture.network(
                        tag.file,
                        width: screenWidth * 0.07,
                        height: screenHeight * 0.045,
                        placeholderBuilder: (context){
                          return ShimmerLoader(border: AppStyle.k4RadiusLowerPadding,);
                        },
                      ),
                    ),
                    Expanded(
                      child: Text(
                        isEnglish(context)?tag.name:tag.nameAr,
                        style: Theme.of(context).textTheme.headline5,
                        //textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ));
        },
      ),
    );
  }
}
