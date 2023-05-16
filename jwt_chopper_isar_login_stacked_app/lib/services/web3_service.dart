import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:web3dart/crypto.dart';
import 'dart:math'; //used for the random number generator
import 'package:web3dart/web3dart.dart';

import 'package:web3dart/src/utils/typed_data.dart';

class Web3Service with ListenableServiceMixin {
  static const _messagePrefix = '\u0019Ethereum Signed Message:\n';

  Wallet createRandomWallet(String password) {
    try {
      final Random random = Random.secure();
      final EthPrivateKey privateKey = EthPrivateKey.createRandom(random);
      final Wallet wallet = Wallet.createNew(privateKey, password, random);
      debugPrint(
          "Wallet Private Key ${bytesToHex(wallet.privateKey.privateKey, include0x: true)}");
      debugPrint("Wallet Public Address ${wallet.privateKey.address.hex}");
      final signatureTestBytes =
          sign(wallet.privateKey, privateKey.address.hex);
      debugPrint(
          "Signature Test ${bytesToHex(signatureTestBytes, include0x: true)}");
      final signatureValidation = isValidHexSignatureFromRawMessage(
          bytesToHex(signatureTestBytes, include0x: true),
          privateKey.address.hex,
          privateKey.address.hex);
      if (!signatureValidation) {
        throw Exception("Signature Validation Failed");
      }
      return wallet;
    } catch (e) {
      return createRandomWallet(password);
    }
  }

  Wallet openWalletFromJSON(String encodedJsonWallet, String password) {
    return Wallet.fromJson(encodedJsonWallet, password);
  }

  EthPrivateKey fromPrivateKeyHex(String privateKeyHex) {
    final privateKeyBytes = hexToBytes(strip0x(privateKeyHex));
    final privateKey = EthPrivateKey.fromHex(bytesToHex(privateKeyBytes));
    debugPrint(
        "Private Key ${bytesToHex(privateKey.privateKey, include0x: true)}");
    debugPrint("Public Address ${privateKey.address.hex}");
    return privateKey;
  }

  Uint8List strToBytes(String message) {
    return Uint8List.fromList(message.codeUnits);
  }

  String bytesToStr(Uint8List message) {
    return String.fromCharCodes(message);
  }

  Uint8List sign(EthPrivateKey privateKey, String message) {
    try {
      final messageBytes = strToBytes(message);
      final signature = privateKey.signPersonalMessageToUint8List(messageBytes);
      final signatureHex = bytesToHex(signature, include0x: true);
      debugPrint("signature: $signatureHex");
      return signature;
    } catch (e) {
      return sign(privateKey, message);
    }
  }

  Uint8List buildPrefixedMessage(String message) {
    final Uint8List payload = strToBytes(message);
    const _messagePrefix = '\u0019Ethereum Signed Message:\n';
    final prefix = _messagePrefix + payload.length.toString();
    final prefixBytes = ascii.encode(prefix);

    // will be a Uint8List, see the documentation of Uint8List.+
    final prefixedMessage = uint8ListFromList(prefixBytes + payload);
    debugPrint(
        "prefixedMessage: ${bytesToHex(prefixedMessage, include0x: true)}");
    return prefixedMessage;
  }

  Uint8List buildPrefixedMessageHash(String message) {
    final Uint8List prefixedMessage = buildPrefixedMessage(message);
    final Uint8List messageHash = keccak256(prefixedMessage);
    debugPrint("messageHash: ${bytesToHex(messageHash, include0x: true)}");
    return messageHash;
  }

  MsgSignature hexToMsgSignature(String signatureHex) {
    final signatureBytes = hexToBytes(strip0x(signatureHex));
    final r = Uint8List.sublistView(signatureBytes, 0, 32);
    final s = Uint8List.sublistView(signatureBytes, 32, 64);
    final v = signatureBytes[64];
    debugPrint(
        "r: ${bytesToHex(r, include0x: true)} s: ${bytesToHex(s, include0x: true)} v: ${v.toRadixString(16)}");
    return MsgSignature(bytesToInt(r.toList()), bytesToInt(s.toList()), v);
  }

  MsgSignature signatureBytesToMsgSignature(Uint8List signatureBytes) {
    return hexToMsgSignature(bytesToHex(signatureBytes, include0x: true));
  }

  EthereumAddress recoverSignatureAddress(
      MsgSignature signature, Uint8List messageHash) {
    final recoveredPublicKey = ecRecover(messageHash, signature);
    EthereumAddress recoveredAddress =
        EthereumAddress.fromPublicKey(recoveredPublicKey);
    debugPrint("recoveredAddress: ${recoveredAddress.hex}");
    return recoveredAddress;
  }

  bool isValidHexSignatureFromRawMessage(
      String hexSignature, String message, String hexAddress) {
    final signature = hexToMsgSignature(hexSignature);
    final messageHash = buildPrefixedMessageHash(message);
    final recoveredAddress = recoverSignatureAddress(signature, messageHash);

    final comparedToAddess = EthereumAddress.fromHex(hexAddress);
    final isValid = recoveredAddress == comparedToAddess;
    debugPrint(
        "isValid: $isValid recoveredAddress: ${recoveredAddress.hex} comparedToAddess: ${comparedToAddess.hex}");
    return isValid;
  }
}
