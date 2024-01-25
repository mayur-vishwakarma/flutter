import 'package:geolocator/geolocator.dart';

class Location {
  double? lat;
  double? long;

  Future<void> getCurrentLocation() async {
    try {
      await Geolocator.isLocationServiceEnabled();
      await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      lat = position.latitude;
      long = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
