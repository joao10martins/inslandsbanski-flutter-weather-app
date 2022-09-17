// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_weather_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DayWeatherInfo _$DayWeatherInfoFromJson(Map<String, dynamic> json) =>
    DayWeatherInfo(
      maxTemperatureCelsius: (json['maxtemp_c'] as num).toDouble(),
      minTemperatureCelsius: (json['mintemp_c'] as num).toDouble(),
      avgTemperatureCelsius: (json['avgtemp_c'] as num).toDouble(),
      avgHumidity: json['avghumidity'] as int,
      condition:
          WeatherCondition.fromJson(json['condition'] as Map<String, dynamic>),
      maxWindKPH: (json['maxwind_kph'] as num).toDouble(),
      dailyWillItRain: json['daily_will_it_rain'] as int,
      dailyChanceOfRain: json['daily_chance_of_rain'] as int,
    );

Map<String, dynamic> _$DayWeatherInfoToJson(DayWeatherInfo instance) =>
    <String, dynamic>{
      'maxtemp_c': instance.maxTemperatureCelsius,
      'mintemp_c': instance.minTemperatureCelsius,
      'avgtemp_c': instance.avgTemperatureCelsius,
      'avghumidity': instance.avgHumidity,
      'condition': instance.condition,
      'maxwind_kph': instance.maxWindKPH,
      'daily_will_it_rain': instance.dailyWillItRain,
      'daily_chance_of_rain': instance.dailyChanceOfRain,
    };
