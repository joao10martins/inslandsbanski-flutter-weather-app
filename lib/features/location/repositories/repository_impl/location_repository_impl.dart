import 'package:geolocator/geolocator.dart';
import 'package:weather_app/features/location/repositories/repository/location_repository.dart';

class LocationRepositoryImpl extends LocationRepository {
  @override
  Future<Position> getCurrentPosition() {
    return Geolocator.getCurrentPosition();
  }

  @override
  Future<bool> isLocationServiceEnabled() {
    return Geolocator.isLocationServiceEnabled();
  }

  @override
  Future<LocationPermission> requestPermission() {
    return Geolocator.requestPermission();
  }

  @override
  Future<LocationPermission> checkPermission() {
    return Geolocator.checkPermission();
  }
}
