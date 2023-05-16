import 'dart:convert';
import 'dart:typed_data';

import 'package:stacked/stacked.dart';
import 'package:web3dart/crypto.dart';
import 'dart:math'; //used for the random number generator
import 'package:web3dart/web3dart.dart';

import 'package:web3dart/src/utils/typed_data.dart';

class Web3Service with ListenableServiceMixin {
  static const _messagePrefix = '\u0019Ethereum Signed Message:\n';

  Wallet createRandomWallet() {
    final Random random = Random.secure();
    final EthPrivateKey privateKey = EthPrivateKey.createRandom(random);
    final Wallet wallet =
        Wallet.createNew(privateKey, privateKey.address.hex, random);
    print("new address ${wallet.privateKey.address.hex}");
    return wallet;
  }

  Uint8List strToBytes(String message) {
    return Uint8List.fromList(message.codeUnits);
  }

  String bytesToStr(Uint8List message) {
    return String.fromCharCodes(message);
  }

  Uint8List sign(EthPrivateKey privateKey, Uint8List message) {
    final signature = privateKey.signPersonalMessageToUint8List(message);
    print("signature: ${bytesToHex(signature, include0x: true)}");
    return signature;
  }

  Uint8List buildPrefixedMessage(String message) {
    final Uint8List payload = strToBytes(message);
    const _messagePrefix = '\u0019Ethereum Signed Message:\n';
    final prefix = _messagePrefix + payload.length.toString();
    final prefixBytes = ascii.encode(prefix);

    // will be a Uint8List, see the documentation of Uint8List.+
    final prefixedMessage = uint8ListFromList(prefixBytes + payload);
    print("prefixedMessage: ${bytesToHex(prefixedMessage, include0x: true)}");
    return prefixedMessage;
  }
}
