import 'package:jwt_chopper_isar_login_stacked_app/app/app.locator.dart';
import 'package:jwt_chopper_isar_login_stacked_app/services/authentication_service.dart';
import 'package:stacked/stacked.dart';

class SettingsViewModel extends BaseViewModel {
  final _authenticationService = locator<AuthenticationService>();

  String? get ethereumAddress =>
      _authenticationService.wallet?.privateKey.address.hex;

  void logout() {
    _authenticationService.logout();
  }
}
