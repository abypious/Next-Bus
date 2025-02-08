import 'package:flutter/material.dart';
import 'bus_results_page.dart';

class HomePage extends StatefulWidget {
  final List<Map<String, String>> busDetails;

  HomePage({required this.busDetails});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedSource;
  String? selectedDestination;

  final List<String> locations = ['Ernakulam', 'Vytilla', 'Thalayolaparambu', 'Ettumanoor', 'Kottayam'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Next Bus',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 2.0,
            fontFamily: 'Roboto',
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Responsive Logo
            Image.asset(
              'assets/Logo1.png',
              height: MediaQuery.of(context).size.height * 0.3, // Dynamic resizing
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 40),

            // Source Dropdown
            DropdownButtonFormField<String>(
              value: selectedSource,
              hint: const Text("Select Source"),
              items: locations
                  .where((source) => source != selectedDestination) // Prevents duplicate selection
                  .map((source) => DropdownMenuItem(
                value: source,
                child: Text(source),
              ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedSource = value;
                  if (selectedSource == selectedDestination) {
                    selectedDestination = null;
                  }
                });
              },
              decoration: const InputDecoration(
                labelText: 'Source',
                labelStyle: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
              ),
            ),
            const SizedBox(height: 16),

            // Destination Dropdown
            DropdownButtonFormField<String>(
              value: selectedDestination,
              hint: const Text("Select Destination"),
              items: locations
                  .where((destination) => destination != selectedSource)
                  .map((destination) => DropdownMenuItem(
                value: destination,
                child: Text(destination),
              ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedDestination = value;
                  if (selectedDestination == selectedSource) {
                    selectedSource = null;
                  }
                });
              },
              decoration: const InputDecoration(
                labelText: 'Destination',
                labelStyle: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.bold,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
              ),
            ),
            const SizedBox(height: 16),

            // Find Bus Button
            ElevatedButton(
              onPressed: (selectedSource != null && selectedDestination != null)
                  ? () {
                if (selectedSource == selectedDestination) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Source and Destination cannot be the same')),
                  );
                  return;
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BusResultsPage(
                      busDetails: widget.busDetails,
                      source: selectedSource!,
                      destination: selectedDestination!,
                    ),
                  ),
                );
              }
                  : null, // Button disabled if selections are incomplete
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 30.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                elevation: 5.0,
              ),
              child: const Text(
                'Find Bus',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
