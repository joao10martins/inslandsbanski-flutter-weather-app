import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/core/data/models/daily_forecast.dart';
import 'package:weather_app/core/data/models/day_weather_info.dart';
import 'package:weather_app/core/data/models/forecast_info.dart';
import 'package:weather_app/core/data/models/hour_weather_info.dart';
import 'package:weather_app/core/data/models/weather_info_response.dart';
import 'package:weather_app/core/errors/failures.dart';
import 'package:weather_app/core/extensions/either_extensions.dart';
import 'package:weather_app/features/weather/repositories/repository/weather_repository.dart';
import 'package:weather_app/features/weather/usecases/get_daily_forecast_for_city.dart';

part 'forecast_bloc.freezed.dart';

part 'forecast_state.dart';

class ForecastBloc extends Cubit<ForecastState> {
  @visibleForTesting
  ForecastBloc(this._getDailyForecastForCity)
      : super(const ForecastState.initial());

  factory ForecastBloc.fromContext(BuildContext context) {
    return ForecastBloc(
      GetDailyForecastForCityImpl(
        context.read<WeatherRepository>(),
      ),
    );
  }

  final GetDailyForecastForCity _getDailyForecastForCity;

  Future<void> load(String location) async {
    emit(const ForecastState.loading());

    try {
      final Either<Failure, WeatherInfoResponse> eitherResults = await _getDailyForecastForCity.execute(location);

      // Now that we've got the today & tomorrow weather information we want to get the following 12-hour and show it, so we have to work the logic here.
      final currentDateEpoch = eitherResults.rightOrNull()?.current.lastUpdatedEpoch;
      final todayForecast = eitherResults.rightOrNull()?.forecast?.forecastDayList[0];
      final tomorrowForecast = eitherResults.rightOrNull()?.forecast?.forecastDayList[1];
      // The next 12-hour forecast could start today and end tomorrow(meaning if today is 20:00 we will need to eventually start look at the hours from the next day in order to correctly get a 12-hour forecast)
      // So we need to create a list will contain all the hours(today & tomorrow) to calculate the next 12 hours.
      var hoursList = List<HourWeatherInfo>.empty(growable: true);
      if (todayForecast != null && todayForecast.hourInfoList.isNotEmpty)
        hoursList.addAll(todayForecast.hourInfoList);
      if (tomorrowForecast != null && tomorrowForecast.hourInfoList.isNotEmpty)
        hoursList.addAll(tomorrowForecast.hourInfoList);
      // Now we need to check the current weather date and hour to calculate the next 12-hours.
      // To do that, we need to find the first hour next to the current hour in the list.
      final nextHourIndex = hoursList.indexWhere((hour) => hour.dateTimeEpoch > currentDateEpoch!);
      // Now that we've found our nextHour index in the list, all we need to do is make a list with the correct data!
      var next12HoursList = List<HourWeatherInfo>.empty(growable: true);
      final currentWeather = eitherResults.rightOrNull()?.current;
      if (currentWeather != null) { // Adding the first element of the list(current weather)
        next12HoursList.add(
          HourWeatherInfo(
            dateTime: currentWeather.lastUpdated,
            dateTimeEpoch: currentWeather.lastUpdatedEpoch,
            temperatureCelsius: currentWeather.temperatureCelsius,
            feelsLikeCelsius: currentWeather.feelsLikeCelsius,
            condition: currentWeather.condition,
          ),
        );
      }
      next12HoursList.addAll(hoursList.getRange(nextHourIndex, nextHourIndex + 12));


      eitherResults.fold(
        (Failure failure) => emit(ForecastState.failed(failure)),
        (WeatherInfoResponse forecast) => emit(ForecastState.forecast(next12HoursList, eitherResults.rightOrNull()?.forecast?.forecastDayList)),
      );
    } catch (e) {
      emit(ForecastState.failed(ClientFailure(e)));
    }
  }
}
