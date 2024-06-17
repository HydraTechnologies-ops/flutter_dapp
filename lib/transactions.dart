import 'package:flutter/material.dart';

class TransactionHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        ListTile(
          leading: Icon(Icons.arrow_upward),
          title: Text('Sent Bitcoin'),
          subtitle: Text('Amount: 0.5 BTC'),
          trailing: Text('-\$4,000'), // Placeholder for the transaction amount
        ),
        ListTile(
          leading: Icon(Icons.arrow_downward),
          title: Text('Received Ethereum'),
          subtitle: Text('Amount: 1 ETH'),
          trailing: Text('+\$2,000'), // Placeholder for the transaction amount
        ),
        // Add more transactions here
      ],
    );
  }
}
