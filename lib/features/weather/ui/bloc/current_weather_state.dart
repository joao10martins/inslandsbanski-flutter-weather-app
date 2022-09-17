part of 'current_weather_bloc.dart';

@freezed
class CurrentWeatherState with _$CurrentWeatherState {
  const factory CurrentWeatherState.initial() = _Initial;

  const factory CurrentWeatherState.loading() = _Loading;

  const factory CurrentWeatherState.weather(WeatherInfoResponse weather) = _WeatherInformation;

  const factory CurrentWeatherState.failed(Failure failure) = _Failed;
}
