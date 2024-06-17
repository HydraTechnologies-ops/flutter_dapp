import 'package:flutter/material.dart';
import 'package:flutter_dapp/contract_linking.dart';
import 'package:provider/provider.dart';

class HelloUI extends StatelessWidget {
  const HelloUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var contractLink = Provider.of<ContractLinking>(context);
    TextEditingController yourNameController = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello, Hydra'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: contractLink.isLoading
              ? const CircularProgressIndicator()
              : SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Hello ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 32),
                            ),
                            Text(
                              contractLink.deployedName,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 32,
                                color: Colors.teal,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: TextFormField(
                            controller: yourNameController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Your Name",
                              hintText: "What is your name?",
                              icon: Icon(Icons.drive_file_rename_outline),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal,
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                contractLink
                                    .setName(yourNameController.text)
                                    .then((_) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Name set successfully!'),
                                      backgroundColor: Colors.green,
                                    ),
                                  );
                                }).catchError((error) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content:
                                          Text('Failed to set name: $error'),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                });
                                yourNameController.clear();
                              }
                            },
                            child: contractLink.isLoading
                                ? const CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white),
                                  )
                                : const Text(
                                    'Set Name',
                                    style: TextStyle(fontSize: 20),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
