import 'package:flutter/material.dart';

class VaultDashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Vault Balance',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          const Text(
            '\$10,000', // Placeholder for the total balance
            style: TextStyle(fontSize: 32, color: Colors.teal),
          ),
          const SizedBox(height: 20),
          const Text(
            'Recent Transactions',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          // Placeholder for recent transactions list
          Container(
            height: 200,
            width: double.infinity,
            color: Colors.teal.withOpacity(0.2),
            child: const Center(child: Text('Transaction List Placeholder')),
          ),
        ],
      ),
    );
  }
}
