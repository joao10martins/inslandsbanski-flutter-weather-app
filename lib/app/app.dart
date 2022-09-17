import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/app/environment_config.dart';
import 'package:weather_app/core/data/api/api_client.dart';
import 'package:weather_app/core/theme/theme.dart';
import 'package:weather_app/features/location/repositories/repository/location_repository.dart';
import 'package:weather_app/features/location/repositories/repository_impl/location_repository_impl.dart';
import 'package:weather_app/features/weather/repositories/repository/weather_repository.dart';
import 'package:weather_app/features/weather/repositories/repository_impl/weather_repository_impl.dart';

import 'router.dart';

class App extends StatelessWidget {
  const App({Key? key, required this.appName}) : super(key: key);

  final String appName;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<WeatherRepository>(
          create: (BuildContext context) => WeatherRepositoryImpl(
            ApiClient(EnvironmentConfig.host),
            appId: EnvironmentConfig.weather_api_key,
          ),
        ),
        RepositoryProvider<LocationRepository>(
          create: (BuildContext context) => LocationRepositoryImpl(),
        )
      ],
      child: MaterialApp(
        title: appName,
        theme: getAppTheme(context),
        darkTheme: getAppTheme(context),
        initialRoute: '/',
        onGenerateRoute: (settings) => router(settings),
      ),
    );
  }
}
