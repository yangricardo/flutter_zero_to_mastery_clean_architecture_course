import 'package:jwt_chopper_isar_login_stacked_app/app/app.bottomsheets.dart';
import 'package:jwt_chopper_isar_login_stacked_app/app/app.dialogs.dart';
import 'package:jwt_chopper_isar_login_stacked_app/app/app.locator.dart';
import 'package:jwt_chopper_isar_login_stacked_app/app/app.router.dart';
import 'package:jwt_chopper_isar_login_stacked_app/models/api/user.dart';
import 'package:jwt_chopper_isar_login_stacked_app/services/api_service.dart';
import 'package:jwt_chopper_isar_login_stacked_app/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _apiService = locator<ApiService>();

  final _navigationService = locator<NavigationService>();
  String get counterLabel => 'Counter is: $_counter';

  int _counter = 0;

  List<User> users = [];

  bool isLoading = false;

  HomeViewModel() {
    getUsers();
  }

  void logout() {
    _navigationService.clearStackAndShow(Routes.loginView);
  }

  void goToTextReverseFormView() {
    _navigationService.navigateToTextReverseView();
  }

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

  void getUsers() {
    isLoading = true;
    rebuildUi();
    _apiService.getUsers().then((value) {
      users = value;
      isLoading = false;
      rebuildUi();
    });
  }

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Stacked Rocks!',
      description: 'Give stacked $_counter stars on Github',
    );
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }
}
