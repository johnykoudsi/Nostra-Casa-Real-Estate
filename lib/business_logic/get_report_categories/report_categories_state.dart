part of 'report_categories_bloc.dart';

abstract class ReportCategoriesState extends Equatable {
  const ReportCategoriesState();
}

class ReportCategoryLoadingState extends ReportCategoriesState {
  @override
  List<Object> get props => [];
}

class ReportCategoryDoneState extends ReportCategoriesState {
  ReportCategoryDoneState({required this.reportCategory});

  List<ReportCategory> reportCategory;

  @override
  List<Object> get props => [reportCategory];
}

class ReportCategoryErrorState extends ReportCategoriesState {
  ReportCategoryErrorState({required this.helperResponse});
  HelperResponse helperResponse;

  @override
  List<Object> get props =>
      [helperResponse.servicesResponse, helperResponse.response];
}