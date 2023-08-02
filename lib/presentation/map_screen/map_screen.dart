import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nostra_casa/business_logic/get_bloc/get_bloc.dart';
import 'package:nostra_casa/presentation/map_screen/widgets/markers.dart';
import 'package:nostra_casa/utility/app_style.dart';

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
  final Set<Marker> _markers = {
    // Marker(
    //   markerId: const MarkerId('from'),
    //   position: const LatLng(33.513914, 36.276143),
    //   icon: BitmapDescriptor.fromBytes(MapsMarkers.homeLocation!),
    // ),
  };

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
    print(centerLatLng);
    return centerLatLng;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GetBloc, GetState>(
      listener: (context, state) {
        if (state is GetPropertiesState) {
          print("Markers length ${_markers.length}");
          state.properties.forEach((property) {
            if (_markers.every((mark) => mark.position != property.location)) {
              setState(() {
                _markers.add(Marker(
                  markerId: MarkerId(property.id.toString()),
                  position: property.location,
                  icon: BitmapDescriptor.fromBytes(MapsMarkers.homeLocation!),
                ));
              });
            }
          });
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: _defaultLocation,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: true,
              //tiltGesturesEnabled: false,
              buildingsEnabled: false,

              mapType: MapType.normal,
              myLocationButtonEnabled: true,
              minMaxZoomPreference: const MinMaxZoomPreference(10, 15),
              // onCameraMove: (position) {
              //   //todo : get only visible estates inside boundaries
              // },
              onCameraIdle: () {
                getCenter().then(
                      (value) =>
                      context.read<GetBloc>().add(
                        GetNearbyMapsEvent(center: value),
                      ),
                );
              },
              myLocationEnabled: true,
              onMapCreated: (GoogleMapController controller) {
                completer.complete(controller);
                _googleMapController = controller;
                getCenter().then(
                      (value) =>
                      context.read<GetBloc>().add(
                        GetNearbyMapsEvent(center: value),
                      ),
                );
              },
              markers: _markers,
            ),
            BlocBuilder<GetBloc, GetState>(
              builder: (context, state) {
                if(state is GetLoadingState){
                  return Center(
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: AppStyle.k15BorderRadius
                      ),
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
