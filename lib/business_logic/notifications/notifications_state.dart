part of 'notifications_bloc.dart';

abstract class NotificationsState {

}

class NotificationsInitial extends NotificationsState {
}
class NotificationLoadedState extends NotificationsState {
  List<UserNotification> notifications;
  bool hasReachedMax;

  NotificationLoadedState(
      {this.notifications = const <UserNotification>[],
        required this.hasReachedMax});

  NotificationLoadedState copyWith({
    List<UserNotification>? notifications,
    bool? hasReachedMax,
  }) {
    return NotificationLoadedState(
      notifications: notifications ?? this.notifications,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object?> get props => [notifications, hasReachedMax];
}

class NotificationErrorState extends NotificationsState {
  NotificationErrorState({required this.helperResponse});

  HelperResponse helperResponse;

  @override
  List<Object> get props => [helperResponse];
}