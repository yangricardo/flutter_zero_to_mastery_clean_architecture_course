import 'package:either_dart/either.dart';
import 'package:todo_app/domain/entities/todo_collection_entity.dart';
import 'package:todo_app/domain/entities/todo_entity.dart';
import 'package:todo_app/domain/entities/unique_id_entity.dart';
import 'package:todo_app/domain/failures/failure.dart';

abstract class TodoRepository {
  Future<Either<Failure, List<ToDoCollection>>> readToDoCollections();
  Future<Either<Failure, ToDoEntry>> readToDoEntry(
      CollectionId collectionId, EntryId entryId);
}
