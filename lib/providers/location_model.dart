import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationModel with ChangeNotifier{
  Position _location;

  Position get currentLocation{
    return _location;
  }

  set currentLocation(Position position) {
    _location = position;
    notifyListeners();
  }

}
