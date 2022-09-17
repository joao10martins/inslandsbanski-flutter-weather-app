// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastInfo _$ForecastInfoFromJson(Map<String, dynamic> json) => ForecastInfo(
      forecastDayList: (json['forecastday'] as List<dynamic>)
          .map((e) => DailyForecast.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ForecastInfoToJson(ForecastInfo instance) =>
    <String, dynamic>{
      'forecastday': instance.forecastDayList,
    };
