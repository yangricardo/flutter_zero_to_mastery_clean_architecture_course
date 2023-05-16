import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web3dart/src/utils/typed_data.dart';

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

Uint8List buildPrefixedMessageHash(String message) {
  final Uint8List prefixedMessage = buildPrefixedMessage(message);
  final Uint8List messageHash = keccak256(prefixedMessage);
  print("messageHash: ${bytesToHex(messageHash, include0x: true)}");
  return messageHash;
}

Uint8List sign(EthPrivateKey privateKey, Uint8List message) {
  final signature = privateKey.signPersonalMessageToUint8List(message);
  print("signature: ${bytesToHex(signature, include0x: true)}");
  return signature;
}

EthereumAddress recoverSignatureAddress(
    MsgSignature signature, Uint8List messageHash) {
  final recoveredPublicKey = ecRecover(messageHash, signature);
  EthereumAddress recoveredAddress =
      EthereumAddress.fromPublicKey(recoveredPublicKey);
  print("recoveredAddress: ${recoveredAddress.hex}");
  return recoveredAddress;
}

String msgSignatureToHex(MsgSignature signature) {
  final r = bytesToHex(intToBytes(signature.r), include0x: true);
  final s = bytesToHex(intToBytes(signature.s));
  final v = signature.v.toRadixString(16);
  print("r: $r s: $s v: $v");
  return r + s + v;
}

MsgSignature hexToMsgSignature(String signatureHex) {
  final signatureBytes = hexToBytes(strip0x(signatureHex));
  final r = Uint8List.sublistView(signatureBytes, 0, 32);
  final s = Uint8List.sublistView(signatureBytes, 32, 64);
  final v = signatureBytes[64];
  print(
      "r: ${bytesToHex(r, include0x: true)} s: ${bytesToHex(s, include0x: true)} v: ${v.toRadixString(16)}");
  return MsgSignature(bytesToInt(r.toList()), bytesToInt(s.toList()), v);
}

MsgSignature signatureBytesToMsgSignature(Uint8List signatureBytes) {
  return hexToMsgSignature(bytesToHex(signatureBytes, include0x: true));
}

void main(List<String> args) {
  final Wallet wallet = createRandomWallet();
  const message = 'Hello World';

  final signatureBytes = sign(wallet.privateKey, strToBytes(message));
  final Uint8List messageHash = buildPrefixedMessageHash(message);
  final recoveredAddress = recoverSignatureAddress(
      signatureBytesToMsgSignature(signatureBytes), messageHash);
}