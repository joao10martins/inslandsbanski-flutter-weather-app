import 'package:dartz/dartz.dart';
import 'package:weather_app/core/data/models/weather_info_response.dart';
import 'package:weather_app/core/errors/failures.dart';
import 'package:weather_app/core/usecases/usecase.dart';
import 'package:weather_app/features/weather/repositories/repository/weather_repository.dart';

abstract class GetDailyForecastForCity extends UseCase<WeatherInfoResponse, String> {}

class GetDailyForecastForCityImpl extends GetDailyForecastForCity {
  GetDailyForecastForCityImpl(this._repository);

  final WeatherRepository _repository;

  @override
  Future<Either<Failure, WeatherInfoResponse>> execute(String params) {
    return _repository.getDailyForecastForCity(params, numberOfDays: 2);
  }
}
