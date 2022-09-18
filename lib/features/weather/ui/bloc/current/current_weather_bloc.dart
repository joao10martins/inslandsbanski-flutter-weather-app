import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/data/models/weather_info_response.dart';
import 'package:weather_app/core/errors/failures.dart';
import 'package:weather_app/features/weather/repositories/repository/weather_repository.dart';
import 'package:weather_app/features/weather/usecases/get_current_weather_for_position.dart';

part 'current_weather_bloc.freezed.dart';

part 'current_weather_state.dart';

class CurrentWeatherBloc extends Cubit<CurrentWeatherState> {
  @visibleForTesting
  CurrentWeatherBloc(this._getCurrentWeatherForPosition) : super(const CurrentWeatherState.initial());

  factory CurrentWeatherBloc.fromContext(BuildContext context) {
    return CurrentWeatherBloc(
      GetCurrentWeatherForPositionImpl(
        context.read<WeatherRepository>(),
      ),
    );
  }

  final GetCurrentWeatherForPosition _getCurrentWeatherForPosition;

  Future<void> load(Position position) async {
    emit(const CurrentWeatherState.loading());

    try {
      final Either<Failure, WeatherInfoResponse> eitherResults =
      await _getCurrentWeatherForPosition.execute(position);
      eitherResults.fold(
            (Failure failure) => emit(CurrentWeatherState.failed(failure)),
            (WeatherInfoResponse weather) => emit(CurrentWeatherState.weather(weather)),
      );
    } catch (e) {
      emit(CurrentWeatherState.failed(ClientFailure(e)));
    }
  }
}
