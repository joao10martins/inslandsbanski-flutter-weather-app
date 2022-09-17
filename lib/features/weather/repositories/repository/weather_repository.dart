import 'package:dartz/dartz.dart';
import 'package:weather_app/core/data/models/weather_info_response.dart';
import 'package:weather_app/core/errors/failures.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherInfoResponse>> getCurrentWeatherForPosition({
    required double lat,
    required double lon,
  });
}
