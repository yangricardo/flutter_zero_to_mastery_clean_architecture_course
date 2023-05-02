import 'package:jwt_chopper_isar_login_stacked_app/app/app.locator.dart';
import 'package:jwt_chopper_isar_login_stacked_app/models/api/user.dart';
import 'package:jwt_chopper_isar_login_stacked_app/services/api_service.dart';
import 'package:stacked/stacked.dart';

class UsersViewModel extends FutureViewModel<List<User>> {
  final _apiService = locator<ApiService>();

  @override
  Future<List<User>> futureToRun() {
    return _apiService.getUsers();
  }
}
