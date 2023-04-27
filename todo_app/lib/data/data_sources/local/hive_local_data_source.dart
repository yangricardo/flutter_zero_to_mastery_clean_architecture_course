import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/data/data_sources/interfaces/todo_local_data_source_interface.dart';
import 'package:todo_app/data/data_sources/models/todo_entry_model.dart';
import 'package:todo_app/data/data_sources/models/todo_collection_model.dart';
import 'package:todo_app/data/exceptions/exceptions.dart';

const String collectionsBox = 'collections';
const String entriesBox = 'entries';

class HiveLocalDataSource implements ToDoLocalDataSourceInterface {
  late BoxCollection todoCollections;

  bool isInitialize = false;

  Future<void> init() async {
    if (!isInitialize) {
      todoCollections = await BoxCollection.open(
          'todo', {collectionsBox, entriesBox},
          path: "./");
      isInitialize = true;
    } else {
      debugPrint('HiveLocalDataSource is already initialized');
    }
  }

  Future<CollectionBox<Map>> _openCollectionBox() async {
    return todoCollections.openBox<Map>(collectionsBox);
  }

  Future<CollectionBox<Map>> _openEntriesBox() async {
    return todoCollections.openBox<Map>(entriesBox);
  }

  @override
  Future<bool> createToDoCollection(
      {required ToDoCollectionModel collection}) async {
    final collections = await _openCollectionBox();
    final entries = await _openEntriesBox();
    await collections.put(collection.id, collection.toJson());
    await entries.put(collection.id, <String, dynamic>{});
    return true;
  }

  @override
  Future<bool> createToDoEntry(
      {required String collectionId, required ToDoEntryModel entry}) async {
    final entries = await _openEntriesBox();
    final entryList = await entries.get(collectionId);
    if (entryList == null) throw CollectionNotFoundException();
    entryList
        .cast<String, dynamic>()
        .putIfAbsent(entry.id, () => entry.toJson());
    await entries.put(collectionId, entryList);
    return true;
  }

  @override
  Future<ToDoCollectionModel> getToDoCollection(
      {required String collectionId}) async {
    final collections = await _openCollectionBox();
    final collection =
        (await collections.get(collectionId))?.cast<String, dynamic>();
    if (collection == null) throw CollectionNotFoundException();
    return ToDoCollectionModel.fromJson(collection);
  }

  @override
  Future<List<String>> getToDoCollectionIds() async {
    final collections = await _openCollectionBox();
    final collectionIds = await collections.getAllKeys();
    return collectionIds;
  }

  @override
  Future<List<ToDoCollectionModel>> getToDoCollections() async {
    final collectionList = await getToDoCollectionIds();
    List<ToDoCollectionModel> collections = [];
    for (var collectionId in collectionList) {
      ToDoCollectionModel collection =
          await getToDoCollection(collectionId: collectionId);
      collections.add(collection);
    }
    return collections;
  }

  @override
  Future<ToDoEntryModel> getToDoEntry(
      {required String collectionId, required String entryId}) async {
    final entries = await _openEntriesBox();
    final entryList = await entries.get(collectionId);

    if (entryList == null) throw CollectionNotFoundException();

    if (!entryList.containsKey(entryId)) throw EntryNotFoundException();

    final entry = entryList[entryId].cast<String, dynamic>();
    return ToDoEntryModel.fromJson(entry);
  }

  @override
  Future<List<String>> getToDoEntryIds({required String collectionId}) async {
    final entries = await _openEntriesBox();
    final entryList = await entries.get(collectionId);

    if (entryList == null) throw CollectionNotFoundException();

    final entryIdList = entryList.cast<String, dynamic>().keys.toList();

    return entryIdList;
  }

  @override
  Future<ToDoEntryModel> updateToDoEntry(
      {required String collectionId, required String entryId}) async {
    final entries = await _openEntriesBox();
    final entryList = await entries.get(collectionId);

    if (entryList == null) throw CollectionNotFoundException();

    if (!entryList.containsKey(entryId)) throw EntryNotFoundException();

    final entry =
        ToDoEntryModel.fromJson(entryList[entryId].cast<String, dynamic>());

    final updatedEntry = ToDoEntryModel(
      id: entry.id,
      description: entry.description,
      isDone: !entry.isDone,
    );

    entryList[entryId] = updatedEntry.toJson();

    await entries.put(collectionId, entryList);

    return updatedEntry;
  }
}
