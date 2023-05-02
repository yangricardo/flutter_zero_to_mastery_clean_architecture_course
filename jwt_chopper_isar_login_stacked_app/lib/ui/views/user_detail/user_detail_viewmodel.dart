import 'package:jwt_chopper_isar_login_stacked_app/app/app.locator.dart';
import 'package:jwt_chopper_isar_login_stacked_app/models/api/user.dart';
import 'package:jwt_chopper_isar_login_stacked_app/services/api_service.dart';
import 'package:stacked/stacked.dart';

class UserDetailViewModel extends FutureViewModel<User?> {
  final _apiService = locator<ApiService>();
  final int userId;
  UserDetailViewModel(this.userId);

  @override
  Future<User?> futureToRun() async {
    return _apiService.getUserById(userId);
  }
}
