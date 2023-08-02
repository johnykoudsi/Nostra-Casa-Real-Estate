part of 'post_bloc.dart';

abstract class PostState extends Equatable {
  const PostState();
}

class PostInitial extends PostState {
  @override
  List<Object> get props => [];
}

class PostLoadingState extends PostState {
  @override
  List<Object> get props => [];
}

class PostDoneState extends PostState {
  @override
  List<Object> get props => [];
}

class PostResponseStatues extends PostState {
  PostResponseStatues({required this.helperResponse});
  HelperResponse helperResponse;
  @override
  List<Object> get props => [helperResponse];
}
