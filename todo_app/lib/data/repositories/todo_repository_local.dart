import 'package:todo_app/data/data_sources/interfaces/todo_local_data_source_interface.dart';
import 'package:todo_app/data/exceptions/exceptions.dart';
import 'package:todo_app/domain/failures/failure.dart';
import 'package:todo_app/domain/entities/unique_id_entity.dart';
import 'package:todo_app/domain/entities/todo_entity.dart';
import 'package:todo_app/domain/entities/todo_collection_entity.dart';
import 'package:either_dart/either.dart';
import 'package:todo_app/domain/repositories/todo_repository.dart';

class LocalToDoRepository extends TodoRepository {
  final ToDoLocalDataSourceInterface localDataSource;

  LocalToDoRepository({required this.localDataSource});

  @override
  Future<Either<Failure, bool>> createToDoCollection(
      ToDoCollection collection) {
    try {
      // TODO: implement createToDoCollection
      throw UnimplementedError();
    } on CacheException catch (e) {
      return Future.value(Left(CacheFailure(stackTrace: e.toString())));
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure(stackTrace: e.toString())));
    }
  }

  @override
  Future<Either<Failure, bool>> createToDoEntry(ToDoEntry entry) {
    try {
      // TODO: implement createToDoEntry
      throw UnimplementedError();
    } on CacheException catch (e) {
      return Future.value(Left(CacheFailure(stackTrace: e.toString())));
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure(stackTrace: e.toString())));
    }
  }

  @override
  Future<Either<Failure, List<ToDoCollection>>> readToDoCollections() {
    try {
      // TODO: implement readToDoCollections
      throw UnimplementedError();
    } on CacheException catch (e) {
      return Future.value(Left(CacheFailure(stackTrace: e.toString())));
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure(stackTrace: e.toString())));
    }
  }

  @override
  Future<Either<Failure, ToDoEntry>> readToDoEntry(
      CollectionId collectionId, EntryId entryId) {
    try {
      // TODO: implement readToDoEntry
      throw UnimplementedError();
    } on CacheException catch (e) {
      return Future.value(Left(CacheFailure(stackTrace: e.toString())));
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure(stackTrace: e.toString())));
    }
  }

  @override
  Future<Either<Failure, List<EntryId>>> readToDoEntryIds(
      CollectionId collectionId) {
    try {
      // TODO: implement readToDoEntryIds
      throw UnimplementedError();
    } on CacheException catch (e) {
      return Future.value(Left(CacheFailure(stackTrace: e.toString())));
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure(stackTrace: e.toString())));
    }
  }

  @override
  Future<Either<Failure, ToDoEntry>> updateToDoEntry(
      {required CollectionId collectionId, required EntryId entryId}) {
    try {
      // TODO: implement updateToDoEntry
      throw UnimplementedError();
    } on CacheException catch (e) {
      return Future.value(Left(CacheFailure(stackTrace: e.toString())));
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure(stackTrace: e.toString())));
    }
  }
}
