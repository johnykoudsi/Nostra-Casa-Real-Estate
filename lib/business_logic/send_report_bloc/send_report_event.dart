part of 'send_report_bloc.dart';

abstract class SendReportEvent extends Equatable {
  const SendReportEvent();
}
class SendReportRequest extends SendReportEvent{
  int userId;
  String reason;
  ReportCategory reportCategory;

  SendReportRequest({required this.reportCategory,required this.reason, required this.userId});

  Map<String,dynamic> toJson() =>{
    "reported_user_id":userId,
    "report_category_id":reportCategory.id,
    "description":reason
  };
  @override
  List<Object?> get props => [reportCategory,reason,userId];
}
