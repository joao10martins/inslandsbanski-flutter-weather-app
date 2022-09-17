import 'package:geolocator/geolocator.dart';

abstract class LocationRepository {
  Future<LocationPermission> checkPermission();
  Future<LocationPermission> requestPermission();
  Future<bool> isLocationServiceEnabled();
  Future<Position> getCurrentPosition();
}
