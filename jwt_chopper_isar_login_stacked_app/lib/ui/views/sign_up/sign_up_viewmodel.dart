import 'package:jwt_chopper_isar_login_stacked_app/app/app.locator.dart';
import 'package:jwt_chopper_isar_login_stacked_app/services/authentication_service.dart';
import 'package:jwt_chopper_isar_login_stacked_app/ui/views/sign_up/sign_up_view.form.dart';
import 'package:stacked/stacked.dart';

class SignUpViewModel extends FormViewModel {
  final _authenticationService = locator<AuthenticationService>();

  void signUp() {
    _authenticationService.signUp(
        emailValue ?? "", passwordValue ?? "", nameValue ?? "");
  }
}
