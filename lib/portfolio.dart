import 'package:flutter/material.dart';

class AssetManagementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text('Bitcoin'),
          subtitle: Text('BTC'),
          trailing: Text('\$8,000'), // Placeholder for the value
        ),
        ListTile(
          leading: Icon(Icons.monetization_on),
          title: Text('Ethereum'),
          subtitle: Text('ETH'),
          trailing: Text('\$2,000'), // Placeholder for the value
        ),
        // Add more assets here
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ElevatedButton(
            onPressed: () {
              // Implement add asset logic
            },
            child: Text('Add Asset'),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
          ),
        ),
      ],
    );
  }
}
