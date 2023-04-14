import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final int id;

  const Failure({required this.id});

  @override
  List<Object?> get props => [id];
}

class ServerFailure extends Failure {
  const ServerFailure({required super.id});
}

class CacheFailure extends Failure {
  const CacheFailure({required super.id});
}

class GeneralFailure extends Failure {
  const GeneralFailure({required super.id});
}

const generalFailureMessage = 'Ups, something gone wrong. Please try again!';
const serverFailureMessage = 'Ups, API Error. please try again!';
const cacheFailureMessage = 'Ups, cache failed. Please try again!';

String mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return "${failure.id} - $serverFailureMessage";
    case CacheFailure:
      return "${failure.id} - $cacheFailureMessage";
    default:
      return "${failure.id} - $generalFailureMessage";
  }
}
