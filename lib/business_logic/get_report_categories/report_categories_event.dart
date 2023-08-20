part of 'report_categories_bloc.dart';

abstract class ReportCategoriesEvent extends Equatable {
  const ReportCategoriesEvent();
}
class GetReportCategoryEvent extends ReportCategoriesEvent{
  @override
  List<Object?> get props => [];

}
