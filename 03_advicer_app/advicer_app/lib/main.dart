import 'package:advicer_app/application/core/services/theme.service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeService(),
    child: const AdvicerApp(),
  ));
}

class AdvicerApp extends StatelessWidget {
  const AdvicerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Advicer APP',
      themeMode: ThemeMode.light,
      home: Placeholder(),
    );
  }
}
