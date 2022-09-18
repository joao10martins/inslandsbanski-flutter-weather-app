import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/core/data/models/current_info.dart';
import 'package:weather_app/core/data/models/forecast_info.dart';
import 'package:weather_app/core/data/models/location_info.dart';


part 'weather_info_response.g.dart';

@JsonSerializable()
class WeatherInfoResponse {
  WeatherInfoResponse({
    required this.location,
    required this.current,
    this.forecast,
  });

  factory WeatherInfoResponse.fromJson(Map<String, dynamic> json) => _$WeatherInfoResponseFromJson(json);

  CurrentInfo current;
  LocationInfo location;
  ForecastInfo? forecast;
}
