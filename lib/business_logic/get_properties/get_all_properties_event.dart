part of 'get_all_properties_bloc.dart';

abstract class GetAllPropertiesEvent extends Equatable {
  const GetAllPropertiesEvent();
}

class GetAllPropertiesApiEvent extends GetAllPropertiesEvent{
  GetAllPropertiesApiEvent({required this.searchFilterProperties});

  GetAllPropertiesSearchFilter searchFilterProperties;

  @override
  List<Object?> get props => [searchFilterProperties];
}

class ChangeToLoadingApiEvent extends GetAllPropertiesEvent{
  ChangeToLoadingApiEvent(
      { this.searchFilterProperties});

  GetAllPropertiesSearchFilter? searchFilterProperties;

  @override
  List<Object?> get props => [searchFilterProperties];
}
