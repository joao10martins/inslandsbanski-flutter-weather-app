import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/core/data/models/day_weather_info.dart';
import 'package:weather_app/core/data/models/hour_weather_info.dart';

part 'daily_forecast.g.dart';

@JsonSerializable()
class DailyForecast {
  DailyForecast({
    required this.date,
    required this.day,
    required this.hourInfoList,
  });

  factory DailyForecast.fromJson(Map<String, dynamic> json) => _$DailyForecastFromJson(json);

  String date;
  DayWeatherInfo day;
  @JsonKey(name: 'hour')
  List<HourWeatherInfo> hourInfoList;
}
