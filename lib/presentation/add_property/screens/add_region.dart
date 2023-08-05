import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nostra_casa/business_logic/country_bloc/country_bloc.dart';
import '../../../business_logic/add_property_bloc/add_property_bloc.dart';
import '../../../utility/app_style.dart';
import '../../global_widgets/shimmer.dart';

class AddRegion extends StatefulWidget {
  const AddRegion({Key? key}) : super(key: key);

  @override
  State<AddRegion> createState() => _AddRegionState();
}

class _AddRegionState extends State<AddRegion> {
  String? selectedCity;
  @override
  Widget build(BuildContext context) {

    final addPropertyBloc = context.watch<AddPropertyBloc>();
    TextEditingController regionController = TextEditingController();
    if (addPropertyBloc.state.region != null) {
      regionController.text = addPropertyBloc.state.region!;
    }
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppStyle.kBackGroundColor,
      body: Padding(
        padding: EdgeInsets.only(
            left: screenWidth * 0.038,
            right: screenWidth * 0.038,
            top: screenHeight * 0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Please add your property country, state and city',
              style: Theme.of(context).textTheme.headline2,
            ),
            // Text(
            //   'if your city is not listed feel free to add it manually.',
            //   style: Theme.of(context)
            //       .textTheme
            //       .headline6!
            //       .copyWith(color: AppStyle.kGreyColor),
            // ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            Expanded(
              child: ListView(
                children: [
                  Text("Select City You Live In",
                  style: Theme.of(context).textTheme.headline5,
                  ),
                  const SizedBox(height: 10,),
                  BlocBuilder<CountryBloc, CountryState>(
                    builder: (context, state) {
                      if(state is CountryLoadingState){
                        return ShimmerLoader(
                          height: 50,
                          border: AppStyle.k4RadiusLowerPadding,
                        );
                      }
                      if(state is CountryDoneState){
                        List<String> cityList(){
                          List<String> stringCity = [];
                          for (var element in state.countryModel.cities) {
                            stringCity.add(element.name);
                          }
                          return stringCity;
                        }
                        return Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: AppStyle.k4RadiusLowerPadding
                          ),
                          child: DropdownSearch<String>(
                            popupProps:  const PopupProps.dialog(
                              showSearchBox: true,
                              showSelectedItems: true,
                            ),
                            items: cityList(),
                            selectedItem: selectedCity??cityList()[0],
                            onChanged: (value){
                              selectedCity = value;
                            },
                          ),
                        );
                      }
                      return  ShimmerLoader(
                        height: 50,
                      );
                    },
                  )
                  //  CSCPicker(
                  //    onCountryChanged: (value) {
                  //      setState(() {
                  //        countryValue = value;
                  //      });
                  //    },
                  //    onStateChanged:(value) {
                  //      setState(() {
                  //        stateValue = value;
                  //      });
                  //    },
                  //    onCityChanged:(value) {
                  //      setState(() {
                  //        cityValue = value;
                  //      });
                  //    },
                  //  ),
                  //  SizedBox(height: screenHeight*0.05,),
                  // CustomInsertText(
                  //   controller: regionController,hintText: "Damascus",additionalText: "here you can add more additional details about you property region",),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
