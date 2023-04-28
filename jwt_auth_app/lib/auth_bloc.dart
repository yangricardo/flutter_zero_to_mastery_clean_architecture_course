import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'api_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FlutterSecureStorage _storage;

  AuthBloc(this._storage) : super(AuthInitial());

  // @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is LoginEvent) {
      try {
        final token = await _login(event.email, event.password);
        await _storage.write(key: 'token', value: token);
        yield AuthSuccess(token);
      } catch (e) {
        yield AuthFailure(e.toString());
      }
    } else if (event is LogoutEvent) {
      await _storage.delete(key: 'token');
      yield AuthInitial();
    } else if (event is CheckAuthEvent) {
      final token = await _storage.read(key: 'token');
      if (token != null) {
        yield AuthSuccess(token);
      } else {
        yield AuthInitial();
      }
    }
  }

  Future<String> _login(String email, String password) async {
    final response = await ApiService.create().login({
      'email': email,
      'password': password,
    });
    final body = response.body as Map<String, dynamic>;
    return body['token'] as String;
  }
}
