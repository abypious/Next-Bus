import 'package:flutter/material.dart';
import 'services/excel_service.dart';
import 'pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final busDetails = await ExcelService.parseBusDetails();

  runApp(MyApp(busDetails: busDetails));
}

class MyApp extends StatelessWidget {
  final List<Map<String, String>> busDetails;

  MyApp({required this.busDetails});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Next Bus',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(busDetails: busDetails),  // Pass busDetails to HomePage
    );
  }
}
