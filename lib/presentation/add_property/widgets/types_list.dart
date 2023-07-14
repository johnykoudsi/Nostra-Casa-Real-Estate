import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utility/app_assets.dart';
import '../../../utility/app_style.dart';

class TypesList extends StatefulWidget {
   TypesList({Key? key, required this.svgPaths, required this.description, required this.title}) : super(key: key);

   final List<String> svgPaths;
   final List<String> description;
   final List<String> title;



   @override
  State<TypesList> createState() => _TypesListState();
}

class _TypesListState extends State<TypesList> {
  List<bool>clicked = [false,false,false];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return GridView.builder(
        itemCount: 3,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 3,
          crossAxisCount: 1,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                clicked=[false,false,false];
                clicked[index] = true;

              });
            },
            child: Container(
                decoration: BoxDecoration(
                  color: clicked[index] ? AppStyle.kGreyColor : AppStyle.kBackGroundColor,
                  border: Border.all(
                    color: clicked[index]  ? AppStyle.blackColor : AppStyle.kGreyColor,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.05, right: screenWidth * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title[index],
                            style: Theme.of(context).textTheme.headline4!.copyWith(
                              fontSize: 18,
                            ),
                          ),
                          Container(
                            width: screenWidth * 0.5,
                            child: Text(
                              widget.description[index],
                              maxLines: 3,
                            ),
                          ),
                        ],
                      ),
                      SvgPicture.asset(
                        widget.svgPaths[index],
                        width: screenWidth * 0.1,
                        height: screenHeight * 0.05,
                      ),
                    ],
                  ),
                )),
          );
        });
  }
}
