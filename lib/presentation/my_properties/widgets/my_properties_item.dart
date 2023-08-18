import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nostra_casa/business_logic/my_property_action/my_property_action_bloc.dart';
import 'package:nostra_casa/presentation/global_widgets/dialogs_widgets/dialogs_snackBar.dart';
import 'package:nostra_casa/utility/network_helper.dart';

import '../../../data/models/properties_model.dart';
import '../../../utility/app_assets.dart';
import '../../../utility/app_routes.dart';
import '../../../utility/app_style.dart';
import '../../add_property/widgets/rounded_elevated_button.dart';
import 'my_properties_shimmer.dart';

class MyPropertyItemWidget extends StatelessWidget {
  MyPropertyItemWidget({Key? key, required this.property, required this.index})
      : super(key: key);

  int index;
  Property property;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(AppRoutes.viewProperty, arguments: property);
      },
      child: Container(
        decoration: BoxDecoration(
          color: (index % 2 == 1)
              ? AppStyle.kBackGroundColor
              : AppStyle.kLightGrey,
        ),
        child: Padding(
          padding: EdgeInsets.only(
              left: screenWidth * 0.038,
              right: screenWidth * 0.038,
              top: screenHeight * 0.02,
              bottom: screenHeight * 0.02),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: screenWidth * 0.35,
                height: screenHeight * 0.12,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: FadeInImage(
                  placeholder: const AssetImage(AppAssets.greyLogo),
                  image: NetworkImage(
                      property.media.isNotEmpty ? property.media[0] : ""),
                  fit: BoxFit.cover,
                  imageErrorBuilder: (context, error, stackTrace) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        AppAssets.greyLogo,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                width: screenWidth * 0.02,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Damascus,Syria",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Text(property.name,
                        style: Theme.of(context).textTheme.headline5),
                    Text(
                      "${NumberFormat.decimalPattern().format(property.price)} SYP",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RoundedElevatedButton(
                    onTap: () {
                      context.read<MyPropertyActionBloc>().add(
                          DeletePropertyEvent(
                              propertyType: property.propertyType,
                              propertyId: property.id));
                    },
                    iconData: Icons.delete_forever,
                    iconColor: Colors.red,
                    backgroundColor: AppStyle.kBackGroundColor,
                  ),
                  RoundedElevatedButton(
                    onTap: () {},
                    iconData: Icons.edit,
                    iconColor: Colors.black45,
                    backgroundColor: AppStyle.kBackGroundColor,
                  ),
                  RoundedElevatedButton(
                    onTap: () {},
                    iconData: Icons.sync_alt_sharp,
                    iconColor: Colors.black45,
                    backgroundColor: AppStyle.kBackGroundColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
