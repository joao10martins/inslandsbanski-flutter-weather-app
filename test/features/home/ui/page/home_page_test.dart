import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/features/home/ui/pages/home_page.dart';
import 'package:weather_app/features/location/repositories/repository/location_repository.dart';
import 'package:weather_app/features/weather/repositories/repository/weather_repository.dart';

import '../../../../golden_test_wrapper.dart';
import '../../../../mocks.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}

class MockLocationRepository extends Mock implements LocationRepository {}

void main() {
  late WeatherRepository _weatherRepository;
  late LocationRepository _locationRepository;

  setUp(() {
    _weatherRepository = MockWeatherRepository();
    _locationRepository = MockLocationRepository();
  });

  testGoldens('Home page - with weather', (tester) async {
    when(() => _locationRepository.checkPermission()).thenAnswer((_) async => LocationPermission.always);
    when(() => _locationRepository.isLocationServiceEnabled()).thenAnswer((_) async => true);
    when(() => _locationRepository.getCurrentPosition()).thenAnswer((_) async => _getMockedPosition(
      lat: 20,
      lon: 20,
    ));

    when(
          () => _weatherRepository.getCurrentWeatherForPosition(lat: 20, lon: 20),
    ).thenAnswer((_) async => Right(mockedCurrentWeatherResponseForLisbon));

    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: [Device.phone])
      ..addScenario(
        widget: MockedDataTestWrapper(
          weatherRepository: _weatherRepository,
          locationRepository: _locationRepository,
          child: const HomePage(),
        ),
      );
    await tester.pumpDeviceBuilder(builder);

    await screenMatchesGolden(
      tester,
      'home_page_with_weather',
    );
  });

  testGoldens('Home page - with denied permission', (tester) async {
    when(() => _locationRepository.checkPermission()).thenAnswer((_) async => LocationPermission.deniedForever);

    final builder = DeviceBuilder()
      ..overrideDevicesForAllScenarios(devices: [Device.phone])
      ..addScenario(
        widget: MockedDataTestWrapper(
          weatherRepository: _weatherRepository,
          locationRepository: _locationRepository,
          child: const HomePage(),
        ),
      );
    await tester.pumpDeviceBuilder(builder);

    await screenMatchesGolden(
      tester,
      'home_page_with_denied_permission',
    );
  });
}

Position _getMockedPosition({required double lat, required double lon}) {
  return Position(
    speedAccuracy: 0,
    latitude: lat,
    longitude: lon,
    accuracy: 20,
    altitude: 20,
    heading: 0,
    timestamp: DateTime.now(),
    speed: 0,
  );
}
