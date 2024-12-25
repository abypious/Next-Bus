import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = false;
  bool _isDarkMode = false;
  String _defaultLocation = 'Location 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text('Enable Notifications'),
            value: _notificationsEnabled,
            onChanged: (bool value) {
              setState(() {
                _notificationsEnabled = value;
              });
            },
          ),
          ListTile(
            title: Text('Default Source Location'),
            subtitle: Text(_defaultLocation),
            onTap: () {
              // Handle location selection
            },
          ),
          SwitchListTile(
            title: Text('Dark Mode'),
            value: _isDarkMode,
            onChanged: (bool value) {
              setState(() {
                _isDarkMode = value;
              });
            },
          ),
          ListTile(
            title: Text('About App'),
            subtitle: Text('Version 1.0'),
            onTap: () {
              // Show about dialog
            },
          ),
        ],
      ),
    );
  }
}
