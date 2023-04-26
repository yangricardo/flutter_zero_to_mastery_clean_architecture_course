import 'package:either_dart/either.dart';
import 'package:todo_app/core/use_case.dart';
import 'package:todo_app/domain/failures/failure.dart';
import 'package:todo_app/domain/repositories/todo_repository.dart';

class CreateTodoCollection implements UseCase<bool, ToDoCollectionParams> {
  final TodoRepository todoRepository;

  CreateTodoCollection({required this.todoRepository});

  @override
  Future<Either<Failure, bool>> call(ToDoCollectionParams params) {
    try {
      final result = todoRepository.createToDoCollection(params.collection);
      return result.fold((left) => Left(left), (right) => Right(right));
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure(stackTrace: e.toString())));
    }
  }
}
