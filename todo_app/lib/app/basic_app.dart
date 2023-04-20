import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class BasicApp extends StatelessWidget {
  const BasicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        title: 'Todo App',
        localizationsDelegates: const [
          ...GlobalMaterialLocalizations.delegates,
          GlobalMaterialLocalizations.delegate
        ],
        themeMode: ThemeMode.system,
        theme: ThemeData.from(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.deepOrange, brightness: Brightness.light)));
  }
}
