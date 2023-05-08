import 'dart:math';
import 'package:jwt_chopper_isar_login_stacked_app/app/app.dialogs.dart';
import 'package:jwt_chopper_isar_login_stacked_app/app/app.locator.dart';
import 'package:jwt_chopper_isar_login_stacked_app/app/app.router.dart';
import 'package:jwt_chopper_isar_login_stacked_app/data/isar/user_collection.dart';
import 'package:jwt_chopper_isar_login_stacked_app/services/local_data_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AuthenticationService with ListenableServiceMixin {
  final _navigationService = locator<NavigationService>();
  final _localDataService = locator<LocalDataService>();
  final _dialogService = locator<DialogService>();
  bool loggedIn = false;

  bool userLoggedIn() {
    return loggedIn;
  }

  Future<void> login(String email, String password) async {
    User? user = await _localDataService.getUserByEmail(email);
    if (user == null) {
      loggedIn = false;
      _dialogService.showCustomDialog(
        variant: DialogType.infoAlert,
        title: 'Login Error',
        description: 'email not found',
      );
    } else {
      if (password != user.password) {
        loggedIn = false;
        _dialogService.showCustomDialog(
          variant: DialogType.infoAlert,
          title: 'Login Error',
          description: 'password not match',
        );
      } else {
        loggedIn = true;
        Random random = Random();
        _navigationService.clearStackAndShow(Routes.homeView,
            arguments: HomeViewArguments(
                startingIndex: user.id ?? random.nextInt(1000)));
      }
    }
    notifyListeners();
  }

  void logout() {
    loggedIn = false;
    _navigationService.clearStackAndShow(Routes.loginView);
    notifyListeners();
  }

  Future<int> signUp(String email, String password, String name) {
    return _localDataService.createOrUpdateUser(User()
      ..name = name
      ..email = email
      ..password = password);
  }
}
