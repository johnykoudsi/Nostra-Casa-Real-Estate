import 'package:animations/animations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nostra_casa/presentation/bottom_nav_bar/widgets/CustomNavigatorWidget.dart';
import 'package:nostra_casa/presentation/bottom_nav_bar/widgets/bottom_nav_bar_screens.dart';
import 'package:nostra_casa/presentation/global_widgets/dialogs_widgets/dialogs_yes_no.dart';
import 'package:nostra_casa/utility/app_assets.dart';
import 'package:nostra_casa/utility/app_style.dart';
import '../global_widgets/elevated_button_widget.dart';
import '../policy/policy.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final SharedAxisTransitionType _transitionType =
      SharedAxisTransitionType.horizontal;
  int selectedIndex = 0;
  bool isReverse = false;

  @override
  Widget build(BuildContext context) {
    double getWidth = MediaQuery.of(context).size.width;
    double getHeight = MediaQuery.of(context).size.height;
    Future<bool> onWillPopMethod() async {
      return DialogsWidgetsYesNo.onWillPopMethod(context);
    }

    return ColoredBox(
      color: AppStyle.kBackGroundColor,
      child: SafeArea(
        bottom: false,
        child: WillPopScope(
          onWillPop: onWillPopMethod,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            bottomNavigationBar: SizedBox(
              height: getWidth * 0.22,
              child: BottomNavigationBar(
                selectedFontSize: 0.0,
                unselectedFontSize: 0.0,
                elevation: 0,
                backgroundColor: AppStyle.kBackGroundColor,
                type: BottomNavigationBarType.fixed,
                currentIndex: selectedIndex,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                onTap: onItemTapped,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: CustomNavigatorWidget(
                      widgetIndex: 0,
                      svgPath: AppAssets.mkbr,
                      selectedIndex: selectedIndex,
                    ),
                    label: 'Explore',
                  ),
                  BottomNavigationBarItem(
                    icon: CustomNavigatorWidget(
                      widgetIndex: 1,
                      svgPath: AppAssets.mapLocation,
                      selectedIndex: selectedIndex,
                    ),
                    label: 'Map',
                  ),
                  BottomNavigationBarItem(
                    icon: CustomNavigatorWidget(
                      widgetIndex: 2,
                      svgPath: AppAssets.houseAdd,
                      selectedIndex: selectedIndex,
                    ),
                    label: 'Add Property',
                  ),
                  BottomNavigationBarItem(
                    icon: CustomNavigatorWidget(
                      widgetIndex: 3,
                      svgPath: AppAssets.heart,
                      selectedIndex: selectedIndex,
                    ),
                    label: 'WishList',
                  ),
                  BottomNavigationBarItem(
                    icon: CustomNavigatorWidget(
                      widgetIndex: 4,
                      svgPath: AppAssets.more,
                      selectedIndex: selectedIndex,
                    ),
                    label: 'More',
                  ),
                ],
              ),
            ),
            body: PageTransitionSwitcher(
              duration: const Duration(milliseconds: 600),
              reverse:
                  context.locale.languageCode == 'ar' ? !isReverse : isReverse,
              transitionBuilder: (Widget child, Animation<double> animation,
                  Animation<double> secondaryAnimation) {
                return SharedAxisTransition(
                  animation: animation,
                  secondaryAnimation: secondaryAnimation,
                  transitionType: _transitionType,
                  child: child,
                );
              },
              child: GetSelectedScreenByIndex(
                screenIndex: selectedIndex,
                key: Key(selectedIndex.toString()),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      if (index > selectedIndex) {
        isReverse = false;
      } else {
        isReverse = true;
      }
      selectedIndex = index;
    });
  }
}
