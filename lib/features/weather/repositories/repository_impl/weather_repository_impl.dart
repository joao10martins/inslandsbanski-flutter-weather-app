import 'package:dartz/dartz.dart';
import 'package:weather_app/core/data/api/api_client.dart';
import 'package:weather_app/core/data/models/weather_info_response.dart';
import 'package:weather_app/core/errors/failures.dart';
import 'package:weather_app/features/weather/repositories/repository/weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  WeatherRepositoryImpl(this._apiClient, {required this.appId});

  final ApiClient _apiClient;
  final String appId;

  @override
  Future<Either<Failure, WeatherInfoResponse>> getCurrentWeatherForCity(
      String cityName,
      ) async {
    try {
      final responseBody = await _apiClient.get('current.json', params: {
        'key': appId,
        'q': cityName,
        'aqi': 'no',
      });

      return Right(WeatherInfoResponse.fromJson(responseBody));
    } on Failure catch (failure) {
      return Left(failure);
    } catch (e) {
      return Left(ClientFailure(e));
    }
  }

  @override
  Future<Either<Failure, WeatherInfoResponse>> getCurrentWeatherForPosition({
    required double lat,
    required double lon,
  }) async {
    try {
      final responseBody = await _apiClient.get('current.json', params: {
        'key': appId,
        'q': '$lat, $lon',
        'aqi': 'no',
      });

      return Right(WeatherInfoResponse.fromJson(responseBody));
    } on Failure catch (failure) {
      return Left(failure);
    } catch (e) {
      return Left(ClientFailure(e));
    }
  }

  @override
  Future<Either<Failure, WeatherInfoResponse>> getDailyForecastForCity(
      String cityName, {
        int numberOfDays = 2,
      }) async {
    try {
      final responseBody = await _apiClient.get('forecast.json', params: {
        'key': appId,
        'q': cityName,
        'days': numberOfDays,
        'aqi': 'no',
        'alerts': 'no',
      });

      return Right(WeatherInfoResponse.fromJson(responseBody));
    } on Failure catch (failure) {
      return Left(failure);
    } catch (e) {
      return Left(ClientFailure(e));
    }
  }
}
