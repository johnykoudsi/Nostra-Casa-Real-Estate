import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nostra_casa/business_logic/add_property_bloc/add_property_bloc.dart';
import 'package:nostra_casa/business_logic/amenity_bloc/amenity_bloc.dart';

import '../../../data/models/amenities_model.dart';
import '../../../utility/app_assets.dart';
import '../../../utility/app_style.dart';

class CustomAmenityGrid extends StatefulWidget {
  const CustomAmenityGrid(
      {Key? key, required this.svgPaths, required this.title})
      : super(key: key);
  final List<String> svgPaths;
  final List<String> title;
  @override
  State<CustomAmenityGrid> createState() => _CustomAmenityGridState();
}

class _CustomAmenityGridState extends State<CustomAmenityGrid> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AmenityBloc, AmenityState>(
      builder: (context, state) {
        if (state is AmenityLoadedState) {
          return GridView.builder(
              itemCount: state.amenities.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1.6,
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemBuilder: (BuildContext context, int index) {
                return AmenityItemWidget(
                  amenity: state.amenities[index],
                );
              });
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

class AmenityItemWidget extends StatelessWidget {
  AmenityItemWidget({required this.amenity, Key? key}) : super(key: key);
  Amenity amenity;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        context
            .read<AddPropertyBloc>()
            .add(OnAmenityItemPressEvent(amenity: amenity));
      },
      child: BlocBuilder<AddPropertyBloc, AddPropertyState>(
        builder: (context, state) {
          return Container(
              decoration: BoxDecoration(
                color: state.selectedAmenity.contains(amenity)
                    ? AppStyle.kGreyColor
                    : AppStyle.kBackGroundColor,
                border: Border.all(
                  color: state.selectedAmenity.contains(amenity)
                      ? AppStyle.blackColor
                      : AppStyle.kGreyColor,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    left: screenWidth * 0.03, right: screenWidth * 0.03,top: screenWidth*0.01),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SvgPicture.asset(
                        AppAssets.tv,
                        width: screenWidth * 0.07,
                        height: screenHeight * 0.045,
                      ),
                    ),

                    Expanded(
                      child: Text(
                        amenity.name,
                        style: Theme.of(context).textTheme.headline5,
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ));
        },
      ),
    );
  }
}
