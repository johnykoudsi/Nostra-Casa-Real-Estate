import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'my_property_action_event.dart';
part 'my_property_action_state.dart';

class MyPropertyActionBloc extends Bloc<MyPropertyActionEvent, MyPropertyActionState> {
  MyPropertyActionBloc() : super(MyPropertyActionInitial()) {
    on<MyPropertyActionEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
