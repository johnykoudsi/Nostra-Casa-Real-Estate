import 'dart:io';
import 'dart:math';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nostra_casa/business_logic/add_to_favorite/add_favorite_bloc.dart';
import 'package:nostra_casa/business_logic/my_rating/my_rating_bloc.dart';
import 'package:nostra_casa/business_logic/rate_property/rate_property_bloc.dart';
import 'package:nostra_casa/business_logic/user/user_bloc.dart';
import 'package:nostra_casa/data/models/special_attributes.dart';
import 'package:nostra_casa/presentation/global_widgets/dialogs_widgets/dialogs_snackBar.dart';
import 'package:nostra_casa/presentation/view_property/widgets/property_rating.dart';
import 'package:nostra_casa/presentation/view_property/widgets/reviews_list.dart';
import 'package:nostra_casa/presentation/view_property/widgets/spacing.dart';
import 'package:nostra_casa/presentation/view_property/widgets/user_info_part.dart';
import 'package:nostra_casa/presentation/view_property/widgets/view_property_amenities.dart';
import 'package:nostra_casa/presentation/view_property/widgets/view_property_attributes.dart';
import 'package:nostra_casa/presentation/view_property/widgets/view_property_images.dart';
import 'package:nostra_casa/utility/app_routes.dart';
import 'package:nostra_casa/utility/app_style.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';
import '../../business_logic/get_property_reviews/get_property_reviews_bloc.dart';
import '../../data/models/properties_model.dart';
import '../../data/models/property_reviews_model.dart';
import '../../utility/app_assets.dart';
import '../../utility/constant_logic_validations.dart';
import '../../utility/enums.dart';
import '../map_location_square_widget/map_location_widget.dart';

class ViewProperty extends StatefulWidget {
  ViewProperty({required this.property, Key? key}) : super(key: key);

  Property property;

  @override
  State<ViewProperty> createState() => _ViewPropertyState();
}

class _ViewPropertyState extends State<ViewProperty> {
  Future<File> urlToFile(String imageUrl) async {
    var rng = Random();
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    File file = File('$tempPath${rng.nextInt(100)}.png');
    http.Response response = await http.get(Uri.parse(imageUrl));
    await file.writeAsBytes(response.bodyBytes);
    return file;
  }

  @override
  void initState() {
    if (userIsLoggedIn(context) &&
        widget.property.userInfo?.id !=
            (context.read<UserBloc>().state as UserLoggedState).user.user.id) {
      context
          .read<MyRatingBloc>()
          .add(GetMyRatingApiEvent(propertyId: widget.property.id));
    }
    if (userIsLoggedIn(context)) {
      context
          .read<OnePropertyBloc>()
          .add(GetPropertyFavouriteEvent(productObjectId: widget.property.id));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool loadingShare = false;

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return MultiBlocListener(
      listeners: [
        BlocListener<MyRatingBloc, MyRatingState>(
          listener: (context, state) {
            if (state is MyRatingErrorStatus) {
              DialogsWidgetsSnackBar.showSnackBarFromStatus(
                context: context,
                helperResponse: state.helperResponse,
                showServerError: true,
              );
            }
          },
        ),
        BlocListener<OnePropertyBloc, OnePropertyState>(
          listener: (context, state) {
            if(state is OnePropertyErrorState){
              DialogsWidgetsSnackBar.showSnackBarFromStatus(
                context: context,
                helperResponse: state.helperResponse,
                showServerError: true,
              );
            }
          },
        ),
        BlocListener<RatePropertyBloc, RatePropertyState>(
          listener: (context, state) {
            if(state is RatePropertyStatus){
              DialogsWidgetsSnackBar.showSnackBarFromStatus(
                context: context,
                helperResponse: state.helperResponse,
                showServerError: true,
                popOnSuccess: false
              );
              context
                  .read<MyRatingBloc>()
                  .add(GetMyRatingApiEvent(propertyId: widget.property.id));
              context.read<GetPropertyReviewsBloc>().add(
                GetPropertyReviewsApiEvent(
                  reviewsSearchFilter: ReviewsSearchFilter(),
                  propertyId: widget.property.id,
                ),
              );
            }
          },
        ),
      ],
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              ListView(
                children: [
                  GestureDetector(
                      onTap: () {
                        if (widget.property.media.isEmpty) {
                          return;
                        }
                        Navigator.of(context).pushNamed(
                            AppRoutes.staggeredImagesView,
                            arguments: widget.property.media);
                      },
                      child: Hero(
                        tag: widget.property.id,
                        child: ViewPropertyImages(
                          imagesUrl: widget.property.media,
                          propertyService: widget.property.propertyService,
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.only(
                        left: screenWidth * 0.038,
                        right: screenWidth * 0.038,
                        top: screenWidth * 0.038,
                        bottom: screenWidth * 0.038),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.property.name,
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        Row(
                          children: [
                            const Icon(Icons.star),
                            Text(
                              "4.88",
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ],
                        ),
                        Text(
                          "${widget.property.city?.name} , ${widget.property.country?.name}",
                          style: Theme.of(context).textTheme.headline5,
                        ),
                        Row(
                          children: [
                            Text(
                              "${NumberFormat.decimalPattern().format(widget.property.price)} SYP",
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            Text(
                              propertyServicePriceUI.reverse[
                                      widget.property.propertyService] ??
                                  '',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(color: AppStyle.kGreyColor),
                            ),
                          ],
                        ),
                        const Spacing(),
                        Text(
                          widget.property.description,
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(fontWeight: FontWeight.normal),
                        ),
                        const Spacing(),
                        Text(
                          "This property provides".tr(),
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        ViewPropertyAttributes(
                          abstractPropertyAttributes: widget
                                  .property.agricultural ??
                              widget.property.commercial ??
                              widget.property.residential ??
                              AgriculturalPropertyAttributes(waterSources: 20),
                        ),
                        if (widget.property.amenities.isNotEmpty)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Spacing(),
                              Text(
                                "And in top of that".tr(),
                                style: Theme.of(context).textTheme.headline4,
                              ),
                              SizedBox(
                                height: screenHeight * 0.02,
                              ),
                              ViewPropertyAmenities(
                                amenities: widget.property.amenities,
                              ),
                            ],
                          ),
                        const Spacing(),
                        Text(
                          "Enjoy Virtual Reality View".tr(),
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .pushNamed(AppRoutes.virtualReality);
                          },
                          child: Container(
                            height: 200,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                borderRadius: AppStyle.k15BorderRadius,
                                image: DecorationImage(
                                  image: AssetImage(
                                    AppAssets.virtualReality,
                                  ),
                                  fit: BoxFit.fitWidth,
                                )),
                          ),
                        ),
                        const Spacing(),
                        Text(
                          "Property Location".tr(),
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        Stack(
                          children: [
                            MapLocationSquareWidget(
                              latLng: widget.property.location,
                              propertyType: widget.property.propertyType,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                    AppRoutes.streetViewMaps,
                                    arguments: widget.property.location);
                              },
                              child: Container(
                                height: 150,
                                width: screenWidth,
                                color: Colors.white10,
                              ),
                            )
                          ],
                        ),
                        if (widget.property.userInfo != null)
                          UserInfoPart(
                            title: "Host Info".tr(),
                            userInfo: widget.property.userInfo!,
                          ),

                        const Spacing(),
                        if (userIsLoggedIn(context) &&
                            widget.property.userInfo?.id !=
                                (context.read<UserBloc>().state
                                        as UserLoggedState).user.user.id)
                          BlocBuilder<MyRatingBloc, MyRatingState>(
                            builder: (context, state) {
                              if (state is MyRatingLoading) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                              if (state is MyRatingDone) {
                                if (state.propertyReviewsModel == null) {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Feel free to review this property".tr(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4,
                                      ),
                                      SizedBox(
                                        height: screenHeight * 0.02,
                                      ),
                                      PropertyRating(
                                        propertyID: widget.property.id,
                                      ),
                                      SizedBox(
                                        height: screenHeight * 0.02,
                                      ),
                                      const Spacing(),
                                    ],
                                  );
                                }
                              }
                              return const SizedBox();
                            },
                          ),

                        Text(
                          "Other people reviews".tr(),
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        SizedBox(
                          height: screenHeight * 0.02,
                        ),
                        ReviewsList(
                          propertyId: widget.property.id,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: AppBar(
                  backgroundColor: Colors.transparent,
                  leading: IconButton(
                    icon: const CircleAvatar(
                        backgroundColor: AppStyle.kBackGroundColor,
                        child: Icon(
                          Icons.arrow_back,
                          color: AppStyle.blackColor,
                        )),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  actions: [
                    StatefulBuilder(
                      builder: (BuildContext context,
                          void Function(void Function()) setState) {
                        return loadingShare
                            ? const Padding(
                                padding: EdgeInsets.all(8.0),
                                child:
                                    Center(child: CircularProgressIndicator()),
                              )
                            : IconButton(
                                icon: const CircleAvatar(
                                    backgroundColor: AppStyle.kBackGroundColor,
                                    child: Icon(
                                      Icons.share,
                                      color: AppStyle.blackColor,
                                    )),
                                onPressed: () async {
                                  setState(() {
                                    loadingShare = true;
                                  });
                                  if (widget.property.media.isNotEmpty) {
                                    File file = await urlToFile(
                                        widget.property.media[0]);
                                    await Share.shareFiles([file.path],
                                        text: 'Share this ${widget.property.name} !' +
                                            "\n Download Nostra Casa now !!" +
                                            "\n Android Link: " +
                                            "\n IOS Link:");
                                  } else {
                                    await Share.share(
                                        'Share this ${widget.property.name} !' +
                                            "\n Download Nostra Casa now !!" +
                                            "\n Android Link: " +
                                            "\n IOS Link:");
                                  }
                                  setState(() {
                                    loadingShare = false;
                                  });
                                },
                              );
                      },
                    ),
                    if (userIsLoggedIn(context))
                      BlocBuilder<OnePropertyBloc, OnePropertyState>(
                        builder: (context, state) {
                          if (state is OnePropertyDoneState) {
                            return IconButton(
                              icon: CircleAvatar(
                                  backgroundColor: AppStyle.kBackGroundColor,
                                  child: Icon(
                                    state.favouriteState
                                        ? Icons.favorite
                                        : Icons.favorite_outline_sharp,
                                    color: state.favouriteState
                                        ? AppStyle.redColor
                                        : AppStyle.blackColor,
                                  )),
                              onPressed: () {
                                context.read<OnePropertyBloc>().add(
                                    ToggleFavouriteEvent(
                                        productObjectId: widget.property.id));
                              },
                            );
                          }
                          return const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Center(child: CircularProgressIndicator()),
                          );
                        },
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
