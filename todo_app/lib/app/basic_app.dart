import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:todo_app/core/routes.dart';
import 'package:todo_app/pages/home/cubit/navigation_todo_cubit.dart';

class BasicApp extends StatelessWidget {
  const BasicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationTodoCubit(),
      child: MaterialApp.router(
        title: 'Todo App',
        localizationsDelegates: const [
          ...GlobalMaterialLocalizations.delegates,
          GlobalMaterialLocalizations.delegate
        ],
        themeMode: ThemeMode.system,
        theme: ThemeData.from(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.deepOrange, brightness: Brightness.light)),
        routerConfig: routes,
      ),
    );
  }
}
