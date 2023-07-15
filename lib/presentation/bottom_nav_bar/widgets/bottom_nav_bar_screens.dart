
import 'package:flutter/material.dart';
import 'package:nostra_casa/presentation/add_property/add_property_home.dart';
import 'package:nostra_casa/utility/app_style.dart';
import '../../map_screen/map_screen.dart';
import '../../policy.dart';


class GetSelectedScreenByIndex extends StatelessWidget {
  const GetSelectedScreenByIndex({required this.screenIndex,Key? key}) : super(key: key);
  final int screenIndex ;

  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context) {
          if(screenIndex == 0){
            return Policy(title: 'From nav bar',);
          }
          if(screenIndex == 1){
            return const MapScreen();
          }
          if(screenIndex == 2){
            return const AddPropertyHome();
          }
          return const Scaffold(
            body: Center(
              child: Text(
                'Check Named Route',
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
            ),
          );
        }
    );
  }
}