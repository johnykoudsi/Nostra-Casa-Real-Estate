import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utility/app_style.dart';

class MyProfileItem extends StatefulWidget {
  MyProfileItem(
      {this.borderRad = 0.0,
        this.isDelete =false,
      required this.svgPath,
      required this.name,
      required this.onPressed,
      required this.color,
      Key? key})
      : super(key: key);
  String svgPath;
  String name;
  Function() onPressed;
  Color color;
  double borderRad;
  bool isDelete;

  @override
  State<MyProfileItem> createState() => _MyProfileItemState();
}

class _MyProfileItemState extends State<MyProfileItem> {
  @override
  var isClicked = false;

  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(widget.borderRad),
      ),
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          splashFactory: NoSplash.splashFactory,
          backgroundColor:
              MaterialStateProperty.all<Color>(widget.color),
          overlayColor: MaterialStateProperty.all<Color>(widget.isDelete ? AppStyle.redColor : AppStyle.blackColor),
          padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
          textStyle: MaterialStateProperty.resolveWith<TextStyle?>((states) {
            Future.delayed(Duration.zero, () async {
              if (states.contains(MaterialState.pressed)) {
                setState(() {
                  isClicked = true;
                });
              } else {
                setState(() {
                  isClicked = false;
                });
              }
            });
            return Theme.of(context).textTheme.headline5;
          }),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
              // side: BorderSide(color: Colors.white),
            ),
          ),
        ),
        onPressed: widget.onPressed,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                padding: EdgeInsets.all(screenWidth * 0.04),
                child: SizedBox(
                    width: screenWidth * 0.06,
                    height: screenWidth * 0.06,
                    child: SvgPicture.asset(widget.svgPath,
                      color: (isClicked) ?Colors.white:( (widget.isDelete)?AppStyle.redColor:AppStyle.blackColor),

                    ))),
            Text(
              widget.name,
              style: Theme.of(context).textTheme.headline4?.copyWith(
                color: (isClicked) ? Colors.white : AppStyle.blackColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
