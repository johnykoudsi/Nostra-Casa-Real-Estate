import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nostra_casa/business_logic/add_property_bloc/add_property_bloc.dart';
import 'package:nostra_casa/utility/app_style.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../global_widgets/elevated_button_widget.dart';

class GoogleMapsScreen extends StatefulWidget {
  const GoogleMapsScreen({Key? key}) : super(key: key);
  @override
  State<GoogleMapsScreen> createState() => _GoogleMapsScreenState();
}

class _GoogleMapsScreenState extends State<GoogleMapsScreen> {
  static CameraPosition _defaultLocation =
      const CameraPosition(target: LatLng(33.513914, 36.276143), zoom: 15);
  Completer<GoogleMapController> completer = Completer();
  late GoogleMapController _googleMapController;
  final Set<Marker> _markers = {};
  LatLng? _selectedLocation;

  @override
  void initState() {
    askPermission();

    final addPropertyBloc = context.read<AddPropertyBloc>().state;

    if (addPropertyBloc.selectedLocation != null) {
      _defaultLocation = CameraPosition(target: addPropertyBloc.selectedLocation!, zoom: 15);
      _selectedLocation = addPropertyBloc.selectedLocation;
      _markers.add(
        Marker(
          markerId: const MarkerId("0"),
          position: addPropertyBloc.selectedLocation!,
          infoWindow: const InfoWindow(
            title: "Location",
          ),
          icon: BitmapDescriptor.defaultMarker,
          onDrag: (location) => addMarker(location: location, isInit: true),
        ),
      );
    }

    super.initState();
  }

  Future<void> askPermission() async {
    await [
      Permission.location,
    ].request();
  }

  void addMarker({required LatLng location, bool isInit = false}) async {
    _googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: location,
          zoom: await (_googleMapController.getZoomLevel()),
        ),
      ),
    );
    if (!isInit) {
      setState(() {
        _markers.add(
          Marker(
            markerId: const MarkerId("0"),
            position: location,
            infoWindow: const InfoWindow(
              title: "Your Location",
            ),
            icon: BitmapDescriptor.defaultMarker,
            onDrag: (location) => addMarker(location: location),
          ),
        );
        _selectedLocation = location;
      });
    }
    final state = context.read<AddPropertyBloc>();
    state.add(SelectLocationEvent(latLng: _selectedLocation!));
  }

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
      print("ERROR$error");
    });
    return await Geolocator.getCurrentPosition();
  }

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double getWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getWidth * 0.038),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Where\'s your place locates?',
                  style: Theme.of(context).textTheme.headline2,
                ),
                Text(
                  'Your address is only shared with clients after they\'ve made an account',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: AppStyle.kGreyColor),
                ),
                SizedBox(
                  height: getWidth * 0.05,
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                GoogleMap(
                  mapType: MapType.normal,
                  myLocationButtonEnabled: true,
                  myLocationEnabled: true,
                  onMapCreated: (GoogleMapController controller) {
                    if (_markers.isNotEmpty) {
                      controller.showMarkerInfoWindow(const MarkerId("0"));
                    }
                    completer.complete(controller);
                    _googleMapController = controller;
                  },
                  onTap: (LatLng location) {
                    addMarker(location: location);
                    _googleMapController
                        .showMarkerInfoWindow(const MarkerId("0"));
                  },
                  markers: _markers,
                  zoomControlsEnabled: false,
                  initialCameraPosition: _defaultLocation,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: FloatingActionButton(
          onPressed: () async {
            getUserCurrentLocation().then((value) async {
              addMarker(location: LatLng(value.latitude, value.longitude));
              _googleMapController.showMarkerInfoWindow(const MarkerId("0"));
            });
          },
          backgroundColor: AppStyle.mainColor,
          child: const Icon(Icons.location_on),
        ),
      ),
    );
  }
}
