import 'package:either_dart/either.dart';
import 'package:todo_app/core/use_case.dart';
import 'package:todo_app/domain/entities/todo_collection_entity.dart';
import 'package:todo_app/domain/failures/failure.dart';
import 'package:todo_app/domain/repositories/todo_repository.dart';

class LoadToDoCollections implements UseCase<List<ToDoCollection>, NoParams> {
  const LoadToDoCollections({required this.todoRepository});
  final TodoRepository todoRepository;

  @override
  Future<Either<Failure, List<ToDoCollection>>> call(NoParams params) async {
    try {
      final loadedCollections = todoRepository.readToDoCollections();
      return loadedCollections.fold(
          (left) => Left(left), (right) => Right(right));
    } on Exception catch (e) {
      return Left(ServerFailure(stackTrace: e.toString()));
    }
  }
}
