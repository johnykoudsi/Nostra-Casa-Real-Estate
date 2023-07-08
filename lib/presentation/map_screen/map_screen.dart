import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nostra_casa/presentation/map_screen/widgets/markers.dart';

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
    Marker(
      markerId: const MarkerId('from'),
      position: const LatLng(33.513914, 36.276143),
      icon: BitmapDescriptor.fromBytes(MapsMarkers.homeLocation!),
    ),
  };

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    LatLng latLng = const LatLng(33.5139, 36.2773);

    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _defaultLocation,
        zoomGesturesEnabled: true,
        zoomControlsEnabled: true,
        tiltGesturesEnabled:false,
        buildingsEnabled: false,
        mapType: MapType.normal,
        myLocationButtonEnabled: true,
        onCameraMove: (position){

          //todo : get only visible estates inside boundaries
          _googleMapController.getVisibleRegion().then((value) => print(value));
        },
        myLocationEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          completer.complete(controller);
          _googleMapController = controller;
        },
        markers: _markers,
      ),
    );
  }
}
