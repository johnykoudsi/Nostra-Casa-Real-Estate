import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nostra_casa/data/models/report_categories.dart';
import 'package:nostra_casa/data/services/report_services.dart';

import '../../utility/network_helper.dart';

part 'report_categories_event.dart';
part 'report_categories_state.dart';

class ReportCategoriesBloc
    extends Bloc<ReportCategoriesEvent, ReportCategoriesState> {
  ReportCategoriesBloc() : super(ReportCategoryLoadingState()) {
    on<GetReportCategoryEvent>((event, emit) async {
      emit(ReportCategoryLoadingState());

      var getRequest =
          await ReportServices.getReportCategoriesService(event: event);

      // casting and emit
      if (getRequest is List<ReportCategory>) {
        emit(ReportCategoryDoneState(reportCategory: getRequest));
      } else {
        emit(ReportCategoryErrorState(helperResponse: getRequest));
      }
    });
  }
}
