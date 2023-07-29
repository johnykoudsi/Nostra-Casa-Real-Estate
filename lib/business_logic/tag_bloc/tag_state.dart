part of 'tag_bloc.dart';

abstract class TagState {}

class TagInitial extends TagState {}

class TagLoadedState extends TagState {
  List<Tag> tags;
  bool hasReachedMax;

  TagLoadedState(
      {this.tags = const <Tag>[],
        required this.hasReachedMax});

  TagLoadedState copyWith({
    List<Tag>? tags,
    bool? hasReachedMax,
  }) {
    return TagLoadedState(
      tags: tags ?? this.tags,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object?> get props => [tags, hasReachedMax];
}

class TagErrorState extends TagState {
  TagErrorState({required this.helperResponse});

  HelperResponse helperResponse;

  @override
  List<Object> get props => [helperResponse];
}
