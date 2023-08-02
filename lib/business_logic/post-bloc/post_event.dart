part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();
}
class SendApiRequestEvent extends PostEvent{

  SendApiRequestEvent({required this.sendModel,required this.editId});

  GetRequestModel sendModel;
  int? editId;

  @override
  List<Object?> get props => [sendModel,editId];
}