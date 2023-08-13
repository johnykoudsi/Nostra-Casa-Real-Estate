import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:nostra_casa/data/models/properties_model.dart';
import 'package:nostra_casa/utility/enums.dart';

import '../../utility/app_style.dart';
import '../map_screen/widgets/markers.dart';

class MapLocationSquareWidget extends StatefulWidget {
  MapLocationSquareWidget({required this.propertyType,required this.latLng,Key? key}) : super(key: key);

  LatLng latLng;
  PropertyType propertyType;
  @override
  State<MapLocationSquareWidget> createState() => _MapLocationSquareWidgetState();
}

class _MapLocationSquareWidgetState extends State<MapLocationSquareWidget> {
  GoogleMapController? googleMapController;

  @override
  void dispose() {
    googleMapController?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                icon: BitmapDescriptor.fromBytes(
                    MapsMarkers.getMarkerFromPropertyType(widget.propertyType)!),
                position: widget.latLng,
              )
            },
            initialCameraPosition: CameraPosition(
              target: widget.latLng,
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
    );
  }
}
