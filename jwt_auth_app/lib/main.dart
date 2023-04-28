import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'auth_bloc.dart';
import 'home_screen.dart';
import 'login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chopper JWT Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => BlocProvider(
              create: (context) =>
                  AuthBloc(_secureStorage)..add(CheckAuthEvent()),
              child: LoginScreen(),
            ),
        '/home': (context) => BlocProvider(
              create: (context) => AuthBloc(_secureStorage),
              child: const HomeScreen(),
            ),
      },
    );
  }
}
