// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hour_weather_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HourWeatherInfo _$HourWeatherInfoFromJson(Map<String, dynamic> json) =>
    HourWeatherInfo(
      dateTime: json['time'] as String,
      temperatureCelsius: (json['temp_c'] as num).toDouble(),
      feelsLikeCelsius: (json['feelslike_c'] as num).toDouble(),
      condition:
          WeatherCondition.fromJson(json['condition'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HourWeatherInfoToJson(HourWeatherInfo instance) =>
    <String, dynamic>{
      'time': instance.dateTime,
      'temp_c': instance.temperatureCelsius,
      'feelslike_c': instance.feelsLikeCelsius,
      'condition': instance.condition,
    };
