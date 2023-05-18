import 'package:jwt_chopper_isar_login_stacked_app/services/web3_service.dart';

void main(List<String> args) {
  final web3Service = Web3Service();
  web3Service.createRandomWallet("test-password");
}
