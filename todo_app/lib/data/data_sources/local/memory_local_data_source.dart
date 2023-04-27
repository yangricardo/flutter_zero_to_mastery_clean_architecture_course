import 'package:todo_app/data/data_sources/interfaces/todo_local_data_source_interface.dart';
import 'package:todo_app/data/data_sources/models/todo_entry_model.dart';
import 'package:todo_app/data/data_sources/models/todo_collection_model.dart';
import 'package:todo_app/data/exceptions/exceptions.dart';

class MemoryLocalDataSource implements ToDoLocalDataSourceInterface {
  final List<ToDoCollectionModel> todoCollections = [];
  final Map<String, List<ToDoEntryModel>> todoEntries = {};

  @override
  Future<bool> createToDoCollection({required ToDoCollectionModel collection}) {
    try {
      todoCollections.add(collection);
      todoEntries.putIfAbsent(collection.id, () => []);
      return Future.value(true);
    } on Exception catch (_) {
      throw CacheException();
    }
  }

  @override
  Future<bool> createToDoEntry(
      {required String collectionId, required ToDoEntryModel entry}) {
    try {
      final hasCollectionId = todoEntries.containsKey(collectionId);
      if (hasCollectionId) {
        todoEntries[collectionId]?.add(entry);
        return Future.value(true);
      }
      throw CollectionNotFoundException();
    } on Exception catch (_) {
      throw CacheException();
    }
  }

  @override
  Future<ToDoCollectionModel> getToDoCollection(
      {required String collectionId}) {
    try {
      final collection = todoCollections.firstWhere(
          (element) => element.id == collectionId,
          orElse: () => throw CollectionNotFoundException());
      return Future.value(collection);
    } on Exception catch (_) {
      throw CacheException();
    }
  }

  @override
  Future<List<ToDoCollectionModel>> getToDoCollections() {
    try {
      return Future.value(todoCollections);
    } on Exception catch (_) {
      throw CacheException();
    }
  }

  @override
  Future<List<String>> getToDoCollectionIds() {
    try {
      return Future.value(todoCollections.map((e) => e.id).toList());
    } on Exception catch (_) {
      throw CacheException();
    }
  }

  @override
  Future<ToDoEntryModel> getToDoEntry(
      {required String collectionId, required String entryId}) {
    try {
      if (todoEntries.containsKey(collectionId)) {
        final entry = todoEntries[collectionId]?.firstWhere(
          (entry) => entry.id == entryId,
          orElse: () => throw EntryNotFoundException(),
        );

        return Future.value(entry);
      } else {
        throw CollectionNotFoundException();
      }
    } on Exception catch (_) {
      throw CacheException();
    }
  }

  @override
  Future<List<String>> getToDoEntryIds({required String collectionId}) {
    try {
      if (todoEntries.containsKey(collectionId)) {
        return Future.value(
          todoEntries[collectionId]?.map((entry) => entry.id).toList(),
        );
      } else {
        throw CollectionNotFoundException();
      }
    } on Exception catch (_) {
      throw CacheException();
    }
  }

  @override
  Future<ToDoEntryModel> updateToDoEntry(
      {required String collectionId, required String entryId}) async {
    try {
      final entry =
          await getToDoEntry(collectionId: collectionId, entryId: entryId);
      final updatedEntry = ToDoEntryModel(
        id: entry.id,
        description: entry.description,
        isDone: !entry.isDone,
      );
      final indexOfElement =
          todoEntries[collectionId]?.indexWhere((entry) => entry.id == entryId);
      todoEntries[collectionId]?[indexOfElement!] = updatedEntry;
      return Future.value(updatedEntry);
    } on Exception catch (_) {
      throw CacheException();
    }
  }
}
