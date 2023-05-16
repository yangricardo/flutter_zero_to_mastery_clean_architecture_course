import 'package:stacked/stacked.dart';
import 'dart:math'; //used for the random number generator
import 'package:web3dart/web3dart.dart';

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
}
