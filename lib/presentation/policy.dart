import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nostra_casa/presentation/global_widgets/custom_check_box.dart';
import 'package:nostra_casa/presentation/global_widgets/custom_elevated_button.dart';
import 'package:nostra_casa/utility/app_style.dart';
import 'package:nostra_casa/utility/enums.dart';
import '../../business_logic/get_bloc/get_bloc.dart';

class Policy extends StatefulWidget {
  Policy({super.key, required this.title});

  final String title;

  @override
  State<Policy> createState() => _PolicyState();
}

class _PolicyState extends State<Policy> {
  bool accept = false;

  void changeAcceptance() {
    setState(() {
      accept = !accept;

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
          appBar: AppBar(),
          body: Padding(
            padding: EdgeInsets.fromLTRB(screenWidth * 0.038, 0,
                screenWidth * 0.038, screenWidth * 0.038
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                          fontWeight: AppFontWeight.bold,
                          fontSize: 22,
                          fontFamily: "Cairo"),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.1,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                      "you should only contact with the real estate owners in the available hours"),
                ),
                SizedBox(
                  height: screenHeight * 0.5,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(screenWidth * 0.038, 0,
                      screenWidth * 0.038, screenWidth * 0.038
                  ),
                  child: Row(
                    children: [
                      CustomCheckbox(
                        isSelected: accept,
                        iconSize: 20,
                        size: 25,
                        color: Colors.grey,
                        onTap: () {
                          changeAcceptance();
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.038,right: screenWidth * 0.038),
                        child: Text(
                          "I agree to all terms",
                          style: Theme.of(context).textTheme.headline5!,
                        ),
                      ),
                    ],
                  ),
                ),
                 CustomElevatedButton(
                  color: AppStyle.darkBlueColor,
                  title: 'Next',
                  onPressed: accept ? (){Navigator.pushNamed(context, "/signup");} : null
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
