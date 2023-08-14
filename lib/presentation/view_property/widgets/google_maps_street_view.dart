import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

class StreetViewPanoramaInitDemo extends StatefulWidget {
  const StreetViewPanoramaInitDemo({required this.initial,super.key});
  final LatLng initial;

  @override
  State<StreetViewPanoramaInitDemo> createState() => _StreetViewPanoramaInitDemoState();
}

class _StreetViewPanoramaInitDemoState extends State<StreetViewPanoramaInitDemo> {
  late final WebViewController controller;

  @override
  void initState() {
    String googleUrl = "https://maps.googleapis.com/maps/api/streetview"
        "?size=400x400&location=${widget.initial.latitude},${widget.initial.longitude}"
   "&fov=80&heading=70&pitch=0&key=AIzaSyDXSQxYFZ1CmEOcUUvXwkX30-9OMIlI-7I";
    controller = WebViewController()
      ..loadRequest(
        Uri.parse(googleUrl),
      );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Street View Init Demo'),
      ),
      body: SafeArea(
        child: WebViewWidget(
          controller: controller,
        ),
      ),
    );
  }
}