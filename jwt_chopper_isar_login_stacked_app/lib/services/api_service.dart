import 'package:chopper/chopper.dart';
import 'package:jwt_chopper_isar_login_stacked_app/models/api/user.dart';

part "api_service.chopper.dart";

@ChopperApi(baseUrl: '/api')
abstract class ApiClientServiceInterface extends ChopperService {
  static ApiClientServiceInterface create([ChopperClient? client]) =>
      _$ApiClientServiceInterface(client);

  @Get(path: "/users")
  Future<Response> getUsers();
}

class ApiService {
  final client = ChopperClient(
    baseUrl: Uri.parse('https://jsonplaceholder.typicode.com/users'),
    services: [
      ApiClientServiceInterface.create(),
    ],
    converter: const JsonConverter(),
  );

  ApiClientServiceInterface _getClientService() {
    return client.getService<ApiClientServiceInterface>();
  }

  Future<List<User>> getUsers() async {
    final response = await _getClientService().getUsers();
    if (response.isSuccessful) {
      final users = response.body as List;
      return users.map((user) => User.fromJson(user)).toList();
    } else {
      return [];
    }
  }
}
