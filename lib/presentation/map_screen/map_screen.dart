import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nostra_casa/presentation/global_widgets/dialogs_widgets/dialogs_snackBar.dart';
import 'package:nostra_casa/presentation/global_widgets/dialogs_widgets/dialogs_yes_no.dart';
import 'package:nostra_casa/presentation/map_screen/widgets/markers.dart';
import 'package:nostra_casa/presentation/map_screen/widgets/propertyType_filter_widget.dart';
import 'package:nostra_casa/utility/app_style.dart';
import '../../business_logic/get_nearby_properties/get_nearby_properties_bloc.dart';
import '../../data/models/properties_model.dart';
import '../../utility/enums.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const CameraPosition _defaultLocation =
      CameraPosition(target: LatLng(33.513914, 36.276143), zoom: 15);

  Completer<GoogleMapController> completer = Completer();
  late GoogleMapController _googleMapController;
  final Set<Marker> _markers = {};

  PropertyType selectedFilterPropertyType = PropertyType.all;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  Future<LatLng> getCenter() async {
    LatLngBounds visibleRegion = await _googleMapController.getVisibleRegion();
    LatLng centerLatLng = LatLng(
      (visibleRegion.northeast.latitude + visibleRegion.southwest.latitude) / 2,
      (visibleRegion.northeast.longitude + visibleRegion.southwest.longitude) /
          2,
    );
    return centerLatLng;
  }

  void addMarkersFromPropertiesList(List<Property> prop) {
    for (var property in prop) {
      if (_markers.every((mark) => mark.position != property.location)) {
        setState(() {
          _markers.add(Marker(
            markerId: MarkerId(property.id.toString()),
            position: property.location,
            icon: BitmapDescriptor.fromBytes(MapsMarkers.homeLocation!),
          ));
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GetNearbyPropertiesBloc, GetNearbyPropertiesState>(
      listener: (context, state) {
        if (state is GetNearbyPropertiesDoneState) {
          addMarkersFromPropertiesList(state.properties);
        }
        if (state is GetNearbyPropertiesErrorState) {
          DialogsWidgetsSnackBar.showSnackBarFromStatus(
              context: context, helperResponse: state.helperResponse);
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: _defaultLocation,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: true,
              buildingsEnabled: false,
              mapType: MapType.normal,
              myLocationButtonEnabled: true,
              minMaxZoomPreference: const MinMaxZoomPreference(10, 15),
              onCameraIdle: () {
                getCenter().then(
                  (value) => context.read<GetNearbyPropertiesBloc>().add(
                        GetNearbyMapsEvent(
                            center: value,
                            propertyType: selectedFilterPropertyType),
                      ),
                );
              },
              myLocationEnabled: true,
              onMapCreated: (GoogleMapController controller) {
                completer.complete(controller);
                _googleMapController = controller;
                getCenter().then(
                  (value) => context.read<GetNearbyPropertiesBloc>().add(
                      GetNearbyMapsEvent(
                          center: value,
                          propertyType: selectedFilterPropertyType)),
                );
              },
              markers: _markers,
            ),
            PropertyTypeFilterWidget(
              selectedFilter: selectedFilterPropertyType,
              onChange: (PropertyType propertyType) {
                setState(() {
                  _markers.clear();
                  selectedFilterPropertyType = propertyType;
                  getCenter().then(
                    (value) => context.read<GetNearbyPropertiesBloc>().add(
                          GetNearbyMapsEvent(
                            propertyType: selectedFilterPropertyType,
                            center: value,
                          ),
                        ),
                  );
                });
              },
            ),
            BlocBuilder<GetNearbyPropertiesBloc, GetNearbyPropertiesState>(
              builder: (context, state) {
                if (state is GetLoadingState) {
                  return Center(
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: AppStyle.k15BorderRadius),
                      padding: const EdgeInsets.all(25),
                      child: const CircularProgressIndicator(),
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
