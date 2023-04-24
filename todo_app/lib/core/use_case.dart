import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app/domain/failures/failure.dart';

abstract class Params extends Equatable {
  @override
  List<Object?> get props => [];
}

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Params {
  @override
  List<Object?> get props => [];
}
