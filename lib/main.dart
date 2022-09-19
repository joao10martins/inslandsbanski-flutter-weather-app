import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/app/resources/color_palette.dart';

import 'app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelKey: 'rain_channel',
          channelName: 'Basic Rain Notification',
          channelDescription: 'A Notification dedicated to tell the user when it\'s going to rain',
          defaultColor: ColorPalette.kPrimaryColor,
          importance: NotificationImportance.High,
          channelShowBadge: true,
        )
      ],
  );

  runApp(const App(
    appName: 'Islandsbanski Weather',
  ));
}
