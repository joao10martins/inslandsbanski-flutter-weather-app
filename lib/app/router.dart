import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/features/home/ui/pages/home_page.dart';

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
      /*return MaterialPageRoute(
        builder: (context) => ForecastPage(),
      );*/
    case Routes.kSearchPage:
      /*return MaterialPageRoute(
        builder: (context) => const SearchLocationPage(),
      );*/
    default:
      return MaterialPageRoute(
        builder: (context) => const Text('Placeholder'),
      );
  }
}
