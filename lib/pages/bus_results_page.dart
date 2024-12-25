import 'package:flutter/material.dart';

class BusResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Example bus list
    final buses = [
      {'busNumber': 'Bus 101', 'departure': '10:00 AM', 'arrival': '11:30 AM'},
      {'busNumber': 'Bus 102', 'departure': '11:00 AM', 'arrival': '12:30 PM'},
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Bus Results')),
      body: ListView.builder(
        itemCount: buses.length,
        itemBuilder: (context, index) {
          final bus = buses[index];
          return Card(
            child: ListTile(
              title: Text(bus['busNumber']!),
              subtitle: Text('Departure: ${bus['departure']}, Arrival: ${bus['arrival']}'),
              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/map');
                },
                child: Text('Show Route'),
              ),
            ),
          );
        },
      ),
    );
  }
}
