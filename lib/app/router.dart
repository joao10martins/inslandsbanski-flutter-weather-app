import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/features/home/ui/pages/home_page.dart';
import 'package:weather_app/features/search/ui/pages/search_location_page.dart';
import 'package:weather_app/features/weather/ui/pages/forecast_page.dart';

class Routes {
  static const kHomePage = '/';
  static const kForecastPage = '/forecast';
  static const kSearchPage = '/search';
}

Route<dynamic> router(RouteSettings settings) {
  switch (settings.name) {
    case Routes.kHomePage:
      return MaterialPageRoute(
        builder: (context) => const HomePage(),
      );
    case Routes.kForecastPage:
      final ForecastPageArgument forecastPageArgument = settings.arguments as ForecastPageArgument;
      return MaterialPageRoute(
        builder: (context) => ForecastPage(
          numberOfDays: forecastPageArgument.numberOfDays,
          location: forecastPageArgument.location,
        ),
      );
    case Routes.kSearchPage:
      return MaterialPageRoute(
        builder: (context) => const SearchLocationPage(),
      );
    default:
      return MaterialPageRoute(
        builder: (context) => const Text('Placeholder'),
      );
  }
}
