import 'dart:math';
import 'package:jwt_chopper_isar_login_stacked_app/app/app.dialogs.dart';
import 'package:jwt_chopper_isar_login_stacked_app/app/app.locator.dart';
import 'package:jwt_chopper_isar_login_stacked_app/app/app.router.dart';
import 'package:jwt_chopper_isar_login_stacked_app/data/isar/user_collection.dart';
import 'package:jwt_chopper_isar_login_stacked_app/services/local_data_service.dart';
import 'package:jwt_chopper_isar_login_stacked_app/services/web3_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:web3dart/web3dart.dart';

class AuthenticationService with ListenableServiceMixin {
  final _navigationService = locator<NavigationService>();
  final _localDataService = locator<LocalDataService>();
  final _dialogService = locator<DialogService>();
  final _web3Service = locator<Web3Service>();
  bool loggedIn = false;
  User? user;
  Wallet? wallet;

  bool userLoggedIn() {
    return loggedIn;
  }

  Future<void> login(String email, String password) async {
    wallet = null;
    user = await _localDataService.getUserByEmail(email);
    if (user == null) {
      loggedIn = false;
      await _dialogService.showCustomDialog(
        variant: DialogType.infoAlert,
        title: 'Login Error',
        description: 'email not found',
      );
    } else {
      if (user?.wallet != null) {
        try {
          wallet = _web3Service.openWalletFromJSON(user!.wallet!, password);
          await _dialogService.showCustomDialog(
            variant: DialogType.infoAlert,
            title: 'Login Success',
            description: 'Wallet successfully opened',
          );
          loggedIn = true;
        } catch (e) {
          loggedIn = false;
          await _dialogService.showCustomDialog(
            variant: DialogType.infoAlert,
            title: 'Login Error',
            description: 'password not match or could not open the wallet',
          );
        }
      } else {
        wallet = _web3Service.createRandomWallet(password);
        user?.ethereumAddress = wallet?.privateKey.address.hex;
        user?.wallet = wallet?.toJson();
        _localDataService.createOrUpdateUser(user!);
        // TODO: refactor to redirect to create wallet page
        await _dialogService.showCustomDialog(
          variant: DialogType.infoAlert,
          title: 'Login Success',
          description: 'A Wallet new were created',
        );
        loggedIn = true;
      }
      if (loggedIn == true) {
        Random random = Random();
        _navigationService.clearStackAndShow(Routes.homeView,
            arguments: HomeViewArguments(
                startingIndex: user?.id ?? random.nextInt(1000)));
      }
    }

    notifyListeners();
  }

  void logout() {
    loggedIn = false;
    _navigationService.clearStackAndShow(Routes.loginView);
    notifyListeners();
  }

  Future<void> signUp(String email, String password, String name) async {
    User? user = await _localDataService.getUserByEmail(email);
    if (user != null) {
      await _dialogService.showCustomDialog(
        variant: DialogType.infoAlert,
        title: 'Sign Up Error',
        description: 'email already exist',
      );
    } else {
      wallet = _web3Service.createRandomWallet(password);
      _localDataService.createOrUpdateUser(User()
        ..name = name
        ..email = email
        ..ethereumAddress = wallet?.privateKey.address.hex
        ..wallet = wallet?.toJson());
      await _dialogService.showCustomDialog(
        variant: DialogType.infoAlert,
        title: 'Sign Up Success',
        description: 'Go back to previous page and try to login',
      );
      _navigationService.back();
    }
  }
}
