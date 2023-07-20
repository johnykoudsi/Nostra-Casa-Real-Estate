import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../business_logic/add_property_bloc/add_property_bloc.dart';
import '../../../utility/app_assets.dart';
import '../../../utility/app_style.dart';

class ServicesList extends StatefulWidget {
  const ServicesList({Key? key}) : super(key: key);

  @override
  State<ServicesList> createState() => _ServicesListState();
}

class _ServicesListState extends State<ServicesList> {
  final List<String> svgPaths = [
    AppAssets.sale,
    AppAssets.rent,
    AppAssets.holiday
  ];
  final List<String> title = ["Sale".tr(), "Rent".tr(), "Holiday".tr()];
  final List<String> description = [
    "Refers to the transfer of property ownership from one party to another.".tr(),
    "Refers to the payment made by a tenant to a landlord in exchange for the use of a property.".tr(),
    "Refers to properties that are intended for short-term vacation or leisure use.".tr()
  ];
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return GridView.builder(
        itemCount: 3,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 3,
          crossAxisCount: 1,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              context.read<AddPropertyBloc>().add(SelectServiceTypeEvent(
                  propertyService: PropertyService.values[index]));
            },
            child: BlocBuilder<AddPropertyBloc, AddPropertyState>(
              builder: (context, state) {
                return Container(
                    decoration: BoxDecoration(
                      color: state.propertyService ==
                              PropertyService.values[index]
                          ? AppStyle.kGreyColor
                          : AppStyle.kBackGroundColor,
                      border: Border.all(
                        color: state.propertyService ==
                                PropertyService.values[index]
                            ? AppStyle.blackColor
                            : AppStyle.kGreyColor,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: screenWidth * 0.05, right: screenWidth * 0.05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                title[index],
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4!
                                    .copyWith(
                                      fontSize: 18,
                                    ),
                              ),
                              SizedBox(
                                width: screenWidth * 0.5,
                                child: Text(
                                  description[index],
                                  maxLines: 3,
                                ),
                              ),
                            ],
                          ),
                          SvgPicture.asset(
                            svgPaths[index],
                            width: screenWidth * 0.1,
                            height: screenHeight * 0.05,
                          ),
                        ],
                      ),
                    ));
              },
            ),
          );
        });
  }
}
