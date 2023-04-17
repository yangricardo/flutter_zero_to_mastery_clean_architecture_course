import 'package:advicer_app/application/core/services/theme.service.dart';
import 'package:advicer_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'application/pages/advice/advice.page.dart';
import 'injection.dart' as dependency_injection_container;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dependency_injection_container.init();
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeService(),
    child: const AdvicerApp(),
  ));
}

class AdvicerApp extends StatelessWidget {
  const AdvicerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(builder: (context, themeService, child) {
      return MaterialApp(
        title: 'Advicer APP',
        themeMode: themeService.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        home: const AdvicerPageWrapperProvider(),
        debugShowCheckedModeBanner: false,
      );
    });
  }
}
