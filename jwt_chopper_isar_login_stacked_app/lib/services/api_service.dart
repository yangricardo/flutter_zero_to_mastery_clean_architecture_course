import 'package:chopper/chopper.dart';

part "api_service.chopper.dart";

@ChopperApi(baseUrl: '/api')
abstract class ApiServiceInterface extends ChopperService {
  @Get(path: "/users")
  Future<Response> getUsers();
}

class ApiService extends _$ApiServiceInterface {
  static ChopperClient chopper = ChopperClient(
    baseUrl: Uri.parse('https://jsonplaceholder.typicode.com/users'),
    services: [
      ApiService(),
    ],
    converter: const JsonConverter(),
  );

  ApiService() : super(ApiService.chopper);
}
