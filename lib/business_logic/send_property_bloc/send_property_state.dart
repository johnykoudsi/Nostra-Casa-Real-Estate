part of 'send_property_bloc.dart';

abstract class SendPropertyState extends Equatable {
  const SendPropertyState();
}

class SendPropertyInitial extends SendPropertyState {
  @override
  List<Object> get props => [];
}

class SendPropertyLoading extends SendPropertyState {
  @override
  List<Object> get props => [];
}

class SendPropertyStatus extends SendPropertyState {
  SendPropertyStatus({required this.helperResponse});

  HelperResponse helperResponse;

  @override
  List<Object> get props => [helperResponse];
}
