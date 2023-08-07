import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class PropertyRating extends StatefulWidget {
   const PropertyRating({Key? key}) : super(key: key);

  @override
  State<PropertyRating> createState() => _PropertyRatingState();
}

class _PropertyRatingState extends State<PropertyRating> {
  double _rating = 3;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RatingBar.builder(
        initialRating: 3,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        unratedColor: Colors.amber.withAlpha(50),
        itemCount: 5,
        itemSize: 30.0,
        itemPadding:
        const EdgeInsets.symmetric(horizontal: 4.0),
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
    );
  }
}
