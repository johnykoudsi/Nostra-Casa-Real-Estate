import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nostra_casa/business_logic/send_property_bloc/send_property_bloc.dart';
import 'package:nostra_casa/business_logic/user/user_bloc.dart';
import 'package:nostra_casa/presentation/global_widgets/dialogs_widgets/dialogs_snackBar.dart';
import 'package:nostra_casa/presentation/review_property/widget/view_property_images_files.dart';
import '../../business_logic/add_property_bloc/add_property_bloc.dart';
import '../../utility/app_assets.dart';
import '../../utility/app_routes.dart';
import '../../utility/app_style.dart';
import '../../utility/enums.dart';
import '../global_widgets/elevated_button_widget.dart';
import '../map_location_square_widget/map_location_widget.dart';
import '../view_property/widgets/spacing.dart';
import '../view_property/widgets/user_info_part.dart';
import '../view_property/widgets/view_property_amenities.dart';
import '../view_property/widgets/view_property_attributes.dart';
import '../view_property/widgets/view_property_images.dart';

class ReviewProperty extends StatelessWidget {
  const ReviewProperty({required this.addPropertyState, Key? key})
      : super(key: key);

  final AddPropertyState addPropertyState;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return BlocListener<SendPropertyBloc, SendPropertyState>(
      listener: (context, state) {
        if (state is SendPropertyStatus) {
          DialogsWidgetsSnackBar.showSnackBarFromStatus(
              context: context,
              helperResponse: state.helperResponse,
              showServerError: true,
              popOnSuccessCount: 2);
        }
      },
      child: Scaffold(
        body:  SafeArea(
          child: Scaffold(
            backgroundColor: AppStyle.kBackGroundColor,
            body: Stack(
              children: [
                ListView(
                  children: [
                    ViewPropertyImagesFiles(
                      files: addPropertyState.images,
                      propertyService: addPropertyState.propertyService,
                    ),
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
                            addPropertyState.title,
                            style: Theme.of(context).textTheme.headline2,
                          ),

                          Text(
                            "${addPropertyState.city?.name} , ${addPropertyState.countryModel?.name}",
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          Row(
                            children: [
                              Text(
                                "${NumberFormat.decimalPattern().format(addPropertyState.price)} SYP",
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              Text(
                                propertyServicePriceUI.reverse[
                                addPropertyState.propertyService] ??
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
                            addPropertyState.description,
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
                            abstractPropertyAttributes: addPropertyState.propertyAttributes!,
                          ),
                          if (addPropertyState.selectedAmenity.isNotEmpty)
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
                                  amenities: addPropertyState.selectedAmenity,
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
                                latLng: addPropertyState.selectedLocation!,
                                propertyType: addPropertyState.selectedPropertyType!,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                      AppRoutes.streetViewMaps,
                                      arguments: addPropertyState.selectedLocation!);
                                },
                                child: Container(
                                  height: 150,
                                  width: screenWidth,
                                  color: Colors.white10,
                                ),
                              )
                            ],
                          ),
                            UserInfoPart(
                              title: "Host Info".tr(),
                              userInfo: (context.read<UserBloc>().state as UserLoggedState).user.user,
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
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
          child: BlocBuilder<SendPropertyBloc, SendPropertyState>(
            builder: (context, state) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButtonWidget(
                    title: "Add",
                    isLoading: state is SendPropertyLoading,
                    onPressed: () {
                      context.read<SendPropertyBloc>().add(SendPropertyApiEvent(
                          addPropertyState: addPropertyState));
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
