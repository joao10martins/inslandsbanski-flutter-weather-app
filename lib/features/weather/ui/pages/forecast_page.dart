import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/app/resources/color_palette.dart';
import 'package:weather_app/core/common/widgets/failure_view.dart';
import 'package:weather_app/core/common/widgets/progress_view.dart';
import 'package:weather_app/core/common/widgets/weather_icon.dart';
import 'package:weather_app/core/data/models/daily_forecast.dart';
import 'package:weather_app/core/data/models/day_weather_info.dart';
import 'package:weather_app/core/data/models/hour_weather_info.dart';
import 'package:weather_app/core/data/models/weather_info_response.dart';
import 'package:weather_app/core/errors/failures.dart';
import 'package:weather_app/features/weather/ui/bloc/forecast/forecast_bloc.dart';
import 'package:weather_app/features/weather/ui/widgets/forecast_hourly_item.dart';

class ForecastPageArgument {
  ForecastPageArgument({this.numberOfDays = 2, required this.location});

  final int numberOfDays;
  final String location;
}

class ForecastPage extends StatelessWidget {
  const ForecastPage({
    Key? key,
    required this.numberOfDays,
    required this.location,
  }) : super(key: key);

  final int numberOfDays;
  final String location;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return ForecastBloc.fromContext(context)..load(location);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Forecast for $location',
          ),
        ),
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<ForecastBloc, ForecastState>(
      builder: (BuildContext context, ForecastState state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const ProgressView(),
          forecast: (List<HourWeatherInfo> forecastHours,
                  List<DailyForecast>? forecastDays) =>
              _builderForecastDetails(
            context,
            forecastHours,
            forecastDays,
          ),
          failed: (Failure failure) => Center(
            child: FailureView(
              failure: failure,
            ),
          ),
        );
      },
    );
  }

  Widget _builderForecastDetails(
    BuildContext context,
    List<HourWeatherInfo> forecastHours,
    List<DailyForecast>? forecastDays,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "${forecastHours.first.temperatureCelsius.toStringAsFixed(0)}°C",
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: ColorPalette.kTextColor, letterSpacing: -12),
              ),
              Text(
                "${forecastHours.first.condition.description}",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: ColorPalette.kTextColor, fontSize: 28),
              ),
            ],
          ),
          const SizedBox(height: 36),
          Column(
            children: [
              _buildShortWeatherForecast(context, forecastDays!.first.day, true),
              _buildShortWeatherForecast(context, forecastDays.last.day, false),
            ],
          ),
          const SizedBox(height: 36),
          Container(
            height: 120,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return ForecastHourlyItem(
                    forecastHours[index], index == 0 ? true : false);
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(width: 4);
              },
              itemCount: forecastHours.length,
            ),
          ),
        ],
      ),
    );
  }

  _buildShortWeatherForecast(BuildContext context, DayWeatherInfo day, bool isToday) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            WeatherIcon(
              day.condition.icon,
              size: 40,
            ),
            const SizedBox(width: 4),
            Text(
              '${isToday ? 'Today':'Tomorrow'}\u00b7${day.condition.description}',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: ColorPalette.kTextColor),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              '${day.maxTemperatureCelsius}° / ${day.minTemperatureCelsius}°',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: ColorPalette.kTextColor),
            ),
          ],
        ),
      ],
    );
  }
}

// Row(
//   children: [
//     WeatherIcon(
//       forecastDays.last.day.condition.icon,
//       size: 60,
//     ),
//     Text('Tomorrow\u00b7${forecastDays.last.day.condition.description}'),
//   ],
// ),
