// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherInfoResponse _$WeatherInfoResponseFromJson(Map<String, dynamic> json) =>
    WeatherInfoResponse(
      location: LocationInfo.fromJson(json['location'] as Map<String, dynamic>),
      current: CurrentInfo.fromJson(json['current'] as Map<String, dynamic>),
      forecast: json['forecast'] == null
          ? null
          : ForecastInfo.fromJson(json['forecast'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherInfoResponseToJson(
        WeatherInfoResponse instance) =>
    <String, dynamic>{
      'current': instance.current,
      'location': instance.location,
      'forecast': instance.forecast,
    };
