import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/core/data/models/weather_info_response.dart';
import 'package:weather_app/core/errors/failures.dart';
import 'package:weather_app/features/weather/repositories/repository/weather_repository.dart';
import 'package:weather_app/features/weather/usecases/get_current_weather_for_city.dart';

part 'search_location_weather_bloc.freezed.dart';

part 'search_location_weather_state.dart';

class SearchLocationWeatherBloc extends Cubit<SearchLocationWeatherState> {
  @visibleForTesting
  SearchLocationWeatherBloc(this._getCurrentWeatherForCity) : super(const SearchLocationWeatherState.initial());

  factory SearchLocationWeatherBloc.fromContext(BuildContext context) {
    return SearchLocationWeatherBloc(
      GetCurrentWeatherForCityImpl(
        context.read<WeatherRepository>(),
      ),
    );
  }

  final GetCurrentWeatherForCity _getCurrentWeatherForCity;

  Future<void> search(String location) async {
    emit(const SearchLocationWeatherState.loading());

    try {
      final Either<Failure, WeatherInfoResponse> eitherResults = await _getCurrentWeatherForCity.execute(location);
      eitherResults.fold(
            (Failure failure) => emit(SearchLocationWeatherState.failed(failure)),
            (WeatherInfoResponse weather) => emit(SearchLocationWeatherState.weather(weather)),
      );
    } catch (e) {
      emit(SearchLocationWeatherState.failed(ClientFailure(e)));
    }
  }

  void reset() {
    emit(const SearchLocationWeatherState.initial());
  }
}
