import 'package:geolocator/geolocator.dart';

class LocationModel {
  Position location;

  set currentLocation(Position position) {
    location = position;
  }

}
