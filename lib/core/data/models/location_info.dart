import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_info.g.dart';

@JsonSerializable()
class LocationInfo {
  LocationInfo({
    required this.name,
    required this.country,
    required this.lat,
    required this.lng,
    required this.localtime,
  });

  factory LocationInfo.fromJson(Map<String, dynamic> json) => _$LocationInfoFromJson(json);

  String name;
  String country;
  double lat;
  double lng;
  String localtime;
}
