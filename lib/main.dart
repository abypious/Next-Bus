import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/bus_results_page.dart';
import 'pages/map_page.dart';
import 'pages/settings_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Next Bus',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        '/busResults': (context) => BusResultsPage(),
        '/map': (context) => MapPage(),
        '/settings': (context) => SettingsPage(),
      },
    );
  }
}
