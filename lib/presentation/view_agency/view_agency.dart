import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nostra_casa/business_logic/user/user_bloc.dart';
import 'package:nostra_casa/utility/constant_logic_validations.dart';

import '../../utility/app_assets.dart';
import '../../utility/app_style.dart';
import '../view_property/widgets/spacing.dart';
import '../view_property/widgets/user_info_part.dart';

class ViewAgency extends StatefulWidget {
  const ViewAgency({Key? key}) : super(key: key);

  @override
  State<ViewAgency> createState() => _ViewAgencyState();
}

class _ViewAgencyState extends State<ViewAgency> {
  @override
  Widget build(BuildContext context) {
    var userInfo;
    final userState = globalUserBloc.state;
    if(userState is UserLoggedState){
      userInfo = userState.user.user;
    }
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppStyle.kBackGroundColor,
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.038),
        child: ListView(
          children: [
            SizedBox(
              height: screenHeight * 0.2,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: const Image(
                    image: AssetImage(
                      AppAssets.agency,
                    ),
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Row(
              children: [
              SvgPicture.asset(AppAssets.badge),
                Text(
                  "The Future Agency",
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
              UserInfoPart(
                title: "Agency Info".tr(),
                userInfo: userInfo,
              ),
          ],
        ),
      ),
    );
  }
}
