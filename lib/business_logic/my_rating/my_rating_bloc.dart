import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nostra_casa/data/services/my_rating_service.dart';

import '../../utility/network_helper.dart';

part 'my_rating_event.dart';
part 'my_rating_state.dart';

class MyRatingBloc extends Bloc<MyRatingEvent, MyRatingState> {
  MyRatingBloc() : super(MyRatingInitial()) {
    on<GetMyRatingApiEvent>((event, emit) async {
      emit(MyRatingLoading());

      final response =
      await MyRatingService.getMyRating(event: event);
      if(response is bool){
  emit(MyRatingDone(isRated: response));
}else{
  emit(MyRatingErrorStatus(helperResponse: response));
}

    });
  }
}
