import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/app/router.dart';
import 'package:weather_app/core/common/widgets/weather_icon.dart';
import 'package:weather_app/core/data/models/weather_info_response.dart';
import 'package:weather_app/core/extensions/string_extensions.dart';

class CurrentWeatherView extends StatelessWidget {
  const CurrentWeatherView(this.weather, {Key? key}) : super(key: key);

  final WeatherInfoResponse weather;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
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
      DateFormat('dd/MM/yyyy, HH:mm').parse(localTime).toString(),
      style: Theme.of(context).textTheme.bodyText2?.copyWith(color: Colors.black38),
    );
  }

  Widget _buildDateCityLabel(BuildContext context, String name) {
    return Text(
      name,
      style: Theme.of(context).textTheme.headline5,
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
              style: Theme.of(context).textTheme.headline4,
            )
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Expanded(
              child: Text(
                weather.current.condition.description.capitalize(),
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
