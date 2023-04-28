import 'package:chopper/chopper.dart';

part 'api_service.chopper.dart';

@ChopperApi()
abstract class ApiService extends ChopperService {
  @Post(path: '/login')
  Future<Response<dynamic>> login(@Body() Map<String, dynamic> body);

  @Get(path: '/user')
  Future<Response<dynamic>> getUser(@Header('Authorization') String token);

  static ApiService create() {
    final client = ChopperClient(
      baseUrl: Uri.parse('http://localhost:3000'),
      services: [
        _$ApiService(),
      ],
      converter: const JsonConverter(),
      interceptors: [
        HttpLoggingInterceptor(),
      ],
    );
    return _$ApiService(client);
  }
}
