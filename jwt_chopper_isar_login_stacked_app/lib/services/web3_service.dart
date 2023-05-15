import 'dart:convert';
import 'dart:typed_data';

import 'package:stacked/stacked.dart';
import 'dart:math'; //used for the random number generator
import 'package:flutter/material.dart';
import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web3dart/src/utils/typed_data.dart';

class Web3Service with ListenableServiceMixin {
  static const _messagePrefix = '\u0019Ethereum Signed Message:\n';

  Wallet createEthWallet() {
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
    return wallet;
  }

  Uint8List stringToUint8List(String message) {
    return Uint8List.fromList(message.codeUnits);
  }

  String uint8ListToString(Uint8List message) {
    return String.fromCharCodes(message);
  }

  Uint8List prefixMessageHash(String message) {
    final payload = stringToUint8List(hashMessage(message));
    final prefix = _messagePrefix + message.length.toString();
    final prefixBytes = ascii.encode(prefix);

    // will be a Uint8List, see the documentation of Uint8List.+
    final prefixedMessageUint8List = uint8ListFromList(prefixBytes + payload);
    return prefixedMessageUint8List;
  }

  String hashMessage(String message) {
    return bytesToHex(keccakUtf8(message));
  }

  Uint8List hexStringToBytes(String hexStr) {
    final bytes = hexToBytes(hexStr);
    return bytes;
  }

  BigInt hexToInt(String hexStr) {
    final bytes = hexToBytes(strip0x(hexStr));
    return bytesToInt(bytes);
  }

  Uint8List bigIntToUint8List(BigInt number) {
    return intToBytes(number);
  }

  BigInt uint8ListToBigInt(Uint8List number) {
    return bytesToInt(number);
  }

  String uint8ListToHex(Uint8List number) {
    return bytesToHex(number);
  }

  String bigIntToHex(BigInt number) {
    return bytesToHex(intToBytes(number));
  }
  // List<int> bigIntToListInt(List<int> number) {
  //   return intToBytes(BigI).toList();
  // }

  String intListToHex(List<int> number) {
    return bytesToHex(number);
  }

  // Uint8List intListToBytes(List<int> number) {
  //   return intToBytes(number);
  // }

  // String bytesToHex(Uint8List bytes) {
  //   return bytesToHex(bytes);
  // }

  String signWithPrivateKey(EthPrivateKey privateKey, String message) {
    final credentials = privateKey;
    final messageBytes = hexToBytes(hashMessage(message));

    final msgSignature = credentials.signToEcSignature(messageBytes);
    final signatureHex = "0x" +
        bytesToHex(intToBytes(msgSignature.r).toList()) +
        bytesToHex(intToBytes(msgSignature.s).toList()) +
        msgSignature.v.toRadixString(16);
    final hexSig =
        bytesToHex(credentials.signPersonalMessageToUint8List(messageBytes));
    debugPrint(
        "signatureHex: $signatureHex hexSig: $hexSig message: ${hashMessage(message)} ");
    return hexSig;
  }

  String signWithWallet(Wallet wallet, String message) {
    final credentials = wallet.privateKey;
    return signWithPrivateKey(credentials, message);
  }

  MsgSignature hexToMsgSignature(String signatureHex) {
    final signatureBytes = hexToBytes(strip0x(signatureHex));
    final r = Uint8List.sublistView(signatureBytes, 0, 32);
    final s = Uint8List.sublistView(signatureBytes, 32, 64);
    final v = signatureBytes[64];
    return MsgSignature(bytesToInt(r.toList()), bytesToInt(s.toList()), v);
  }

  bool isValidEthSignature(
    String messageHash,
    String signature,
    EthereumAddress signerAddress,
  ) {
    final signatureData = hexToMsgSignature(signature);
    return isValidSignature(
        hexToBytes(messageHash), signatureData, signerAddress.addressBytes);
  }

  MsgSignature msgSignatureFromHex(String signatureHex) {
    print("msgSignatureFromHex::signatureHex: $signatureHex");
    final signatureBytes = hexToBytes(strip0x(signatureHex));
    print("msgSignatureFromHex::signatureBytes: $signatureBytes");
    final r = Uint8List.sublistView(signatureBytes, 0, 32);
    final s = Uint8List.sublistView(signatureBytes, 32, 64);
    final v = signatureBytes[64];
    return MsgSignature(bytesToInt(r.toList()), bytesToInt(s.toList()), v);
  }

  bool verifySignatureFromHexSignerAddress(
      String signerAddressHex, String message, String signature) {
    EthereumAddress signerAddress = EthereumAddress.fromHex(signerAddressHex);
    return isValidEthSignature(message, signature, signerAddress);
  }
}
