import 'package:todo_app/domain/failures/failure.dart';
import 'package:todo_app/domain/entities/unique_id_entity.dart';
import 'package:todo_app/domain/entities/todo_entity.dart';
import 'package:todo_app/domain/entities/todo_collection_entity.dart';
import 'package:either_dart/src/either.dart';
import 'package:todo_app/domain/repositories/todo_repository.dart';

class LocalToDoRepository extends TodoRepository {
  @override
  Future<Either<Failure, bool>> createToDoCollection(
      ToDoCollection collection) {
    // TODO: implement createToDoCollection
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> createToDoEntry(ToDoEntry entry) {
    // TODO: implement createToDoEntry
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<ToDoCollection>>> readToDoCollections() {
    // TODO: implement readToDoCollections
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, ToDoEntry>> readToDoEntry(
      CollectionId collectionId, EntryId entryId) {
    // TODO: implement readToDoEntry
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<EntryId>>> readToDoEntryIds(
      CollectionId collectionId) {
    // TODO: implement readToDoEntryIds
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, ToDoEntry>> updateToDoEntry(
      {required CollectionId collectionId, required EntryId entryId}) {
    // TODO: implement updateToDoEntry
    throw UnimplementedError();
  }
}
