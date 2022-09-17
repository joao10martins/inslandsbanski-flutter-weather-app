// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyForecast _$DailyForecastFromJson(Map<String, dynamic> json) =>
    DailyForecast(
      date: json['date'] as String,
      day: DayWeatherInfo.fromJson(json['day'] as Map<String, dynamic>),
      hourInfoList: (json['hour'] as List<dynamic>)
          .map((e) => HourWeatherInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DailyForecastToJson(DailyForecast instance) =>
    <String, dynamic>{
      'date': instance.date,
      'day': instance.day,
      'hour': instance.hourInfoList,
    };
