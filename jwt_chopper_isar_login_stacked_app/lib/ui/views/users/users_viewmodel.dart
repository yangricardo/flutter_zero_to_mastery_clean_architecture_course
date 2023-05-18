import 'package:jwt_chopper_isar_login_stacked_app/app/app.bottomsheets.dart';
import 'package:jwt_chopper_isar_login_stacked_app/app/app.locator.dart';
import 'package:jwt_chopper_isar_login_stacked_app/models/api/user.dart';
import 'package:jwt_chopper_isar_login_stacked_app/services/api_service.dart';
import 'package:jwt_chopper_isar_login_stacked_app/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class UsersViewModel extends FutureViewModel<List<User>> {
  final _apiService = locator<ApiService>();

  final _bottomSheetService = locator<BottomSheetService>();

  @override
  Future<List<User>> futureToRun() {
    return _apiService.getUsers();
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }
}
