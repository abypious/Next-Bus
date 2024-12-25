import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Next Bus')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButton<String>(
              hint: Text('Select Source'),
              items: <String>['Location 1', 'Location 2', 'Location 3']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (_) {},
            ),
            DropdownButton<String>(
              hint: Text('Select Destination'),
              items: <String>['Location A', 'Location B', 'Location C']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (_) {},
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/busResults');
              },
              child: Text('Find Bus'),
            ),
          ],
        ),
      ),
    );
  }
}
