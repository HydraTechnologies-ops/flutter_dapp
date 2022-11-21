import 'package:flutter/material.dart';
import 'package:flutter_dapp/contract_linking.dart';
import 'package:flutter_dapp/helloUI.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ContractLinking>(
      create: (_) => ContractLinking(),
      child: MaterialApp(
        title: "Hello Hydra",
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.cyan[400],
          accentColor: Colors.deepOrange[200],
        ),
        home: HelloUI(),
      ),
    );
  }
}
