part of 'send_report_bloc.dart';

abstract class SendReportState extends Equatable {
  const SendReportState();
}

class SendReportInitial extends SendReportState {
  @override
  List<Object> get props => [];
}
class SendReportLoading extends SendReportState {
  @override
  List<Object> get props => [];
}
class SendReportStatues extends SendReportState {
  SendReportStatues({required this.response});
  HelperResponse response;

  @override
  List<Object> get props => [response];
}

