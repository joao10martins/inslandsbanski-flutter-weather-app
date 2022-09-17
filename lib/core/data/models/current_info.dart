import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/core/data/models/weather_condition.dart';

part 'current_info.g.dart';

@JsonSerializable()
class CurrentInfo {
  CurrentInfo({
    required this.temperatureCelsius,
    required this.feelsLikeCelsius,
    required this.condition,
    required this.windKPH,
    required this.windDirection,
    required this.precipitationMillimeters,
    required this.humidity,
  });

  factory CurrentInfo.fromJson(Map<String, dynamic> json) => _$CurrentInfoFromJson(json);

  @JsonKey(name: 'temp_c')
  double temperatureCelsius;
  @JsonKey(name: 'feelslike_c')
  double feelsLikeCelsius;
  WeatherCondition condition;
  @JsonKey(name: 'wind_kph')
  double windKPH;
  @JsonKey(name: 'wind_dir')
  String windDirection;
  @JsonKey(name: 'precip_mm')
  String precipitationMillimeters;
  int humidity;
}
