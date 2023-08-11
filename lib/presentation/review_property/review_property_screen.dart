import 'package:flutter/material.dart';
import '../../business_logic/add_property_bloc/add_property_bloc.dart';
import '../global_widgets/elevated_button_widget.dart';
import '../view_property/view_property.dart';

class ReviewProperty extends StatelessWidget {
  const ReviewProperty({required this.addPropertyState,Key? key}) : super(key: key);

  final AddPropertyState? addPropertyState;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const ViewProperty(),
      bottomNavigationBar:Padding(
        padding:
        const EdgeInsets.symmetric(horizontal: 18,vertical: 18),
        child: ElevatedButtonWidget(
          title: "Add",
          onPressed: (){

          },
        ),
      ),
    );
  }
}
