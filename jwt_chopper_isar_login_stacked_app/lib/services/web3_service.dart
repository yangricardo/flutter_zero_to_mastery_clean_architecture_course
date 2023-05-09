import 'package:stacked/stacked.dart';
import 'dart:math'; //used for the random number generator
import 'package:flutter/material.dart';
import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';

class Web3Service with ListenableServiceMixin {
  void createEthPrivateKey() {
    final random = Random.secure();
    EthPrivateKey privateKey = EthPrivateKey.createRandom(random);
    debugPrint(
        "EthPrivateKey: Uint8ListString: ${privateKey.privateKey} bytesToHex: ${bytesToHex(privateKey.privateKey)})}");
    Credentials credentials = privateKey;
    debugPrint("Credentials: ${credentials.toString()}");
    EthereumAddress address = credentials.address;
    debugPrint(
        "EthereumAddress: Uint8ListString ${address.addressBytes} bytesToHex ${bytesToHex(address.addressBytes)} hex ${address.hex}");
    Wallet wallet = Wallet.createNew(privateKey, address.hex, random);
    String walletJson = wallet.toJson();
    debugPrint("walletJson: $walletJson");
    debugPrint("walletString: ${wallet.toString()}");
    wallet = Wallet.fromJson(walletJson, address.toString());
    debugPrint("walletString::Recovered: ${wallet.toString()}");
  }
}
