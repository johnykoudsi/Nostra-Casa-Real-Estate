import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nostra_casa/data/models/contact_info_model.dart';
import 'package:nostra_casa/utility/enums.dart';

import '../../business_logic/get_bloc/get_bloc.dart';
import '../../utility/app_routes.dart';


class Welcome extends StatefulWidget {
  const Welcome({super.key, required this.title});

  final String title;


  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return BlocProvider(
      create: (context) => GetBloc()..add(GetRequestApiEvent(getRequestType: GetRequestType.contactInfo)),

      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [

              Opacity(
                opacity: 0.7,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/home.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            Padding(
                padding:  EdgeInsets.only(left: screenWidth*0.1,top: screenHeight*0.2),
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushNamed(AppRoutes.policy);
                  },
                  child: Text('Welcome to Nostra Casa',style: TextStyle(color: Colors.black87,fontSize: 50,fontWeight: FontWeight.bold,
                    fontFamily: "Cairo",),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
