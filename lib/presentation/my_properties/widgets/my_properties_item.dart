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
import '../../global_widgets/dialogs_widgets/dialogs_yes_no.dart';
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
    TextEditingController priceController = TextEditingController();

    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(AppRoutes.viewProperty, arguments: property);
      },
      child: BlocListener<MyPropertyActionBloc, MyPropertyActionState>(
        listener: (context, state) {
          if (state is MyPropertyActionStatus) {
            DialogsWidgetsSnackBar.showSnackBarFromStatus(
              context: context,
              helperResponse: state.helperResponse,
              showServerError: true,
            );
          }
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
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: FadeInImage(
                      placeholder: const AssetImage(AppAssets.greyLogo),
                      image: NetworkImage(
                          property.media.isNotEmpty ? property.media[0] : ""),
                      fit: BoxFit.cover,
                      imageErrorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          AppAssets.greyLogo,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
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
                    BlocBuilder<MyPropertyActionBloc, MyPropertyActionState>(
                      builder: (context, state) {
                        if (state is MyPropertyActionLoading) {
                          return CircularProgressIndicator();
                        }
                        return RoundedElevatedButton(
                          onTap: () {
                            DialogsWidgetsYesNo.showYesNoDialog(title: "Are you sure you want to delete this property?".tr(),
                                noTitle: "No".tr(),
                                yesTitle: "Yes".tr(),
                                onYesTap: (){     context.read<MyPropertyActionBloc>().add(
                                    DeletePropertyEvent(
                                        propertyType: property.propertyType,
                                        propertyId: property.id));},
                                onNoTap: (){Navigator.pop(context);},
                                context: context);

                          },
                          iconData: Icons.delete_forever,
                          iconColor: Colors.red,
                          backgroundColor: AppStyle.kBackGroundColor,
                        );
                      },
                    ),
                    RoundedElevatedButton(
                      onTap: () {
                        priceController.text=property.price.toString();
                        DialogsWidgetsYesNo.textFieldDialog(
                            priceController: priceController,
                            context: context,operationName: "Edit".tr(),
                            onYes: (){
                              context.read<MyPropertyActionBloc>().add(
                                  EditPropertyEvent(

                                      propertyType: property.propertyType,
                                      propertyId: property.id, price: double.parse(priceController.text)));
                            },

                        );

                        // context.read<MyPropertyActionBloc>().add(
                        //     EditPropertyEvent(
                        //
                        //         propertyType: property.propertyType,
                        //         propertyId: property.id, price: 50));

                      },
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
      ),
    );
  }
}
