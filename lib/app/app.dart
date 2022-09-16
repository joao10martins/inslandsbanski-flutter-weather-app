import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'router.dart';

class App extends StatelessWidget {
  const App({Key? key, required this.appName}) : super(key: key);

  final String appName;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [

      ],
      child: MaterialApp(
        title: appName,
        theme: getAppTheme(context),
        darkTheme: getAppTheme(context),
        initialRoute: '/',
        onGenerateRoute: (settings) => router(settings),
      ),
    );
  }
}
