import 'dart:math';
import 'package:jwt_chopper_isar_login_stacked_app/app/app.locator.dart';
import 'package:jwt_chopper_isar_login_stacked_app/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AuthenticationService with ListenableServiceMixin {
  final _navigationService = locator<NavigationService>();
  bool loggedIn = false;

  bool userLoggedIn() {
    return loggedIn;
  }

  void login() {
    loggedIn = true;
    final random = Random();
    _navigationService.clearStackAndShow(Routes.homeView,
        arguments: HomeViewArguments(startingIndex: random.nextInt(1000)));
    notifyListeners();
  }

  void logout() {
    loggedIn = false;
    _navigationService.clearStackAndShow(Routes.loginView);
    notifyListeners();
  }
}
