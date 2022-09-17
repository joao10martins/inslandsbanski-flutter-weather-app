import 'package:flutter/material.dart';
import 'package:weather_app/app/router.dart';
import 'package:weather_app/features/location/ui/widgets/current_location_container.dart';

class HomePage extends StatelessWidget {
  const HomePage();

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
      child: const Text('Search for different location'),
      style: ButtonStyle(
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
