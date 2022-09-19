import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:weather_app/core/utils/utils.dart';

Future<void> createRainWarningNotification() async {
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: createUniqueId(),
      channelKey: 'rain_channel',
      title: '${Emojis.sky_cloud_with_rain} IslandsbanskiWeather',
      body: 'There\'s a high chance that today will rain. You should take your umbrella today!',
      notificationLayout: NotificationLayout.Default,
      displayOnBackground: true,
      displayOnForeground: true,
    ),
    schedule: NotificationCalendar(repeats: true, hour: 8),
  );
}

Future<void> cancelScheduledNotifications() async {
  await AwesomeNotifications().cancelAllSchedules();
}
