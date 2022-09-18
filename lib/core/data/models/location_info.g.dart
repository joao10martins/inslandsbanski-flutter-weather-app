// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationInfo _$LocationInfoFromJson(Map<String, dynamic> json) => LocationInfo(
      name: json['name'] as String,
      country: json['country'] as String,
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
      localtime: json['localtime'] as String,
    );

Map<String, dynamic> _$LocationInfoToJson(LocationInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'country': instance.country,
      'lat': instance.lat,
      'lon': instance.lon,
      'localtime': instance.localtime,
    };
