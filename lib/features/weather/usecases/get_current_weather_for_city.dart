import 'package:dartz/dartz.dart';
import 'package:weather_app/core/data/models/weather_info_response.dart';
import 'package:weather_app/core/errors/failures.dart';
import 'package:weather_app/core/usecases/usecase.dart';
import 'package:weather_app/features/weather/repositories/repository/weather_repository.dart';

abstract class GetCurrentWeatherForCity extends UseCase<WeatherInfoResponse, String> {}

class GetCurrentWeatherForCityImpl extends GetCurrentWeatherForCity {
  GetCurrentWeatherForCityImpl(this._repository);

  final WeatherRepository _repository;

  @override
  Future<Either<Failure, WeatherInfoResponse>> execute(String params) {
    return _repository.getCurrentWeatherForCity(params);
  }
}
