import 'package:geocoding/geocoding.dart' as geo;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';
import 'package:sijantan/core/error/exception/custom_exception.dart';
import 'package:sijantan/core/utils/const.dart';

class ImageExifData {
  LatLng latLng;
  String? address;

  ImageExifData({required this.latLng, this.address});
}

abstract class UserLocationData {
  Future<LocationData> getUserLocation();

  Future<ImageExifData> getUserPositionAddress(LatLng? latLng);

  Future<List<geo.Location>> getLocationFromAddress(String address);

  Future initUserLocation();
}

@LazySingleton(as: UserLocationData)
class UserLocationDataImpl implements UserLocationData {
  final Location location;

  UserLocationDataImpl({required this.location});

  Future initUserLocation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted != PermissionStatus.granted) return;

    if (_permissionGranted == PermissionStatus.denied) if (_permissionGranted ==
        PermissionStatus.deniedForever) {
      _serviceEnabled = await location.requestService();
    }
  }

  @override
  Future<LocationData> getUserLocation() async {
    initUserLocation();
    try {
      return await location.getLocation();
    } catch (exc) {
      throw CustomException(ExpMsg.locationExp, innerException: exc);
    }
  }

  @override
  Future<ImageExifData> getUserPositionAddress(LatLng? latLng) async {
    LocationData userLocation;
    if (latLng == null) {
      userLocation = await getUserLocation();
    } else {
      userLocation = LocationData.fromMap(
          {'latitude': latLng.latitude, 'longitude': latLng.longitude});
    }
    final String lat = userLocation.latitude!.toStringAsFixed(5);
    final String long = userLocation.longitude!.toStringAsFixed(5);
    try {
      List<geo.Placemark> placemarks = await geo.placemarkFromCoordinates(
          userLocation.latitude!, userLocation.longitude!);

      final location = placemarks[0];
      final dataToReturn = ImageExifData(
          latLng: LatLng(userLocation.latitude!, userLocation.longitude!),
          address:
              '${location.street},\n${location.subLocality},${location.locality}');
      return dataToReturn;
    } catch (e) {
      return ImageExifData(
        latLng: LatLng(userLocation.latitude!, userLocation.longitude!),
      );
    }
  }

  @override
  Future<List<geo.Location>> getLocationFromAddress(String address) async {
    List<geo.Location> locations = await geo.locationFromAddress(address);

    locations.forEach((element) async {
      List<geo.Placemark> placemarks = await geo.placemarkFromCoordinates(
          element.latitude, element.longitude);
      final location = placemarks[0];
      print(
          '${location.street},\n${location.subLocality},${location.locality}');
    });

    print('getLocationFromAddress');
    print(locations.length);
    return locations;
  }
}
