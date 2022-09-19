import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/app/resources/color_palette.dart';
import 'package:weather_app/app/resources/dimensions.dart';
import 'package:weather_app/app/resources/spacings.dart';
import 'package:weather_app/app/resources/strings.dart';
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
        title: const Text(Strings.homePageTitle),
      ),
      body: Column(
        children: [
          const CurrentLocationContainer(),
          Spacings.mSize,
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
        Strings.homePageSearchButtonText,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: ColorPalette.kPrimaryColor),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(ColorPalette.kCardBackGroundColor),
        padding: MaterialStateProperty.all(
          Dimensions.mAllPadding,
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
          title: Text(Strings.allowNotificationsText),
          content: Text(Strings.ourAppWouldLikeToSendYouNotificationsText),
          actions: [
            TextButton(
              onPressed: (){ Navigator.pop(context); },
              child: Text(
                Strings.dontAllowActionText,
                style: TextStyle(color: ColorPalette.kTextSecondaryColor, fontSize: Dimensions.lSize),
              ),
            ),
            TextButton(
              onPressed: () => AwesomeNotifications().requestPermissionToSendNotifications().then((_) => Navigator.pop(context)),
              child: Text(
                Strings.allowActionText,
                style: TextStyle(color: ColorPalette.kPrimaryColor, fontSize: Dimensions.lSize, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      );
    }
  });
}