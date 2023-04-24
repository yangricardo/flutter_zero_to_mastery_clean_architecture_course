import 'package:either_dart/either.dart';
import 'package:todo_app/domain/failures/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
