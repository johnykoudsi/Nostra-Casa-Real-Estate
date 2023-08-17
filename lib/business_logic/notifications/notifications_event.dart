part of 'notifications_bloc.dart';

abstract class NotificationsEvent  {

}
class GetNotificationApiEvent extends NotificationsEvent {
  GetNotificationApiEvent({required this.userId,required this.notificationsSearchFilter});

  int userId;
  NotificationsSearchFilter notificationsSearchFilter;

  @override
  List<Object?> get props => [userId,notificationsSearchFilter];
}

class ChangeToLoadingNotificatiosApiEvent extends NotificationsEvent {
  ChangeToLoadingNotificatiosApiEvent(
      { this.userId});

  String? userId;

  @override
  List<Object?> get props => [userId];
}