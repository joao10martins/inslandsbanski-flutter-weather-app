import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/core/data/models/daily_forecast.dart';

part 'forecast_info.g.dart';

@JsonSerializable()
class ForecastInfo {
  ForecastInfo({
    required this.forecastDayList,
  });

  factory ForecastInfo.fromJson(Map<String, dynamic> json) => _$ForecastInfoFromJson(json);

  @JsonKey(name: 'forecastday')
  List<DailyForecast> forecastDayList;
}
