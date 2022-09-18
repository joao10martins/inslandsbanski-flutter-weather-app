part of 'forecast_bloc.dart';

@freezed
class ForecastState with _$ForecastState {
  const factory ForecastState.initial() = _Initial;

  const factory ForecastState.loading() = _Loading;

  const factory ForecastState.forecast(List<HourWeatherInfo> hoursForecast, List<DailyForecast>? daysForecast) = _ForecastInfo;

  const factory ForecastState.failed(Failure failure) = _Failed;
}
