import 'package:dartz/dartz.dart';
import 'package:weather_app/core/data/models/weather_info_response.dart';
import 'package:weather_app/core/errors/failures.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherInfoResponse>> getCurrentWeatherForCity(
    String cityName,
  );

  Future<Either<Failure, WeatherInfoResponse>> getCurrentWeatherForPosition({
    required double lat,
    required double lon,
  });

  Future<Either<Failure, WeatherInfoResponse>> getDailyForecastForCity(
    String cityName, {
    int numberOfDays = 2,
  });
}
