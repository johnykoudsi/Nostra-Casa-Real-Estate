part of 'send_property_bloc.dart';

abstract class SendPropertyEvent extends Equatable {
  const SendPropertyEvent();
}

class SendPropertyApiEvent extends SendPropertyEvent{

  SendPropertyApiEvent({required this.addPropertyState});

  AddPropertyState addPropertyState;
  @override
  List<Object?> get props => [addPropertyState];

}
