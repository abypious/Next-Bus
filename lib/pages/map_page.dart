import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Route Map')),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(37.7749, -122.4194), // Example coordinates (San Francisco)
          zoom: 12,
        ),
        markers: {
          const Marker(
            markerId: MarkerId('source'),
            position: LatLng(37.7749, -122.4194), // Example source location
            infoWindow: InfoWindow(title: 'Source'),
          ),
          const Marker(
            markerId: MarkerId('destination'),
            position: LatLng(37.7849, -122.4294), // Example destination location
            infoWindow: InfoWindow(title: 'Destination'),
          ),
        },
        polylines: {
          const Polyline(
            polylineId: PolylineId('route'),
            points: [
              LatLng(37.7749, -122.4194),
              LatLng(37.7849, -122.4294),
            ],
            width: 5,
            color: Colors.blue,
          ),
        },
      ),
    );
  }
}
