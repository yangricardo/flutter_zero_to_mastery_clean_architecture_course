import 'package:chopper/chopper.dart';

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

  ApiClientServiceInterface getClientService() {
    return client.getService<ApiClientServiceInterface>();
  }
}
