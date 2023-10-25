import 'package:geolocator/geolocator.dart';

class Location {
  double? lon;
  double? lat;


  //Выдает координаты места где находиться виртуальный телефон: офис гугла в Америке. Все работает корректно.
  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      lat = position.latitude;
      lon = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
