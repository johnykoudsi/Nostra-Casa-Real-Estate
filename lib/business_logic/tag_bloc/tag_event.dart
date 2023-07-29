part of 'tag_bloc.dart';

abstract class TagEvent {}

class GetTagApiEvent extends TagEvent {
  GetTagApiEvent({required this.searchFilterProperties});

  TagsSearchFilter searchFilterProperties;

  @override
  List<Object?> get props => [searchFilterProperties];
}

class ChangeToLoadingTagApiEvent extends TagEvent {
  ChangeToLoadingTagApiEvent(
      { this.searchFilterProperties});

  TagsSearchFilter? searchFilterProperties;

  @override
  List<Object?> get props => [searchFilterProperties];
}
