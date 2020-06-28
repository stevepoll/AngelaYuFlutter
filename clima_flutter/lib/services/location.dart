import 'package:geolocator/geolocator.dart';

class Location {
  double lat = 1;
  double lon = 2;

  void getCurrentLocation() async {
    Position pos = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    print('inside then');
    lat = pos.latitude;
    lon = pos.longitude;
    print(lat);
    print(lon);
  }
}
