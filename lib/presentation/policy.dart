import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nostra_casa/data/models/contact_info_model.dart';
import 'package:nostra_casa/presentation/global_widgets/custom_check_box.dart';
import 'package:nostra_casa/presentation/global_widgets/custom_elevated_button.dart';
import 'package:nostra_casa/presentation/global_widgets/elevated_button_widget.dart';
import 'package:nostra_casa/utility/app_style.dart';
import 'package:nostra_casa/utility/enums.dart';

import '../../business_logic/get_bloc/get_bloc.dart';
import '../../utility/app_routes.dart';

class Policy extends StatefulWidget {
   Policy({super.key, required this.title});

  final String title;



  @override
  State<Policy> createState() => _PolicyState();
}
class _PolicyState extends State<Policy> {
  bool accept=false;

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
      create: (context) => GetBloc()..add(GetRequestApiEvent(getRequestType: GetRequestType.contactInfo)),

      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
           leading: Padding(
             padding:  EdgeInsets.only(top: screenHeight*0.02),
             child: Icon(Icons.arrow_back,size: 35,),
           ),
          ),

          body:Column(
            children: [
              Row(
                children: [
                  SizedBox(width: screenWidth*0.05,),
                  Text(widget.title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,fontFamily: "Cairo"),),
                ],
              ),
              SizedBox(height: screenHeight*0.1,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("you should only contact with the real estate owners in the available hours"),
              ),
              SizedBox(height: screenHeight*0.5,),
              Row(
                children: [
                  SizedBox(width: screenWidth*0.05,),
                  CustomCheckbox(isSelected:accept,iconSize: 20,size:25,color: Colors.grey, onTap: () {
                   changeAcceptance();
                  },),
                  SizedBox(width: screenWidth*0.02,),
                  Text("I agree to all terms",style: Theme.of(context)
                      .textTheme
                      .headline5!,),

                ],
              ),
              SizedBox(height: screenHeight*0.03,),
              Opacity(
                  opacity: accept ? 1 : 0.5,
                  child: CustomElevatedButton(color: AppStyle.darkBlueColor, title: 'Next', height: screenHeight*0.06, width: screenWidth*0.9, onPressed: (){})),
            ],
          ),
        ),
      ),
    );
  }
}
