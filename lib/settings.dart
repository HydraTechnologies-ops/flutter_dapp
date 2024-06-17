import 'package:flutter/material.dart';

class VaultSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        ListTile(
          leading: Icon(Icons.security),
          title: Text('Security Settings'),
          onTap: () {
            // Navigate to security settings page
          },
        ),
        ListTile(
          leading: Icon(Icons.notifications),
          title: Text('Notification Preferences'),
          onTap: () {
            // Navigate to notification settings page
          },
        ),
        ListTile(
          leading: Icon(Icons.info),
          title: Text('About'),
          onTap: () {
            // Navigate to about page
          },
        ),
        // Add more settings options here
      ],
    );
  }
}
