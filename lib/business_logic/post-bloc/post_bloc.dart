import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nostra_casa/business_logic/add_property_bloc/add_property_bloc.dart';
import 'package:nostra_casa/utility/network_helper.dart';

import '../../data/models/GetRequestModel.dart';

part 'post_event.dart';

part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<SendApiRequestEvent>((event, emit) async {
      emit(PostLoadingState());

      final addPropertyState = event.sendModel;
      //if (addPropertyState is AddPropertyState) {AddPropertyService()}

    });
  }
}
