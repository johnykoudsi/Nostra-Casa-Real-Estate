import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nostra_casa/data/models/user_model.dart';
import 'package:nostra_casa/utility/enums.dart';
import '../../utility/app_assets.dart';
import '../../utility/app_routes.dart';
import '../../utility/app_style.dart';
import '../map_location_square_widget/map_location_widget.dart';
import '../view_property/widgets/spacing.dart';
import '../view_property/widgets/user_info_part.dart';

class ViewAgency extends StatelessWidget {
  const ViewAgency({required this.userInfo,Key? key}) : super(key: key);
 final UserInfo userInfo;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppStyle.kBackGroundColor,
      appBar: AppBar(
        backgroundColor: AppStyle.blackColor,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: AppStyle.kBackGroundColor,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.038),
        child: ListView(
          children: [
            SizedBox(height: screenHeight*0.02,),
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
              UserInfoPart(
                title: "Agency Info".tr(),
                userInfo: userInfo,
                fromViewProperty: false,

              ),
            const Spacing(),
            Text(
              "Agency Location".tr(),
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Stack(
              children: [
                MapLocationSquareWidget(
                  latLng: userInfo.agencyModel!.latLng,
                  propertyType: PropertyType.commercial,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                        AppRoutes.streetViewMaps,
                        arguments: userInfo.agencyModel!.latLng);
                  },
                  child: Container(
                    height: 150,
                    width: screenWidth,
                    color: Colors.white10,
                  ),
                )
              ],
            ),
            const Spacing(),
          ],
        ),
      ),
    );
  }
}
