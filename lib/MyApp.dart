import 'package:flutter/material.dart';
import 'package:smart_shoes/ApplicationLayer/Presentation/_Resources/RouteManager.dart';

import 'ApplicationLayer/Presentation/_Resources/ThemeManager.dart';

class MyApp extends StatefulWidget {
  MyApp._internal();

  static final MyApp _myApp = MyApp._internal();

  factory MyApp() => _myApp;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeManager.lightThemeData,
      initialRoute: RouteManager.testRoute,
      onGenerateRoute: RouteManager.myRouteGenerator,
      debugShowCheckedModeBanner: false,
    );
  }
}
