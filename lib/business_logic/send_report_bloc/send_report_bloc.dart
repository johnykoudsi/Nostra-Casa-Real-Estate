import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nostra_casa/data/models/report_categories.dart';
import 'package:nostra_casa/data/services/report_services.dart';
import 'package:nostra_casa/utility/network_helper.dart';

part 'send_report_event.dart';
part 'send_report_state.dart';

class SendReportBloc extends Bloc<SendReportEvent, SendReportState> {
  SendReportBloc() : super(SendReportInitial()) {
    on<SendReportRequest>((event, emit) async {
      emit(SendReportLoading());

      HelperResponse helperResponse = await ReportServices.sendReportService(event);

      emit(SendReportStatues(response: helperResponse));
    });
  }
}
