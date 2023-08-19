import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nostra_casa/business_logic/get_property_reviews/get_property_reviews_bloc.dart';
import 'package:nostra_casa/data/models/property_reviews_model.dart';
import 'package:nostra_casa/presentation/global_widgets/shimmer.dart';
import 'package:nostra_casa/presentation/view_property/widgets/reviews_list_shimmer.dart';

import '../../../utility/app_assets.dart';
import '../../../utility/app_style.dart';
import '../../global_widgets/elevated_button_widget.dart';
import '../../global_widgets/somthing_wrong.dart';

class ReviewsList extends StatefulWidget {
  ReviewsList({Key? key, required this.propertyId}) : super(key: key);
  int propertyId;

  @override
  State<ReviewsList> createState() => _ReviewsListState();
}

class _ReviewsListState extends State<ReviewsList> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    context.read<GetPropertyReviewsBloc>().add(
      GetPropertyReviewsApiEvent(
        reviewsSearchFilter: ReviewsSearchFilter(),
        propertyId: widget.propertyId,
      ),
    );
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        context.read<GetPropertyReviewsBloc>().add(
              GetPropertyReviewsApiEvent(
                reviewsSearchFilter: ReviewsSearchFilter(),
                propertyId: widget.propertyId,
              ),
            );
      }
    });
    super.initState();
  }

  void search() {
    context
        .read<GetPropertyReviewsBloc>()
        .add(ChangeToLoadingReviewsApiEvent(propertyId: widget.propertyId));
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      width: screenWidth,
      height: screenHeight * 0.3,
      child: BlocBuilder<GetPropertyReviewsBloc, GetPropertyReviewsState>(
        builder: (context, state) {
          if (state is GetPropertyReviewsLoadedState) {
            if (state.propertyReviews.isEmpty) {
              return SomethingWrongWidget(
                title: "No reviews found !".tr(),
                svgPath: AppAssets.search,
                elevatedButtonWidget: ElevatedButtonWidget(
                  title: "Refresh".tr(),
                  onPressed: () {
                    search();
                  },
                ),
              );
            }
            return ListView.builder(
              controller: scrollController,
              itemCount: state.hasReachedMax
                  ? state.propertyReviews.length
                  : state.propertyReviews.length + 1,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                if (index >= state.propertyReviews.length) {
                  return const ReviewsListShimmer();
                }
                return ReviewsItemwidget(
                  reviews: state.propertyReviews[index],
                  index: index,
                );
              },
            );
          }
          if (state is GetPropertyReviewsInitial) {
            return ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return const ReviewsListShimmer();
              },
            );
          }
          return SomethingWrongWidget(
            title: "No reviews found !".tr(),
            svgPath: AppAssets.search,
            elevatedButtonWidget: ElevatedButtonWidget(
              title: "Refresh".tr(),
              onPressed: () {
                search();
              },
            ),
          );
        },
      ),
    );
  }
}

class ReviewsItemwidget extends StatelessWidget {
  ReviewsItemwidget({Key? key, required this.reviews, required this.index})
      : super(key: key);
  PropertyReviewsModel reviews;
  int index;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding:
          EdgeInsets.only(left: screenWidth * 0.03, right: screenWidth * 0.03),
      child: Container(
        height: screenHeight * 0.2,
        width: screenWidth * 0.65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppStyle.kGreyColor),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView(
                  children: [
                    Text(
                      reviews.review,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ],
                ),
              ),
              RatingBar.builder(
                minRating: 0.5,
                allowHalfRating: true,
                itemSize: 25,
                updateOnDrag: false,
                initialRating: double.parse(reviews.rate),
                glow: true,
                ignoreGestures: true,
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rat) {},
              ),
              Column(
                children: [
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  Text(
                    reviews.user.name,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Text(
                    "${reviews.createdAt.day}/${reviews.createdAt.month}/${reviews.createdAt.year}",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
