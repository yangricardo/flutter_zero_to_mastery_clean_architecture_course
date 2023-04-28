import 'package:chopper/chopper.dart';

part "api_service.chopper.dart";

@ChopperApi(baseUrl: '/api')
abstract class ApiServiceInterface extends ChopperService {}

class ApiService {}
