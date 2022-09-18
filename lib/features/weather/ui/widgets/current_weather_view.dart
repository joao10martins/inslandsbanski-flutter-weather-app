import 'package:flutter/material.dart';
import 'package:weather_app/app/resources/color_palette.dart';
import 'package:weather_app/app/router.dart';
import 'package:weather_app/core/common/widgets/weather_icon.dart';
import 'package:weather_app/core/data/models/weather_info_response.dart';
import 'package:weather_app/core/extensions/string_extensions.dart';
import 'package:weather_app/features/weather/ui/pages/forecast_page.dart';

class CurrentWeatherView extends StatelessWidget {
  const CurrentWeatherView(this.weather, {Key? key}) : super(key: key);

  final WeatherInfoResponse weather;

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
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDateTimeLabel(context, weather.location.localtime),
          _buildDateCityLabel(context, weather.location.name),
          _buildTemperatureInformation(context, weather),
        ],
      ),
    );
  }

  Widget _buildDateTimeLabel(BuildContext context, String localTime) {
    return Text(
      localTime.replaceAll('-', '/'),
      style: Theme.of(context).textTheme.labelLarge?.copyWith(color: ColorPalette.kTextColor.withOpacity(0.7)),
    );
  }

  Widget _buildDateCityLabel(BuildContext context, String name) {
    return Text(
      name,
      style: Theme.of(context).textTheme.headline5?.copyWith(color: ColorPalette.kTextColor)
    );
  }

  Widget _buildTemperatureInformation(
      BuildContext context,
      WeatherInfoResponse weather,
      ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            WeatherIcon(
              weather.current.condition.icon,
              size: 60,
            ),
            const SizedBox(width: 12),
            Text(
              '${weather.current.temperatureCelsius.toStringAsFixed(0)}°C',
              style: Theme.of(context).textTheme.headline4?.copyWith(color: ColorPalette.kTextColor),
            )
          ],
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  weather.current.condition.description.capitalize(),
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(color: ColorPalette.kTextColor),
                ),
                Text(
                  '\u00b7',
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(color: ColorPalette.kTextColor),
                ),
                Text(
                  "Wind: ${weather.current.windKPH}km/h",
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(color: ColorPalette.kTextColor),
                ),
              ],
            ),

            const SizedBox(width: 4),
            _buildSeeMoreButton(context),
          ],
        ),
      ],
    );
  }

  Widget _buildSeeMoreButton(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(backgroundColor: ColorPalette.kPrimaryColor),
      onPressed: () {
        Navigator.of(context).pushNamed(
          Routes.kForecastPage,
          arguments: ForecastPageArgument(location: weather.location.name, numberOfDays: 2),
        );
      },
      child: Text(
        'See forecast',
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: ColorPalette.kCardBackGroundColor),
      ),
    );
  }
}
