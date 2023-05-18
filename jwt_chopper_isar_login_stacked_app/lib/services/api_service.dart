import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:jwt_chopper_isar_login_stacked_app/app/app.locator.dart';
import 'package:jwt_chopper_isar_login_stacked_app/models/api/user.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

part "api_service.chopper.dart";

@ChopperApi(baseUrl: '/api')
abstract class ApiClientServiceInterface extends ChopperService {
  static ApiClientServiceInterface create([ChopperClient? client]) =>
      _$ApiClientServiceInterface(client);

  @Get(path: "/users")
  Future<Response> getUsers();

  @Get(path: "/users/{userId}")
  Future<Response> getUserById(@Path("userId") int userId);
}

class ApiService with ListenableServiceMixin {
  final _dialogService = locator<DialogService>();

  final client = ChopperClient(
    baseUrl: Uri.parse('https://jsonplaceholder.typicode.com/'),
    services: [
      ApiClientServiceInterface.create(),
    ],
    converter: const JsonConverter(),
    errorConverter: const JsonConverter(),
  );

  ApiClientServiceInterface _getClientService() {
    return client.getService<ApiClientServiceInterface>();
  }

  Future<List<User>> getUsers() async {
    try {
      final response = await _getClientService().getUsers();
      if (response.isSuccessful) {
        final users = response.body as List;
        return users.map((user) => User.fromJson(user)).toList();
      } else {
        return [];
      }
    } catch (e) {
      _dialogService.showConfirmationDialog(
        title: 'Error',
        description: e.toString(),
        cancelTitle: 'Cancel',
        confirmationTitle: 'Ok',
      );
      rethrow;
    }
  }

  Future<User?> getUserById(int userId) async {
    final response = await _getClientService().getUserById(userId);
    debugPrint(response.base.request?.url.toString());
    if (response.isSuccessful) {
      final user = response.body as Map<String, dynamic>;
      return User.fromJson(user);
    } else {
      return null;
    }
  }
}
