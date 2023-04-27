import 'package:either_dart/either.dart';
import 'package:todo_app/core/use_case.dart';
import 'package:todo_app/domain/failures/failure.dart';
import 'package:todo_app/domain/repositories/todo_repository.dart';

class CreateTodoEntry implements UseCase<bool, ToDoEntryParams> {
  final TodoRepository todoRepository;

  CreateTodoEntry({required this.todoRepository});

  @override
  Future<Either<Failure, bool>> call(ToDoEntryParams params) {
    try {
      final result =
          todoRepository.createToDoEntry(params.collectionId, params.entry);
      return result.fold((left) => Left(left), (right) => Right(right));
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure(stackTrace: e.toString())));
    }
  }
}
