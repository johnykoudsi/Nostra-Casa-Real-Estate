
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nostra_casa/data/services/promotion_status_service.dart';
import '../../utility/network_helper.dart';

part 'agency_promotion_status_event.dart';
part 'agency_promotion_status_state.dart';

class AgencyPromotionStatusBloc extends Bloc<AgencyPromotionStatusEvent, AgencyPromotionStatusState> {
  AgencyPromotionStatusBloc() : super(AgencyPromotionStatusLoadingState()) {
    on<GetPromotionStatusEvent>((event, emit) async {
      emit(AgencyPromotionStatusLoadingState());

      var getRequest = await PromotionStatusService.getPromotionStatus(event: event);

      // casting and emit
      if (getRequest is String) {
        emit(AgencyPromotionStatusDoneState(status: getRequest));
      }else{
        emit(AgencyPromotionStatusErrorState(
            helperResponse: getRequest
        ));
      }

    });
  }
}
