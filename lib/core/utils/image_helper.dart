import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:add_to_gallery/add_to_gallery.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image/image.dart';
import 'package:native_exif/native_exif.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sijantan/core/error/exception/custom_exception.dart';

class ImageHelper {
  const ImageHelper._();

  static Future<File> widgetToImageFile(
      RenderRepaintBoundary? repaintBoundary, LatLng latLng) async {
    ui.Image image = await repaintBoundary!.toImage(pixelRatio: 1);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();

    final fileName = DateTime.now().toString() + '.jpg';
    final directory = await getExternalStorageDirectory();
    final imagePath2 = File('${directory?.path}/$fileName');

    print('${directory?.path}/$fileName');

    final image2 = decodeImage(pngBytes)!;
    final resizeImg = copyResize(image2, width: 1024);

    imagePath2.writeAsBytesSync(encodeJpg(resizeImg));

    await writeLatLngExifData(imagePath2.path, latLng);

    final resultImage = await AddToGallery.addToGallery(
      originalFile: File('${directory?.path}/$fileName'),
      albumName: 'sijantan',
      deleteOriginalFile: true,
    );

    return resultImage;
  }

  static String getFileName(String path) {
    return path.split('/').last;
  }

  static Future<void> writeLatLngExifData(String path, LatLng latLng) async {
    Exif exif = await Exif.fromPath(path);
    await exif.writeAttribute('Make', 'sijantan');
    await exif.writeAttribute('GPSLatitudeRef', '${latLng.latitude}');
    await exif.writeAttribute('GPSLongitudeRef', '${latLng.longitude}');
    Map<String, dynamic>? attr = await exif.getAttributes();
    print('writeExifData');
    print(attr);
  }

  static getExifData(String path) async {
    Exif exif = await Exif.fromPath(path);
    Map<String, dynamic>? attr = await exif.getAttributes();
    print('getExifData');
    print(attr);
  }

  static Future<bool> isExifValid(String path) async {
    Exif exif = await Exif.fromPath(path);
    Map<String, dynamic>? attr = await exif.getAttributes();
    print('isLatLongExifExist');
    print((attr!.containsKey('Make') &&
        attr.containsKey('GPSLatitudeRef') &&
        attr.containsKey('GPSLongitudeRef')));

    if (attr == null) {
      return false;
    } else {
      if (attr.containsKey('Make') &&
          attr.containsKey('GPSLatitudeRef') &&
          attr.containsKey('GPSLongitudeRef')) {
        return attr['Make'] == 'sijantan';
      } else {
        return false;
      }
    }
  }

  static Future<LatLng> getLatLngFromImg(String path) async {
    Exif exif = await Exif.fromPath(path);
    Map<String, dynamic>? attr = await exif.getAttributes();
    if (attr == null) throw CustomException('Terjadi kesalahan pada gambar');
    return LatLng(double.parse(attr['GPSLatitudeRef']),
        double.parse(attr['GPSLongitudeRef']));
  }
}
