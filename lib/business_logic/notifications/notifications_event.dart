part of 'notifications_bloc.dart';

abstract class NotificationsEvent {}

class GetNotificationApiEvent extends NotificationsEvent {
  GetNotificationApiEvent(
      {required this.notificationsSearchFilter});

  NotificationsSearchFilter notificationsSearchFilter;

  @override
  List<Object?> get props => [ notificationsSearchFilter];
}

class ChangeToLoadingNotificatiosApiEvent extends NotificationsEvent {
  ChangeToLoadingNotificatiosApiEvent({this.notificationsSearchFilter});

  NotificationsSearchFilter? notificationsSearchFilter;

  @override
  List<Object?> get props => [notificationsSearchFilter];
}
