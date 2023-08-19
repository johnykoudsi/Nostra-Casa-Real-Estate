part of 'my_property_action_bloc.dart';

abstract class MyPropertyActionEvent extends Equatable {
  const MyPropertyActionEvent();
}
class DeletePropertyEvent extends MyPropertyActionEvent{


  DeletePropertyEvent({required this.propertyType,required this.propertyId});
  int propertyId;
  PropertyType propertyType;

  @override
  List<Object?> get props => [propertyType,propertyId];
}
class EditPropertyEvent extends MyPropertyActionEvent{


  EditPropertyEvent({required this.propertyType,required this.propertyId,required this.price});
  int propertyId;
  PropertyType propertyType;
  String price;
  Map<String, dynamic> toMapBody() {
    Map<String, String> map = {
      "price": price,
    };

    return map;
  }
  @override
  List<Object?> get props => [propertyType,propertyId,price];
}
