// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentInfo _$CurrentInfoFromJson(Map<String, dynamic> json) => CurrentInfo(
      lastUpdated: json['last_updated'] as String,
      lastUpdatedEpoch: json['last_updated_epoch'] as int,
      temperatureCelsius: (json['temp_c'] as num).toDouble(),
      feelsLikeCelsius: (json['feelslike_c'] as num).toDouble(),
      condition:
          WeatherCondition.fromJson(json['condition'] as Map<String, dynamic>),
      windKPH: (json['wind_kph'] as num).toDouble(),
      windDirection: json['wind_dir'] as String,
      precipitationMillimeters: (json['precip_mm'] as num).toDouble(),
      humidity: json['humidity'] as int,
    );

Map<String, dynamic> _$CurrentInfoToJson(CurrentInfo instance) =>
    <String, dynamic>{
      'last_updated_epoch': instance.lastUpdatedEpoch,
      'last_updated': instance.lastUpdated,
      'temp_c': instance.temperatureCelsius,
      'feelslike_c': instance.feelsLikeCelsius,
      'condition': instance.condition,
      'wind_kph': instance.windKPH,
      'wind_dir': instance.windDirection,
      'precip_mm': instance.precipitationMillimeters,
      'humidity': instance.humidity,
    };
