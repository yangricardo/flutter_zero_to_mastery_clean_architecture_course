import 'package:advicer_app/application/pages/advice/cubit/advicer_cubit.dart';
import 'package:advicer_app/data/datasources/advice.remote.datasource.dart';
import 'package:advicer_app/data/repositories/advice.repo.impl.dart';
import 'package:advicer_app/domain/repositories/advice.repo.dart';
import 'package:advicer_app/domain/usecases/advice.usecases.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final serviceLocator = GetIt.I;

Future<void> init() async {
  // ! application layer
  // Factory = every time a new fresh instance for that class
  serviceLocator
      .registerFactory(() => AdvicerCubit(adviceUseCases: serviceLocator()));

  // ! domain layer
  serviceLocator
      .registerFactory(() => AdviceUseCases(adviceRepo: serviceLocator()));

  // ! data layer
  serviceLocator.registerFactory<AdviceRepo>(
      () => AdviceRepoImpl(adviceRemoteDatasource: serviceLocator()));
  serviceLocator.registerFactory<AdviceRemoteDatasource>(
      () => AdviceRemoteDatasourceImpl(client: serviceLocator()));

  // ! externs
  serviceLocator.registerFactory(() => http.Client());
}
