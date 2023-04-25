import 'package:either_dart/either.dart';
import 'package:todo_app/core/use_case.dart';
import 'package:todo_app/domain/entities/todo_entity.dart';
import 'package:todo_app/domain/failures/failure.dart';
import 'package:todo_app/domain/repositories/todo_repository.dart';

class LoadToDoEntry implements UseCase<ToDoEntry, ToDoEntryIdsParam> {
  const LoadToDoEntry({required this.todoRepository});
  final TodoRepository todoRepository;

  @override
  Future<Either<Failure, ToDoEntry>> call(ToDoEntryIdsParam params) {
    try {
      final loadedEntry = todoRepository.readToDoEntry(
        params.collectionId,
        params.entryId,
      );

      return loadedEntry.fold(
        (left) => Left(left),
        (right) => Right(right),
      );
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure(stackTrace: e.toString())));
    }
  }
}
