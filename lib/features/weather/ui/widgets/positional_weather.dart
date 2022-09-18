import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/common/widgets/failure_view.dart';
import 'package:weather_app/core/common/widgets/progress_view.dart';
import 'package:weather_app/core/data/models/weather_info_response.dart';
import 'package:weather_app/core/errors/failures.dart';
import 'package:weather_app/features/weather/ui/bloc/current/current_weather_bloc.dart';
import 'package:weather_app/features/weather/ui/widgets/current_weather_view.dart';

class PositionalWeather extends StatelessWidget {
  const PositionalWeather({
    Key? key,
    required this.position,
  }) : super(key: key);

  final Position position;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CurrentWeatherBloc.fromContext(context)..load(position),
      child: Builder(
        builder: (BuildContext context) => _buildContent(context),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
      builder: (BuildContext context, CurrentWeatherState state) {
        return state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const ProgressView(),
          weather: (WeatherInfoResponse weather) => CurrentWeatherView(weather),
          failed: (Failure failure) => FailureView(failure: failure),
        );
      },
    );
  }
}
