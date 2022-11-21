import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';

class ContractLinking extends ChangeNotifier {
  final String _rpcUrl = "http://10.0.2.2:7545";
  final String _wsUrl = "ws://10.0.2.2:7545";
  final String _privateKey =
      "8b3b745b75293ccf61902406ceabfad932d1cf917063e07a6c3d74d3958d4bc8";
  //Ganache Private Key above ^^^
  late Web3Client _client;
  bool isLoading = true;

  late String _abiCode;
  late EthereumAddress _contractAddress;

  late Credentials _credentials;
  late DeployedContract _contract;
  late ContractFunction _yourName;
  late ContractFunction _setName;

  late String deployedName;

  ContractLinking() {
    initialSetup();
  }

  initialSetup() async {
    _client = Web3Client(_rpcUrl, Client(), socketConnector: () {
      return IOWebSocketChannel.connect(_wsUrl).cast<String>();
    });

    await getAbi();
    await getCredentials();
    await getDeployedContract();
  }

  Future<void> getAbi() async {
    String abiStringFile =
        await rootBundle.loadString("src/artifacts/HelloWorld.json");
    var jsonAbi = jsonDecode(abiStringFile);
    _abiCode = jsonEncode(jsonAbi["abi"]);

    _contractAddress =
        EthereumAddress.fromHex(jsonAbi["networks"]["5777"]["address"]);
  }

  Future<void> getCredentials() async {
    _credentials = await _client.credentialsFromPrivateKey(_privateKey);
  }

  Future<void> getDeployedContract() async {
    _contract = DeployedContract(
        ContractAbi.fromJson(_abiCode, "HelloWorld"), _contractAddress);

    _yourName = _contract.function("yourName");
    _setName = _contract.function("setName");
    getName();
  }

  getName() async {
    var currentName = await _client
        .call(contract: _contract, function: _yourName, params: []);
    deployedName = currentName[0];
    isLoading = false;
    notifyListeners();
  }

  setName(String nameToSet) async {
    isLoading = true;
    notifyListeners();
    await _client.sendTransaction(
        _credentials,
        Transaction.callContract(
            contract: _contract, function: _setName, parameters: [nameToSet]));
    getName();
  }
}
