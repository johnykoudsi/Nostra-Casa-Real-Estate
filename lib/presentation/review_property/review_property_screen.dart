import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nostra_casa/business_logic/send_property_bloc/send_property_bloc.dart';
import 'package:nostra_casa/presentation/global_widgets/dialogs_widgets/dialogs_snackBar.dart';
import '../../business_logic/add_property_bloc/add_property_bloc.dart';
import '../../utility/app_style.dart';
import '../global_widgets/elevated_button_widget.dart';
import '../view_property/widgets/property_rating.dart';
import '../view_property/widgets/spacing.dart';

class ReviewProperty extends StatelessWidget {
  const ReviewProperty({required this.addPropertyState, Key? key})
      : super(key: key);

  final AddPropertyState? addPropertyState;

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
                    //ViewPropertyImages(),
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
                            "Property Name",
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
                            "al-malki, Damascus, Syria",
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          Row(
                            children: [
                              Text(
                                "90000000 sp",
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              Text(
                                " month",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(color: AppStyle.kGreyColor),
                              ),
                            ],
                          ),
                          const Spacing(),
                          Text(
                            "This house is so great you can see the whole city from the roof ",
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
                          //ViewPropertyAttributes(),
                          const Spacing(),
                          Text(
                            "And in top of that".tr(),
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          SizedBox(
                            height: screenHeight * 0.02,
                          ),
                         // const ViewPropertyAmenities(),
                          const Spacing(),
                          Text(
                            "Feel free to rate this property".tr(),
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          SizedBox(
                            height: screenHeight * 0.02,
                          ),
                          const PropertyRating(),
                          SizedBox(
                            height: screenHeight * 0.02,
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
                      IconButton(
                        icon: const CircleAvatar(
                            backgroundColor: AppStyle.kBackGroundColor,
                            child: Icon(
                              Icons.favorite_outline_sharp,
                              color: AppStyle.blackColor,
                            )),
                        onPressed: () {
                          //todo add property to favorite
                        },
                      ),
                    ],
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
                          addPropertyState: addPropertyState!));
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
