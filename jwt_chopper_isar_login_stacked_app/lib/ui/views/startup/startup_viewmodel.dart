import 'package:stacked/stacked.dart';
import 'package:jwt_chopper_isar_login_stacked_app/services/authentication_service.dart';
import 'package:jwt_chopper_isar_login_stacked_app/app/app.locator.dart';
import 'package:jwt_chopper_isar_login_stacked_app/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _authenticationService = locator<AuthenticationService>();
  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    bool isLoggedIn = await Future.delayed(const Duration(seconds: 3),
        () => _authenticationService.userLoggedIn());
    if (isLoggedIn) {
      // 3. Navigate to HomeView
      _navigationService.clearStackAndShow(Routes.homeView,
          arguments: const HomeViewArguments(startingIndex: 1));
    } else {
      // 4. Or navigate to LoginView
      _navigationService.clearStackAndShow(Routes.loginView);
    }
  }
}
