import 'package:flutter/material.dart';
import 'package:weather_app/app/resources/color_palette.dart';
import 'package:weather_app/core/common/widgets/date_label.dart';
import 'package:weather_app/core/common/widgets/weather_icon.dart';
import 'package:weather_app/core/data/models/hour_weather_info.dart';

class ForecastHourlyItem extends StatelessWidget {
  const ForecastHourlyItem(this.hourlyForecast, this.isCurrentHour, {Key? key}) : super(key: key);

  final HourWeatherInfo hourlyForecast;
  final bool isCurrentHour;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white38,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: _buildCardBody(context),
    );
  }

  Widget _buildCardBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          DateLabel(
            dateTime: hourlyForecast.dateTimeEpoch,
            textStyle: Theme.of(context).textTheme.labelMedium?.copyWith(color: ColorPalette.kTextColor.withOpacity(0.7)),
            dateFormat: 'HH:MM',
            isCurrentHour: isCurrentHour,
          ),
          Text(
            '${hourlyForecast.temperatureCelsius.toStringAsFixed(0)}°',
            style: Theme.of(context).textTheme.headline5?.copyWith(color: ColorPalette.kTextColor),
          ),
          WeatherIcon(
            hourlyForecast.condition.icon,
            size: 40,
          ),
          Text(
            'Wind:${hourlyForecast.feelsLikeCelsius ?? '-'}km/h',
            style: Theme.of(context).textTheme.caption?.copyWith(color: ColorPalette.kTextColor),
          ),
        ],
      ),
    );
  }
}
