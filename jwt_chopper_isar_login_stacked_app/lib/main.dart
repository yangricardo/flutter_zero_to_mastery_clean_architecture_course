import 'package:flutter/material.dart';
import 'package:jwt_chopper_isar_login_stacked_app/app/app.bottomsheets.dart';
import 'package:jwt_chopper_isar_login_stacked_app/app/app.dialogs.dart';
import 'package:jwt_chopper_isar_login_stacked_app/app/app.locator.dart';
import 'package:jwt_chopper_isar_login_stacked_app/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  setupDialogUi();
  setupBottomSheetUi();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // theme: ThemeData.dark(useMaterial3: true),
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
        brightness: Brightness.dark,
        fontFamily: 'Roboto',
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            selectedItemColor: Colors.indigoAccent),
        cardTheme: const CardTheme(
            elevation: 100, surfaceTintColor: Colors.indigoAccent),
      ),

      // theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue[900]),
      // theme: Theme.of(context).copyWith(
      //     colorScheme: const ColorScheme.dark(
      //       primary: Colors.blue,
      //       secondary: Colors.blue,
      //     ),
      //     useMaterial3: true),
      // theme: ThemeData(
      //   useMaterial3: true,
      //   appBarTheme: const AppBarTheme(
      //     backgroundColor: Colors.indigo,
      //   ),
      //   cardTheme: const CardTheme(
      //     color: Colors.black,
      //   ),
      //   colorScheme: const ColorScheme.dark(
      //     primary: Colors.indigo,
      //     secondary: Colors.black,
      //     background: Colors.indigo,
      //   ),
      // ),
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
