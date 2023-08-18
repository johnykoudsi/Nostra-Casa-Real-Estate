import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nostra_casa/presentation/global_widgets/dialogs_widgets/dialogs_yes_no.dart';
import 'package:nostra_casa/presentation/global_widgets/somthing_wrong.dart';
import 'package:nostra_casa/utility/app_assets.dart';
import 'package:nostra_casa/utility/app_routes.dart';

import '../../business_logic/agency_promotion_status/agency_promotion_status_bloc.dart';
import '../../utility/app_style.dart';
import '../../utility/constant_logic_validations.dart';
import '../global_widgets/elevated_button_widget.dart';

class WelcomeToPromote extends StatefulWidget {
  const WelcomeToPromote({Key? key}) : super(key: key);

  @override
  State<WelcomeToPromote> createState() => _WelcomeToPromoteState();
}

class _WelcomeToPromoteState extends State<WelcomeToPromote> {
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool userNotCanceled = true;
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
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.038,
                    vertical: screenWidth * 0.038),
                child: const Image(
                  image: AssetImage(AppAssets.agency),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.038,
                    vertical: screenWidth * 0.038),
                child: BlocBuilder<AgencyPromotionStatusBloc,
                    AgencyPromotionStatusState>(
                  builder: (context, state) {
                    if (state is AgencyPromotionStatusLoadingState) {
                      return const CircularProgressIndicator();
                    }
                    if (state is AgencyPromotionStatusDoneState) {
                      if (state.status == "No request submitted") {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Promote now and get your badge".tr(),
                              style: Theme.of(context).textTheme.headline2,
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            Text(
                              "We will need more information about your agency in order to confirm you promotion request"
                                  .tr(),
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ],
                        );
                      } else if (state.status == "Pending") {
                        return SomethingWrongWidget(
                          svgPath: AppAssets.promote,
                          title: "Your request is on pending ".tr(),
                        );
                      }else if(state.status=="Accepted"){
                        return SomethingWrongWidget(
                          svgPath: AppAssets.promote,
                          title: "Your request has been accepted you are an agency now".tr(),
                        );
                      }
                      else if(state.status=="Rejected"){
                        return SomethingWrongWidget(
                          svgPath: AppAssets.promote,
                          title: "sorry, your request has been rejected".tr(),
                        );
                      }
                    }
                    return SomethingWrongWidget(
                      elevatedButtonWidget: ElevatedButtonWidget(
                        title: "Refresh".tr(),
                        onPressed: () {
                          context
                              .read<AgencyPromotionStatusBloc>()
                              .add(GetPromotionStatusEvent());
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.only(
            left: screenWidth * 0.038,
            right: screenWidth * 0.038,
            bottom: screenWidth * 0.1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<AgencyPromotionStatusBloc, AgencyPromotionStatusState>(
              builder: (context, state) {
                if (state is AgencyPromotionStatusDoneState) {
                  if (state.status == "No request submitted") {
                    return ElevatedButtonWidget(
                      isLoading: state is AgencyPromotionStatusLoadingState,
                      title: "Promote Now".tr(),
                      onPressed: () {
                        if(userNotCanceled == true){
                          DialogsWidgetsYesNo.showYesNoDialog(
                              title: "Your current information will become your agency information. \n do you want to change it?".tr(),
                              noTitle: "Cancel".tr(),
                              yesTitle: "Change".tr(),
                              onYesTap: () {
                                Navigator.pushNamed(context, AppRoutes.editProfile);
                              },
                              onNoTap: () {
                                Navigator.of(context).pop();
                                userNotCanceled =false;
                              },
                              context: context);
                        }else{
                          Navigator.of(context)
                              .pushNamed(AppRoutes.promoteToAgency);
                        }

                      },
                    );
                  }
                }
                return const Text("");
              },
            )
          ],
        ),
      ),
    );
  }
}
