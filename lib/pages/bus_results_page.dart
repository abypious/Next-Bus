import 'package:flutter/material.dart';

class BusResultsPage extends StatelessWidget {
  final List<Map<String, String>> busDetails;
  final String source;
  final String destination;

  BusResultsPage({required this.busDetails, required this.source, required this.destination});

  @override
  Widget build(BuildContext context) {

    final filteredBuses = busDetails.where((bus) {
      List<String> routeList = [
        bus['source'] ?? '',
        bus['route1'] ?? '',
        bus['route2'] ?? '',
        bus['destination'] ?? '',
      ];

      int sourceIndex = routeList.indexWhere((place) => place.contains(source));
      int destinationIndex = routeList.indexWhere((place) => place.contains(destination));

      return sourceIndex != -1 && destinationIndex != -1 && sourceIndex < destinationIndex;
    }).toList();


    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bus Results',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.5,
            fontFamily: 'Roboto',
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display source and destination with styling
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Text(
                '$source  \u2192  $destination',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.blueAccent,
                ),
              ),
            ),
            // Display bus results
            filteredBuses.isNotEmpty
                ? Expanded(
              child: ListView.builder(
                itemCount: filteredBuses.length,
                itemBuilder: (context, index) {
                  final bus = filteredBuses[index];
                  final isKSRTC = bus['busName']?.toUpperCase().contains('KSRTC') ?? false;

                  // Format route display
                  String routeDisplay = [
                    bus['source'],
                    bus['route1'],
                    bus['route2'],
                    bus['destination']
                  ].where((r) => r != null && r.isNotEmpty).join(" → ");

                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    color: Colors.white, // Keep all cards the same color
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                      title: Text(
                        '${bus['busName']} (${bus['time']})',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black87,
                        ),
                      ),
                      subtitle: Text(
                        routeDisplay,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 16,
                        ),
                      ),
                      trailing: Icon(
                        Icons.directions_bus,
                        color: isKSRTC ? Colors.redAccent : Colors.blueAccent, // Change only the icon color for KSRTC buses
                      ),
                    ),
                  );
                },
              ),
            )
                : const Center(
              child: Text(
                'No buses available for this route.',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
