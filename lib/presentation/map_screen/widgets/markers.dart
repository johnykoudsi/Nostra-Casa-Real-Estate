import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:nostra_casa/utility/enums.dart';

import '../../../utility/app_assets.dart';

class MapsMarkers{

  static Uint8List? homeLocation, shopLocation, barnLocation;

  static Uint8List? getMarkerFromPropertyType(PropertyType propertyType){
    if(propertyType == PropertyType.commercial){
      return shopLocation;
    }
    if(propertyType == PropertyType.agricultural){
      return barnLocation;
    }
    return homeLocation;
  }
  static initMarkers() async {

    homeLocation =
    await getBytesFromAsset(path: AppAssets.homeLocation, width: 115);
    shopLocation =
    await getBytesFromAsset(path: AppAssets.shopLocation, width: 115);
    barnLocation =
    await getBytesFromAsset(path: AppAssets.barnLocation, width: 115);

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