import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nostra_casa/presentation/view_property/widgets/reviews_list.dart';
import 'package:nostra_casa/presentation/view_property/widgets/spacing.dart';
import 'package:nostra_casa/utility/app_style.dart';

import '../../global_widgets/custom_text_field.dart';
import '../../global_widgets/elevated_button_widget.dart';

class PropertyRating extends StatefulWidget {
  const PropertyRating({Key? key}) : super(key: key);

  @override
  State<PropertyRating> createState() => _PropertyRatingState();
}

class _PropertyRatingState extends State<PropertyRating> {
  static final GlobalKey<FormState> _key = GlobalKey<FormState>();
  double _rating = 3;
  TextEditingController reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Form(
          key: _key,
          child: CustomTextField(
            hintText: "it's great property".tr(),
            passwordBool: false,
            label: "Your Review".tr(),
            controller: reviewController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Name can not be empty".tr();
              }
              return null;
            },
          ),
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
              _rating = rating;
            });
          },
          updateOnDrag: true,
        ),
        SizedBox(height: screenHeight*0.03,),
        ElevatedButtonWidget(
          title: "Submit".tr(),
          onPressed: () {
            if (_key.currentState!.validate()) {

            }
          },
        ),
      ],
    );
  }
}
