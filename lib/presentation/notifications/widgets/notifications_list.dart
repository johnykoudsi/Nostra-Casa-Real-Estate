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
  NotificationsList({Key? key, required this.notifications, this.userId})
      : super(key: key);
  List<String> notifications;
  int? userId;

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
                userId: widget.userId!,
                notificationsSearchFilter: NotificationsSearchFilter(),
              ),
            );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsBloc, NotificationsState>(
        builder: (context, state) {
      if (state is NotificationLoadedState) {
        return ListView.builder(
            itemCount: state.hasReachedMax
                ? state.notifications.length
                : state.notifications.length + 2,
            itemBuilder: (BuildContext context, int index) {
              if (index >= state.notifications.length) {
                return ShimmerLoader();
              }
              return NotificationItemWidget(
                notification: state.notifications[index],
                index: index,
              );
            });
      }
      if (state is NotificationsInitial) {
        return ListView.builder(
            itemCount: 8,
            itemBuilder: (BuildContext context, int index) {
              return ShimmerLoader();
            });
      }
      return SomethingWrongWidget(
        elevatedButtonWidget: ElevatedButtonWidget(
          title: "Refresh".tr(),
          onPressed: () {
            context.read<NotificationsBloc>().add(ChangeToLoadingNotificatiosApiEvent());
            //search(userS);
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
  UserNotification notification;
  int index;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        color: index.isEven ? AppStyle.kBackGroundColor : AppStyle.kLightGrey,
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
                notification.body,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
