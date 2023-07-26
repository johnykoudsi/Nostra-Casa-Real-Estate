part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();
}
class SendApiRequestEvent extends PostEvent{

  SendApiRequestEvent({required this.sendModel});
  GetRequestModel sendModel;
  @override
  List<Object?> get props => [sendModel];
}