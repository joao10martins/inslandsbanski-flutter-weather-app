import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/app/resources/color_palette.dart';
import 'package:weather_app/app/router.dart';
import 'package:weather_app/core/data/notifications/weather/rain_notification.dart';
import 'package:weather_app/features/location/ui/widgets/current_location_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    checkNotificationPermissions(context);
    // Could possibly create some logic here to check whether or not it is past 8 in the morning
    // And if it is then no notification is scheduled, if it is before then the notification is scheduled to show based on forecast data
    // (if chance of rain >=70% && hour is BEFORE 8 in the morning => show notification)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: Column(
        children: [
          const CurrentLocationContainer(),
          const SizedBox(height: 16),
          SearchButton(context: context),
          //TextButton(onPressed: createRainWarningNotification, child: Text('test notification'))
        ],
      ),
    );
  }
}

class SearchButton extends StatelessWidget {
  const SearchButton({
    Key? key,
    required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        'Search for different location',
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: ColorPalette.kPrimaryColor),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(ColorPalette.kCardBackGroundColor),
        padding: MaterialStateProperty.all(
          const EdgeInsets.all(16),
        ),
      ),
      onPressed: () {
        Navigator.of(context).pushNamed(Routes.kSearchPage);
      },
    );
  }
}

void checkNotificationPermissions(BuildContext context) {
  AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
    if(!isAllowed) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Allow Notifications'),
          content: Text('Our app would like to send you notifications'),
          actions: [
            TextButton(
              onPressed: (){ Navigator.pop(context); },
              child: Text(
                'Don\'t allow',
                style: TextStyle(color: ColorPalette.kTextSecondaryColor, fontSize: 18),
              ),
            ),
            TextButton(
              onPressed: () => AwesomeNotifications().requestPermissionToSendNotifications().then((_) => Navigator.pop(context)),
              child: Text(
                'Allow',
                style: TextStyle(color: ColorPalette.kPrimaryColor, fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      );
    }
  });
}