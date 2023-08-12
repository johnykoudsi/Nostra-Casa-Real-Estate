import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nostra_casa/business_logic/google_maps/google_maps_bloc.dart';
import 'package:nostra_casa/presentation/global_widgets/elevated_button_widget.dart';
import 'package:nostra_casa/presentation/promote_to_agency/widgets/files_list.dart';
import 'package:nostra_casa/utility/app_routes.dart';
import '../../utility/app_style.dart';
import '../add_property/widgets/custom_elevated_button.dart';
import '../global_widgets/custom_text_field.dart';

class PromoteToAgency extends StatefulWidget {
  const PromoteToAgency({Key? key}) : super(key: key);

  @override
  State<PromoteToAgency> createState() => _PromoteToAgencyState();
}

class _PromoteToAgencyState extends State<PromoteToAgency> {

  List<File> files = [];

  GoogleMapController? googleMapController;

  TextEditingController promotionRequestController = TextEditingController();

  void _chooseFiles() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);
    setState(() {
      if (result != null) {
        files = result.paths.map((path) => File(path!)).toList();
      } else {}
    });
  }

  void _removeFile(File image) {
    setState(() {
      files.remove(image);
    });
  }

  bool isInfoCompleted() {
    //final googleMapState = context.rea<GoogleMapsBloc>().state;
    if ( files.isNotEmpty) {
      return true;
    }
    return false;
  }

  static final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  void dispose() {
    context.read<GoogleMapsBloc>().close();
    googleMapController?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppStyle.kBackGroundColor,
      appBar: AppBar(
        backgroundColor: AppStyle.blackColor,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: AppStyle.kBackGroundColor,
          ),
        ),
        title: Text(
          "Promote To Agency".tr(),
          style: Theme.of(context)
              .textTheme
              .headline4!
              .copyWith(color: AppStyle.kBackGroundColor),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
            left: screenWidth * 0.038,
            right: screenWidth * 0.038,
            top: screenWidth * 0.038,
            bottom: screenWidth * 0.038),
        child: Form(
          key: _key,
          child: ListView(
            children: [
              CustomTextField(
                hintText: "reason for promotion request".tr(),
                passwordBool: false,
                label: "Application Request".tr(),
                controller: promotionRequestController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Name can not be empty".tr();
                  }
                  return null;
                },
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              CustomElevatedButton(
                  backgroundColor: Colors.white,
                  onPress: _chooseFiles,
                  title: "Add your agency files".tr(),
                  iconData: Icons.add),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Visibility(
                visible: files.isEmpty ? false : true,
                child: SizedBox(
                  width: screenWidth,
                  height: screenHeight * 0.3,
                  child: FilesList(
                    files: files,
                    onImageRemoved: _removeFile,
                  ),
                ),
              ),
              BlocBuilder<GoogleMapsBloc, GoogleMapsState>(
                builder: (context, state) {
                  if (state is GoogleMapsPinSelected) {
                    return Stack(
                      children: [
                        SizedBox(
                          height: 150,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: AppStyle.kGreyColor),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: GoogleMap(
                                onMapCreated: (mapController) =>
                                googleMapController = mapController,
                                markers: {
                                  Marker(
                                    markerId:
                                    const MarkerId('location'),
                                    position: state.latLng,
                                  )
                                },
                                initialCameraPosition: CameraPosition(
                                  target: state.latLng,
                                  zoom: 15,
                                ),
                                zoomControlsEnabled: false,
                                scrollGesturesEnabled: false,
                                compassEnabled: false,
                                zoomGesturesEnabled: false,
                                rotateGesturesEnabled: false,
                                trafficEnabled: false,
                                mapToolbarEnabled: false,
                                tiltGesturesEnabled: false,
                                indoorViewEnabled: false,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap:() {
                            Navigator.of(context).pushNamed(AppRoutes.addAgencyLocation);
                          },
                          child: Container(
                            height: 150,
                            width: screenWidth,
                            color: Colors.white10,
                          ),
                        )
                      ],
                    );
                  }
                  return CustomElevatedButton(
                      backgroundColor: Colors.white,
                      onPress: () {
                        Navigator.of(context).pushNamed(AppRoutes.addAgencyLocation);
                      },
                      title: "Add your agency location".tr(),
                      iconData: Icons.map_outlined);
                },
              ),

            ],
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.038, vertical: screenHeight * 0.038),
        child: ElevatedButtonWidget(
          title: "Request Promotion".tr(),
          //isLoading: state is PromoteToAgencyLoadingState,
          onPressed: isInfoCompleted()
              ? () {
                  if (_key.currentState!.validate()) {
                    //todo add event here
                  }
                }
              : null,
        ),
      ),
    );
  }
}
