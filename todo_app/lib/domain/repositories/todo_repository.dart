import 'package:either_dart/either.dart';
import 'package:todo_app/domain/entities/todo_collection_entity.dart';
import 'package:todo_app/domain/failures/failure.dart';

abstract class TodoRepository {
  Future<Either<Failure, List<ToDoCollection>>> readToDoCollections();
}
