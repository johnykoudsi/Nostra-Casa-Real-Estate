import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nostra_casa/business_logic/send_property_bloc/send_property_bloc.dart';
import 'package:nostra_casa/presentation/global_widgets/dialogs_widgets/dialogs_snackBar.dart';
import '../../business_logic/add_property_bloc/add_property_bloc.dart';
import '../global_widgets/elevated_button_widget.dart';
import '../view_property/view_property.dart';

class ReviewProperty extends StatelessWidget {
  const ReviewProperty({required this.addPropertyState, Key? key})
      : super(key: key);

  final AddPropertyState? addPropertyState;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SendPropertyBloc, SendPropertyState>(
      listener: (context, state) {
        if (state is SendPropertyStatus) {
          DialogsWidgetsSnackBar.showSnackBarFromStatus(
              context: context, helperResponse: state.helperResponse,showServerError: true);
        }
      },
      child: Scaffold(
        body: const ViewProperty(),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
          child: BlocBuilder<SendPropertyBloc, SendPropertyState>(
            builder: (context, state) {
              return ElevatedButtonWidget(
                title: "Add",
                isLoading: state is SendPropertyLoading,
                onPressed: () {
                  context.read<SendPropertyBloc>().add(SendPropertyApiEvent(
                      addPropertyState: addPropertyState!));
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
