import 'package:flutter/material.dart';

@immutable
abstract class Strings {
  const Strings._();

  static const String appTitle = 'Islandsbanski Weather App';
  static const String homePageTitle = 'Weather';
  static const String homePageSearchButtonText = 'Search for different location';

  /// General
  static const String somethingWentWrong = 'Ups.. something went wrong';

  /// Notifications
  static const String allowNotificationsText = 'Allow Notifications';
  static const String ourAppWouldLikeToSendYouNotificationsText = 'Our app would like to send you notifications';
  static const String allowActionText = 'Allow';
  static const String dontAllowActionText = 'Don\'t allow';

  /// Location page
  static const String currentLocationText = 'Current location:';
  /// Search page
  static const String searchPageTitle = 'Search';
  static const String searchHintText = 'Weather in your city';
  static const String searchErrorMessage = 'Current location:';
  static const String searchEngineDescription1 = 'Search engine is very flexible. How it works:';
  static const String searchEngineDescription2 = 'To make it more precise put the city\'s name, comma, 2-letter country code (ISO3166). You will get all proper cities in chosen country.';
  static const String searchEngineDescription3 = 'The order is important - the first is city name then comma then country. Example - London, GB or New York, US.';
}
