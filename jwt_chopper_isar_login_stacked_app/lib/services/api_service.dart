import 'package:chopper/chopper.dart';

part "api_service.chopper.dart";

@ChopperApi(baseUrl: '/api')
abstract class ApiServiceInterface extends ChopperService {}

class ApiService extends _$ApiServiceInterface {
  static ChopperClient chopper = ChopperClient(
    baseUrl: Uri.parse('http://localhost:3000'),
    services: [
      ApiService(),
    ],
    converter: const JsonConverter(),
  );

  ApiService() : super(ApiService.chopper);
}
