import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/app/basic_app.dart';
import 'package:todo_app/data/data_sources/local/hive_local_data_source.dart';
import 'package:todo_app/data/repositories/todo_repository_local.dart';
import 'package:todo_app/domain/repositories/todo_repository.dart';

void main() async {
  final localDataSource = HiveLocalDataSource();
  await localDataSource.init();
  runApp(RepositoryProvider<TodoRepository>(
    create: (context) => LocalToDoRepository(
      localDataSource: localDataSource,
    ),
    child: const BasicApp(),
  ));
}
