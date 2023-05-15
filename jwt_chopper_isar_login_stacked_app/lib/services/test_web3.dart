import './web3_service.dart';

void main(List<String> args) {
  final _web3Service = Web3Service();

  const message = 'Hello';

  final messageUint8List = _web3Service.stringToUint8List(message);
  print("messageUint8List $messageUint8List");

  final messageUint8ListStr = _web3Service.uint8ListToString(messageUint8List);
  print("messageUint8ListStr $messageUint8ListStr");

  final messageKeccakHash = _web3Service.hashMessage(message);
  print("messageKeccak $messageKeccakHash");
  final messageKeccakHashUint8List =
      _web3Service.hexStringToBytes(messageKeccakHash);
  print("messageKeccakHashUint8List $messageKeccakHashUint8List");

  final wallet = _web3Service.createEthWallet();

  final prefixedSignature = wallet.privateKey
      .signPersonalMessageToUint8List(messageKeccakHashUint8List);

  final hexPrefixedSignature = _web3Service.uint8ListToHex(prefixedSignature);

  print("prefixedSignature $hexPrefixedSignature");

  final msgSignature = _web3Service.msgSignatureFromHex(hexPrefixedSignature);
  print(
      "msgSignature r ${_web3Service.bigIntToHex(msgSignature.r)} s ${_web3Service.bigIntToHex(msgSignature.s)} v ${msgSignature.v.toRadixString(16)}");

  final isValid = _web3Service.isValidEthSignature(
      _web3Service
          .uint8ListToHex(_web3Service.stringToUint8List(messageKeccakHash)),
      hexPrefixedSignature,
      wallet.privateKey.address);

  print("isValid $isValid");
  // final messageHashHex = _web3Service.hashMessage(message);
  // final messageHashUint8List = _web3Service.hexToBytes(messageHashHex);
  // print("message $message -- messageHash $messageHashHex");

  // final wallet = _web3Service.createEthWallet();

  // wallet.privateKey.signPersonalMessageToUint8List(payload)
  // print(wallet.toJson());

  // final message = 'Hello';

  // wallet.privateKey.signPersonalMessageToUint8List(payload)
}
