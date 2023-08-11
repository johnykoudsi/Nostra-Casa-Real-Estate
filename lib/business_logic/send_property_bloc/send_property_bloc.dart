import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../utility/network_helper.dart';

part 'send_property_event.dart';
part 'send_property_state.dart';

class SendPropertyBloc extends Bloc<SendPropertyEvent, SendPropertyState> {
  SendPropertyBloc() : super(SendPropertyInitial()) {
    on<SendPropertyEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
