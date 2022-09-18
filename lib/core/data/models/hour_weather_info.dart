import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/core/data/models/weather_condition.dart';

part 'hour_weather_info.g.dart';

@JsonSerializable()
class HourWeatherInfo {
  HourWeatherInfo({
    required this.dateTime,
    required this.dateTimeEpoch,
    required this.temperatureCelsius,
    required this.feelsLikeCelsius,
    required this.condition,
  });

  factory HourWeatherInfo.fromJson(Map<String, dynamic> json) => _$HourWeatherInfoFromJson(json);

  @JsonKey(name: 'time')
  String dateTime;
  @JsonKey(name: 'time_epoch')
  int dateTimeEpoch;
  @JsonKey(name: 'temp_c')
  double temperatureCelsius;
  @JsonKey(name: 'feelslike_c')
  double feelsLikeCelsius;
  WeatherCondition condition;
}
