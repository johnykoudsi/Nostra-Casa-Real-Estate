import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nostra_casa/utility/app_style.dart';
import 'elevated_button_widget.dart';

class SomethingWrongWidget extends StatelessWidget {
  SomethingWrongWidget({
      this.textColor = AppStyle.blackColor,
      this.title = 'Something went wrong !',
      this.svgPath = "assets/images/no-internet.svg",
      this.elevatedButtonWidget,
      Key? key
      })
      : super(key: key);
  String title;
  String svgPath;
  ElevatedButtonWidget? elevatedButtonWidget;
  Color textColor;
  @override
  Widget build(BuildContext context) {
    double getWidth = MediaQuery.of(context).size.width;
    double getHeight = MediaQuery.of(context).size.height;

    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              width: getWidth * 0.5,
              height: getWidth * 0.5,
              child: SvgPicture.asset(
                svgPath,
                color: AppStyle.kGreyColor,
              ),
            ),
            Builder(builder: (context) {
              if (title == 'Something went wrong !') {
                return Text(
                  title,
                  style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: textColor),
                  textAlign: TextAlign.center,
                );
              }
              return Text(title,
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(color: textColor),
                textAlign: TextAlign.center,

              );
            }),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getWidth * 0.2,
                  vertical: getWidth * 0.05
              ),
              child: elevatedButtonWidget ?? const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
