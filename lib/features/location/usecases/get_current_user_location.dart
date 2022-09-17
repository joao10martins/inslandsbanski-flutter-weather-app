import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/errors/failures.dart';
import 'package:weather_app/core/usecases/usecase.dart';
import 'package:weather_app/features/location/repositories/repository/location_repository.dart';
import 'package:weather_app/features/location/entities/location_failures.dart';


abstract class GetCurrentUserLocation extends UseCase<Position, NoParams> {}

class GetCurrentUserLocationImpl extends GetCurrentUserLocation {
  GetCurrentUserLocationImpl(this.locationRepository);

  final LocationRepository locationRepository;

  @override
  Future<Either<Failure, Position>> execute(NoParams params) async {
    final bool isLocationServiceEnabled = await locationRepository.isLocationServiceEnabled();
    if (!isLocationServiceEnabled) {
      return Left(LocationServiceDisabledFailure());
    }

    LocationPermission permission = await locationRepository.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await locationRepository.requestPermission();
      if (permission == LocationPermission.denied) {
        return Left(PermissionDeniedFailure());
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Left(PermissionDeniedFailure());
    }

    return locationRepository.getCurrentPosition().then(
          (value) => Right(value),
      onError: (e) => Left(ClientFailure(e)),
    );
  }
}
