import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import '../../../utility/app_assets.dart';

class MapsMarkers{

  static Uint8List? homeLocation, storeLocation, deliveryLocation;
  static initMarkers() async {

    homeLocation =
    await getBytesFromAsset(path: AppAssets.homeLocation, width: 100);

  }

  static Future<Uint8List> getBytesFromAsset({required String path, int? width}) async {
    ByteData data = await rootBundle.load(path);
    if(kIsWeb) return data.buffer.asUint8List();
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    ByteData? ddd = (await fi.image.toByteData(format: ui.ImageByteFormat.png));
    var sss = ddd!.buffer.asUint8List();
    return sss;
  }
}