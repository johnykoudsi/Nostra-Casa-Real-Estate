import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nostra_casa/presentation/explore/explore.dart';
import 'package:nostra_casa/presentation/more/more_screen.dart';
import '../../../business_logic/get_nearby_properties/get_nearby_properties_bloc.dart';
import '../../add_property/welcome_step.dart';
import '../../map_screen/map_screen.dart';


class GetSelectedScreenByIndex extends StatelessWidget {
  const GetSelectedScreenByIndex({required this.screenIndex, Key? key})
      : super(key: key);
  final int screenIndex;

  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context) {
          if (screenIndex == 0) {
            return const Explore();
          }
          if (screenIndex == 1) {
            return BlocProvider(
              create: (context) => GetNearbyPropertiesBloc(),
              child: const MapScreen(),
            );
          }
          if (screenIndex == 2) {
            return const WelcomeStep();
          }
          if (screenIndex == 4) {
            return const MoreScreen();
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