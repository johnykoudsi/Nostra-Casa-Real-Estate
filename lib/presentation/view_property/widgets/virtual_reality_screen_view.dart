import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VirtualRealityScreen extends StatefulWidget {
  const VirtualRealityScreen({super.key});

  @override
  State<VirtualRealityScreen> createState() => _VirtualRealityScreenState();
}

class _VirtualRealityScreenState extends State<VirtualRealityScreen> {
  late final WebViewController controller;

  @override
  void initState() {
    List<String> vrLink = [
      "https://my.matterport.com/show/?m=tLhGBrqCHXT",
      "https://my.matterport.com/show/?m=DGtbqvoWrFH"
    ];
    var num = Random().nextInt(vrLink.length);
    controller = WebViewController()
      ..loadRequest(
        Uri.parse(vrLink[num]),
      );
    controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    //
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Street View'),
      ),
      body: SafeArea(
        child: WebViewWidget(
          controller: controller,

        ),
      ),
    );
  }
}