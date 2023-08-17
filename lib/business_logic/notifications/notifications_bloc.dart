import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nostra_casa/data/models/notifications_model.dart';

import '../../data/services/notifications_service.dart';
import '../../utility/constant_logic_validations.dart';
import '../../utility/network_helper.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  NotificationsBloc() : super(NotificationsInitial()) {
    NotificationsService notificationsService = NotificationsService();
    var userId;
    on<GetNotificationApiEvent>((event, emit) async {
      final currentState = state;

      if (currentState is NotificationLoadedState && currentState.hasReachedMax) {
        return;
      }

      int getPage() {
        if (currentState is NotificationLoadedState) {
          return currentState.notifications.length ~/ kProductsGetLimit + 1;
        }
        return 0;
      }

      var getNotifications;


      event.notificationsSearchFilter.page = getPage();
      userId=event.userId;

      getNotifications = await notificationsService.getNotificationsService(
        event: event,
      );

      if (getNotifications is List<UserNotification>) {
        if (getNotifications.isNotEmpty) {
          // copy previous state
          if (currentState is NotificationLoadedState) {
            emit(currentState.copyWith(
                notifications: List.of(currentState.notifications)..addAll(getNotifications),
                hasReachedMax:
                getNotifications.length < kProductsGetLimit ? true : false));
          }

          // add loaded state
          else {
            emit(NotificationLoadedState(
              notifications: getNotifications,
              hasReachedMax:
              getNotifications.length < kProductsGetLimit ? true : false,
            ));
          }
        } else {
          // done loading
          if (currentState is NotificationLoadedState) {
            emit(currentState.copyWith(hasReachedMax: true));
          }
          // done but nothing is there
          else {
            emit(NotificationLoadedState(
              notifications: getNotifications,
              hasReachedMax: true,
            ));
          }
        }
      } else {
        print("Server ${(getNotifications as HelperResponse).response}");

        emit(NotificationErrorState(helperResponse: getNotifications));
      }
    });

    on<ChangeToLoadingNotificatiosApiEvent>((event, emit) async {
      emit(NotificationsInitial());

      add(GetNotificationApiEvent(

          notificationsSearchFilter: NotificationsSearchFilter(page: 1), userId: userId ));
    });
  }
}
