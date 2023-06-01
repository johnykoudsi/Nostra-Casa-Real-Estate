part of 'get_bloc.dart';

abstract class GetEvent extends Equatable {
  const GetEvent();
}
class GetRequestApiEvent extends GetEvent {

  GetRequestApiEvent({required this.getRequestType});
  GetRequestType getRequestType;

  @override
  List<Object?> get props => [getRequestType];
}
