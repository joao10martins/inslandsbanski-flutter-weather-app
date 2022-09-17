import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/core/data/models/weather_condition.dart';

part 'day_weather_info.g.dart';

@JsonSerializable()
class DayWeatherInfo {
  DayWeatherInfo({
    required this.maxTemperatureCelsius,
    required this.minTemperatureCelsius,
    required this.avgTemperatureCelsius,
    required this.avgHumidity,
    required this.condition,
    required this.maxWindKPH,
    required this.dailyWillItRain,
    required this.dailyChanceOfRain,
  });

  factory DayWeatherInfo.fromJson(Map<String, dynamic> json) => _$DayWeatherInfoFromJson(json);


  @JsonKey(name: 'maxtemp_c')
  double maxTemperatureCelsius;
  @JsonKey(name: 'mintemp_c')
  double minTemperatureCelsius;
  @JsonKey(name: 'avgtemp_c')
  double avgTemperatureCelsius;
  @JsonKey(name: 'avghumidity')
  int avgHumidity;
  WeatherCondition condition;
  @JsonKey(name: 'maxwind_kph')
  double maxWindKPH;
  @JsonKey(name: 'daily_will_it_rain')
  int dailyWillItRain;
  @JsonKey(name: 'daily_chance_of_rain')
  int dailyChanceOfRain;
}
