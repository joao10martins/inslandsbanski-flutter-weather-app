import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_condition.g.dart';

@JsonSerializable()
class WeatherCondition {
  WeatherCondition({
    required this.description,
    required this.icon,
    required this.code,
  });

  factory WeatherCondition.fromJson(Map<String, dynamic> json) => _$WeatherConditionFromJson(json);

  @JsonKey(name: 'text')
  String description;
  String icon;
  int code;
}
