import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../utility/app_style.dart';

class ReviewsList extends StatefulWidget {
  const ReviewsList({Key? key}) : super(key: key);

  @override
  State<ReviewsList> createState() => _ReviewsListState();
}

class _ReviewsListState extends State<ReviewsList> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      width: screenWidth,
      height: screenHeight * 0.3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding:  EdgeInsets.only(left: screenWidth*0.03,right: screenWidth*0.03),
            child: Container(
              height: screenHeight*0.2,
              width: screenWidth * 0.65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: AppStyle.kGreyColor),
              ),
              child:  Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ListView(
                        children: [
                          Text("this is the best property i ever saw in my entire life i would buy it but i can't afford it.",

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
                      initialRating: 3.0,
                      glow: true,
                      ignoreGestures: true,

                      itemBuilder: (context, _) =>
                          Icon(Icons.star, color: Colors.amber,),
                      onRatingUpdate: (rat) {
                        // controller.rating.value = rating.toInt();

                      },),
                    Column(
                      children: [
                        SizedBox(height: screenHeight*0.01,),
                        Text("Johny Koudsi",
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        Text("3 months ago",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
