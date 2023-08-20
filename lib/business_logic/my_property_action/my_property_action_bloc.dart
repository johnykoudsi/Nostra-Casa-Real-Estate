import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nostra_casa/data/models/properties_model.dart';
import 'package:nostra_casa/utility/enums.dart';

import '../../data/services/property_action_service.dart';
import '../../utility/network_helper.dart';

part 'my_property_action_event.dart';
part 'my_property_action_state.dart';

class MyPropertyActionBloc
    extends Bloc<MyPropertyActionEvent, MyPropertyActionState> {
  MyPropertyActionBloc() : super(MyPropertyActionInitial()) {
    on<DeletePropertyEvent>((event, emit) async {
      emit(MyPropertyActionLoading());

      final response =
          await PropertyActionService.deletePropertyService(event: event);

      emit(MyPropertyActionStatus(helperResponse: response));
    });
    on<EditPropertyEvent>((event, emit) async {
      emit(MyPropertyActionLoading());

      final response =
      await PropertyActionService.editPropertyService(event: event);

      emit(MyPropertyActionStatus(helperResponse: response));
    });

    on<ChangePropertyStatusEvent>((event, emit) async {
      emit(MyPropertyActionLoading());

      final response =
      await PropertyActionService.editPropertyStatusService(event: event);

      emit(MyPropertyActionStatus(helperResponse: response));
    });
  }
}
