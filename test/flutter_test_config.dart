import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  TestWidgetsFlutterBinding.ensureInitialized();

  return GoldenToolkit.runWithConfiguration(
        () async {
      await _loadAllFonts();

      await testMain();
    },
    config: GoldenToolkitConfiguration(),
  );
}

Future _loadAllFonts() async {
  await loadAppFonts();

  final fontLoader = FontLoader('Avenir')
    ..addFont(rootBundle.load('assets/fonts/Avenir-Black.ttf'))
    ..addFont(rootBundle.load('assets/fonts/Avenir-Roman.ttf'))
    ..addFont(rootBundle.load('assets/fonts/Avenir-Light.ttf'))
    ..addFont(rootBundle.load('assets/fonts/Avenir-Book.ttf'))
    ..addFont(rootBundle.load('assets/fonts/Avenir-Medium.ttf'));
  await fontLoader.load();
}
