part of 'search_location_weather_bloc.dart';

@freezed
class SearchLocationWeatherState with _$SearchLocationWeatherState {
  const factory SearchLocationWeatherState.initial() = _Initial;

  const factory SearchLocationWeatherState.loading() = _Loading;

  const factory SearchLocationWeatherState.weather(WeatherInfoResponse weather) = _WeatherInformation;

  const factory SearchLocationWeatherState.failed(Failure failure) = _Failed;
}
