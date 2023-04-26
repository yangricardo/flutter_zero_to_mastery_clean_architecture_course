import 'package:todo_app/domain/entities/todo_color_entity.dart';
import 'package:todo_app/domain/entities/todo_entity.dart';
import 'package:todo_app/domain/entities/unique_id_entity.dart';
import 'package:todo_app/domain/failures/failure.dart';
import 'package:todo_app/domain/entities/todo_collection_entity.dart';
import 'package:either_dart/either.dart';
import 'package:todo_app/domain/repositories/todo_repository.dart';

class TodoRepositoryMock implements TodoRepository {
  final toDoCollections = List<ToDoCollection>.generate(
      10,
      (index) => ToDoCollection(
          id: CollectionId.fromUniqueString(index.toString()),
          title: 'Task $index',
          color: ToDoColor(
              colorIndex: index % ToDoColor.predefinedColors.length)));

  final List<ToDoEntry> toDoEntries = List.generate(
    100,
    (index) => ToDoEntry(
      id: EntryId.fromUniqueString(index.toString()),
      description: 'description $index',
      isDone: false,
    ),
  );

  @override
  Future<Either<Failure, List<ToDoCollection>>> readToDoCollections() {
    return Future.delayed(
        const Duration(milliseconds: 200), () => Right(toDoCollections));
  }

  @override
  Future<Either<Failure, ToDoEntry>> readToDoEntry(
      CollectionId collectionId, EntryId entryId) {
    try {
      final selectedEntryItem = toDoEntries.firstWhere(
        (element) => element.id == entryId,
      );

      return Future.delayed(
        const Duration(milliseconds: 200),
        () => Right(selectedEntryItem),
      );
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure(stackTrace: e.toString())));
    }
  }

  @override
  Future<Either<Failure, List<EntryId>>> readToDoEntryIds(
      CollectionId collectionId) {
    try {
      final startIndex = int.parse(collectionId.value) * 10;
      final endIndex = startIndex + 10;
      final entryIds = toDoEntries
          .sublist(startIndex, endIndex)
          .map((entry) => entry.id)
          .toList();

      return Future.delayed(
        const Duration(milliseconds: 300),
        () => Right(entryIds),
      );
    } on Exception catch (e) {
      return Future.value(Left(ServerFailure(stackTrace: e.toString())));
    }
  }

  @override
  Future<Either<Failure, ToDoEntry>> updateToDoEntry(
      {required CollectionId collectionId, required EntryId entryId}) {
    final index = toDoEntries.indexWhere((element) => element.id == entryId);
    final entryToUpdate = toDoEntries[index];
    final updatedEntry =
        toDoEntries[index].copyWith(isDone: !entryToUpdate.isDone);
    toDoEntries[index] = updatedEntry;

    return Future.delayed(
        const Duration(milliseconds: 100), () => Right(updatedEntry));
  }

  @override
  Future<Either<Failure, bool>> createToDoCollection(
      ToDoCollection collection) {
    toDoCollections.add(collection);
    return Future.delayed(
        const Duration(milliseconds: 100), () => const Right(true));
  }
}
