import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utility/app_style.dart';

class CustomGrid extends StatefulWidget {
  const CustomGrid({Key? key, required this.svgPaths, required this.title}) : super(key: key);
  final List<String> svgPaths;
  final List<String> title;
  @override
  State<CustomGrid> createState() => _CustomGridState();
}

class _CustomGridState extends State<CustomGrid> {
  List<bool> clicked =[];

  @override
  Widget build(BuildContext context) {
    for(int i=0;i<widget.title.length;i++){
      clicked.add(false);
    }
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return GridView.builder(
        itemCount: widget.title.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1.6,
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                clicked[index] = !clicked[index];
              });
            },
            child: Container(
                decoration: BoxDecoration(
                  color: clicked[index] ? AppStyle.kGreyColor : AppStyle.kBackGroundColor,
                  border: Border.all(
                    color: clicked[index] ? AppStyle.blackColor : AppStyle.kGreyColor,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.03),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        widget.svgPaths[index],
                        width: screenWidth * 0.1,
                        height: screenHeight * 0.05,
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      Text(
                        widget.title[index],
                        style: Theme.of(context).textTheme.headline5,
                      )
                    ],
                  ),
                )),
          );
        });
  }
}
