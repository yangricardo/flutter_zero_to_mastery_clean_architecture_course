import 'package:todo_app/data/data_sources/interfaces/todo_local_data_source_interface.dart';
import 'package:todo_app/data/data_sources/models/todo_collection_model.dart';
import 'package:todo_app/data/data_sources/models/todo_entry_model.dart';
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
      ToDoCollection collection) async {
    try {
      final result = await localDataSource.createToDoCollection(
          collection: ToDoCollection.toToDoCollectionModel(collection));
      return Right(result);
    } on CacheException catch (e) {
      return Future.value(Left(CacheFailure(stackTrace: e.toString())));
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure(stackTrace: e.toString())));
    }
  }

  @override
  Future<Either<Failure, bool>> createToDoEntry(
      CollectionId collectionId, ToDoEntry entry) async {
    try {
      final result = await localDataSource.createToDoEntry(
          entry: ToDoEntry.toToDoEntryModel(entry),
          collectionId: collectionId.value);
      return Right(result);
    } on CacheException catch (e) {
      return Future.value(Left(CacheFailure(stackTrace: e.toString())));
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure(stackTrace: e.toString())));
    }
  }

  @override
  Future<Either<Failure, List<ToDoCollection>>> readToDoCollections() async {
    try {
      final result = await localDataSource.getToDoCollections();
      final todoCollections =
          result.map((e) => ToDoCollectionModel.toToDoCollection(e)).toList();
      return Right(todoCollections);
    } on CacheException catch (e) {
      return Future.value(Left(CacheFailure(stackTrace: e.toString())));
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure(stackTrace: e.toString())));
    }
  }

  @override
  Future<Either<Failure, ToDoEntry>> readToDoEntry(
      CollectionId collectionId, EntryId entryId) async {
    try {
      final result = await localDataSource.getToDoEntry(
          collectionId: collectionId.value, entryId: entryId.value);
      return Right(ToDoEntryModel.toToDoEntry(result));
    } on CacheException catch (e) {
      return Future.value(Left(CacheFailure(stackTrace: e.toString())));
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure(stackTrace: e.toString())));
    }
  }

  @override
  Future<Either<Failure, List<EntryId>>> readToDoEntryIds(
      CollectionId collectionId) async {
    try {
      final entries = await localDataSource.getToDoEntryIds(
          collectionId: collectionId.value);
      return Right(entries.map((e) => EntryId.fromUniqueString(e)).toList());
    } on CacheException catch (e) {
      return Future.value(Left(CacheFailure(stackTrace: e.toString())));
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure(stackTrace: e.toString())));
    }
  }

  @override
  Future<Either<Failure, ToDoEntry>> updateToDoEntry(
      {required CollectionId collectionId, required EntryId entryId}) async {
    try {
      final entry = await localDataSource.updateToDoEntry(
          collectionId: collectionId.value, entryId: entryId.value);
      return Right(ToDoEntryModel.toToDoEntry(entry));
    } on CacheException catch (e) {
      return Future.value(Left(CacheFailure(stackTrace: e.toString())));
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure(stackTrace: e.toString())));
    }
  }
}
