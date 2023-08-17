import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nostra_casa/business_logic/notifications/notifications_bloc.dart';
import 'package:nostra_casa/data/models/notifications_model.dart';

import '../../../utility/app_assets.dart';
import '../../../utility/app_style.dart';
import '../../global_widgets/elevated_button_widget.dart';
import '../../global_widgets/shimmer.dart';
import '../../global_widgets/somthing_wrong.dart';

class NotificationsList extends StatefulWidget {
  NotificationsList({Key? key}) : super(key: key);

  @override
  State<NotificationsList> createState() => _NotificationsListState();
}

class _NotificationsListState extends State<NotificationsList> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        context.read<NotificationsBloc>().add(
              GetNotificationApiEvent(
                notificationsSearchFilter: NotificationsSearchFilter(),
              ),
            );
      }
    });
    super.initState();
  }

  void search() {
    context
        .read<NotificationsBloc>()
        .add(ChangeToLoadingNotificatiosApiEvent());
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return BlocBuilder<NotificationsBloc, NotificationsState>(
        builder: (context, state) {
      if (state is NotificationLoadedState) {
        return ListView.builder(
          controller: scrollController,
            itemCount: state.hasReachedMax
                ? state.notifications.length
                : state.notifications.length + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index >= state.notifications.length) {
                return Container(
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
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: AppStyle.blackColor),
                          ),
                          child: const CircleAvatar(
                            radius: 37,
                            backgroundColor: AppStyle.blackColor,
                            child: CircleAvatar(
                              radius: 35,
                              foregroundImage: AssetImage(AppAssets.logo),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: screenWidth * 0.02,
                        ),
                        Expanded(
                          child: ShimmerLoader(),
                        ),
                      ],
                    ),
                  ),
                );
              }
              return NotificationItemWidget(
                notification: state.notifications[index],
                index: index,
              );
            });
      }
      if (state is NotificationsInitial) {
        return ListView.builder(
            controller: scrollController,

            itemCount: 8,
            itemBuilder: (BuildContext context, int index) {
              return Container(
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
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: AppStyle.blackColor),
                        ),
                        child: const CircleAvatar(
                          radius: 37,
                          backgroundColor: AppStyle.blackColor,
                          child: CircleAvatar(
                            radius: 35,
                            foregroundImage: AssetImage(AppAssets.logo),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.02,
                      ),
                      Expanded(
                        child: ShimmerLoader(),
                      ),
                    ],
                  ),
                ),
              );
            });
      }
      return SomethingWrongWidget(
        elevatedButtonWidget: ElevatedButtonWidget(
          title: "Refresh".tr(),
          onPressed: () {
            search();
          },
        ),
      );
    });
  }
}

class NotificationItemWidget extends StatelessWidget {
  NotificationItemWidget(
      {required this.notification, Key? key, required this.index})
      : super(key: key);
  NotificationModel notification;
  int index;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        color:
            (index % 2 == 1) ? AppStyle.kBackGroundColor : AppStyle.kLightGrey,
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
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: AppStyle.blackColor),
              ),
              child: const CircleAvatar(
                radius: 37,
                backgroundColor: AppStyle.blackColor,
                child: CircleAvatar(
                  radius: 35,
                  foregroundImage: AssetImage(AppAssets.logo),
                ),
              ),
            ),
            SizedBox(
              width: screenWidth * 0.02,
            ),
            Expanded(
              child: Text(
                notification.notification.body,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
