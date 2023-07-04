import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nostra_casa/presentation/global_widgets/custom_check_box.dart';
import 'package:nostra_casa/utility/app_style.dart';
import 'package:nostra_casa/utility/enums.dart';
import '../../business_logic/get_bloc/get_bloc.dart';
import 'global_widgets/elevated_button_widget.dart';

class Policy extends StatefulWidget {
  Policy({super.key, required this.title});

  final String title;

  @override
  State<Policy> createState() => _PolicyState();
}

class _PolicyState extends State<Policy> {
  bool? accept = false;

  void changeAcceptance() {
    setState(() {
      accept = !accept!;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return BlocProvider(
      create: (context) => GetBloc()
        ..add(GetRequestApiEvent(getRequestType: GetRequestType.contactInfo)),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title:Text(
              widget.title,
              style: const TextStyle(
                fontWeight: AppFontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
          body: ListView(
            padding: EdgeInsets.all(screenWidth * 0.038),
            children: [

              Text(
                  "you should only contact with the rea"
                      "l estate owners in the available hours you should only contact with the "
                      "real estate owners in the available hours",
                style: Theme.of(context).textTheme.headline6,
              ),

            ],
          ),
          bottomSheet: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomCheckbox(
                  value: accept,
                  onChange: (accept) {
                    changeAcceptance();
                  },
                  text: "I agree"
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.038),
                child: ElevatedButtonWidget(
                    //color: AppStyle.darkBlueColor,
                    title: 'Next',
                    onPressed: accept!
                        ? () {
                            Navigator.pushNamed(context, "/signup");
                          }
                        : null),
              ),
              SizedBox(
                height: screenWidth * 0.038,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
