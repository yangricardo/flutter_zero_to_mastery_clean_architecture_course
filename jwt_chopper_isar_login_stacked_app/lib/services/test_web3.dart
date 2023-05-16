import 'package:jwt_chopper_isar_login_stacked_app/services/web3_service.dart';

void main(List<String> args) {
  final _web3Service = Web3Service();
  final wallet = _web3Service.createRandomWallet();
}
