import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nostra_casa/business_logic/country_bloc/country_bloc.dart';
import 'package:nostra_casa/data/models/country_and_city_model.dart';
import '../../../business_logic/add_property_bloc/add_property_bloc.dart';
import '../../../utility/app_style.dart';
import '../../global_widgets/shimmer.dart';

class AddRegion extends StatefulWidget {
  const AddRegion({Key? key}) : super(key: key);

  @override
  State<AddRegion> createState() => _AddRegionState();
}

class _AddRegionState extends State<AddRegion> {
  String? selectedCountry;
  @override
  void initState() {
    CountryModel? selectedCountryBloc = context.read<AddPropertyBloc>().state.countryModel;
    if(selectedCountryBloc != null){
      setState((){
        selectedCountry = selectedCountryBloc.name;
      });
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
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
            SizedBox(
              height: screenHeight * 0.03,
            ),
            Expanded(
              child: ListView(
                children: [
                  Text(
                    "Select Country You Live In",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BlocBuilder<CountryBloc, CountryState>(
                    builder: (context, state) {
                      if (state is CountryDoneState) {
                        List<String> countryList() {
                          List<String> stringCity = [];
                          for (var element in state.countryModel) {
                            stringCity.add(element.name);
                          }
                          return stringCity;
                        }

                        return Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: AppStyle.k4RadiusLowerPadding),
                          child: DropdownSearch<String>(
                            popupProps: const PopupProps.dialog(
                              showSearchBox: true,
                              showSelectedItems: true,
                            ),
                            items: countryList(),
                            selectedItem: selectedCountry,
                            onChanged: (value) {
                              setState(() {
                                selectedCountry = value;
                                context.read<AddPropertyBloc>().add(
                                    SelectCountryRegionEvent(
                                      countryModel: state.getCountryFromName(selectedCountry),
                                      city: null,
                                    ));
                              });
                            },
                          ),
                        );
                      }
                      return ShimmerLoader(
                        height: 50,
                        border: AppStyle.k4RadiusLowerPadding,
                      );
                    },
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  if (selectedCountry != null)
                    Text(
                      "Select City You Live In",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  const SizedBox(
                    height: 10,
                  ),
                  BlocBuilder<CountryBloc, CountryState>(
                    builder: (context, state) {
                      if (state is CountryDoneState &&
                          selectedCountry != null) {
                        List<String> cityList() {
                          List<String> stringCity = [];
                          for (var element in state
                              .getCityByCountryName(selectedCountry ?? '')) {stringCity.add(element.name);
                          }
                          return stringCity;
                        }

                        return Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: AppStyle.k4RadiusLowerPadding),
                          child: BlocBuilder<AddPropertyBloc, AddPropertyState>(
                            builder: (context, propertyState) {
                              return DropdownSearch<String>(
                                popupProps: const PopupProps.dialog(
                                  showSearchBox: true,
                                  showSelectedItems: true,
                                ),
                                items: cityList(),
                                selectedItem: propertyState.city?.name,
                                onChanged: (value) {
                                  context.read<AddPropertyBloc>().add(
                                      SelectCountryRegionEvent(
                                        countryModel: state.getCountryFromName(selectedCountry),
                                        city: state.getCityFromName(name: value, countryName: selectedCountry),
                                      ));
                                },
                              );
                            },
                          ),
                        );
                      }
                      if (state is CountryLoadingState) {
                        return ShimmerLoader(
                          height: 50,
                          border: AppStyle.k4RadiusLowerPadding,
                        );
                      }
                      return const SizedBox();
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
