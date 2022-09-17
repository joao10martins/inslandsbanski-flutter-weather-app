import 'package:dartz/dartz.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/data/models/weather_info_response.dart';
import 'package:weather_app/core/errors/failures.dart';
import 'package:weather_app/core/usecases/usecase.dart';
import 'package:weather_app/features/weather/repositories/repository/weather_repository.dart';

abstract class GetCurrentWeatherForPosition extends UseCase<WeatherInfoResponse, Position> {}

class GetCurrentWeatherForPositionImpl extends GetCurrentWeatherForPosition {
  GetCurrentWeatherForPositionImpl(this._repository);

  final WeatherRepository _repository;

  @override
  Future<Either<Failure, WeatherInfoResponse>> execute(Position position) {
    return _repository.getCurrentWeatherForPosition(
      lat: position.latitude,
      lon: position.longitude,
    );
  }
}
