import 'package:jwt_chopper_isar_login_stacked_app/app/app.locator.dart';
import 'package:jwt_chopper_isar_login_stacked_app/services/authentication_service.dart';
import 'package:jwt_chopper_isar_login_stacked_app/services/web3_service.dart';
import 'package:stacked/stacked.dart';
import 'package:web3dart/crypto.dart';

class SignHashViewModel extends BaseViewModel {
  final _authenticationService = locator<AuthenticationService>();
  final _web3Service = locator<Web3Service>();
  String? ethereumAddress;
  String? signatureHex;
  bool? isValid;

  void signHash(String hash) {
    signatureHex = null;
    isValid = false;
    notifyListeners();
    if (_authenticationService.wallet?.privateKey != null) {
      signatureHex = bytesToHex(
          _web3Service.sign(_authenticationService.wallet!.privateKey, hash));
      ethereumAddress = _authenticationService.wallet!.privateKey.address.hex;
      isValid = _web3Service.isValidHexSignatureFromRawMessage(
        signatureHex!,
        hash,
        ethereumAddress!,
      );
    }
    notifyListeners();
  }
}
