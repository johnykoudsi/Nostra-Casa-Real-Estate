part of 'rate_property_bloc.dart';

abstract class RatePropertyEvent extends Equatable {
  const RatePropertyEvent();
}
class RatePropertyApiEvent extends RatePropertyEvent{

  RatePropertyApiEvent({ this.review, required this.rate,required this.propertyId});
  int propertyId;
  String? review;
  String rate;

  Map<String, dynamic> toJson() {
    final json = {
      "rate": rate.toString(),
      "review": review.toString(),
    };
    json.removeWhere((key, value) => value==null||value ==""||value.isEmpty||value=="null");
    return json;
  }

  @override
  List<Object?> get props => [rate,review,propertyId];

}