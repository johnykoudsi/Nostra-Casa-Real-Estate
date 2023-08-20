import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nostra_casa/business_logic/rate_property/rate_property_bloc.dart';
import '../../global_widgets/custom_text_field.dart';
import '../../global_widgets/elevated_button_widget.dart';

class PropertyRating extends StatefulWidget {
  PropertyRating({Key? key, required this.propertyID}) : super(key: key);
  int propertyID;

  @override
  State<PropertyRating> createState() => _PropertyRatingState();
}

class _PropertyRatingState extends State<PropertyRating> {
  double _rating = 0;
  bool ratingChanged = false;
  TextEditingController reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          hintText: "it's great property".tr(),
          passwordBool: false,
          label: "Your Review".tr(),
          controller: reviewController,
        ),
        SizedBox(
          height: screenHeight * 0.05,
        ),
        RatingBar.builder(
          initialRating: 3,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          unratedColor: Colors.amber.withAlpha(50),
          itemCount: 5,
          itemSize: 30.0,
          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            setState(() {
              ratingChanged = true;
              _rating = rating;
            });
          },
          updateOnDrag: true,
        ),
        SizedBox(
          height: screenHeight * 0.03,
        ),
        BlocBuilder<RatePropertyBloc, RatePropertyState>(
          builder: (context, state) {
            return ElevatedButtonWidget(
              title: "Submit".tr(),
              isLoading: state is RatePropertyLoading,
              onPressed: ratingChanged
                  ? () {
                      context.read<RatePropertyBloc>().add(RatePropertyApiEvent(
                          rate: _rating.toString(),
                          propertyId: widget.propertyID,
                          review: reviewController.text));
                    }
                  : null,
            );
          },
        ),
      ],
    );
  }
}
